package com.pro.hellscare.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.http.HttpService;
import org.web3j.utils.Convert;
import org.web3j.utils.Convert.Unit;

import com.pro.hellscare.VO.ClubVO;
import com.pro.hellscare.persistence.HellsCareDAO;

@Service
public class ClubService {	
	@Autowired
	HellsCareDAO dao;
	
	// 블록체인 서버(ropsten)와 연결 한다 (default(ganache):localhost:8545)
	private static final Web3j web3j = Web3j.build(new HttpService("https://ropsten.infura.io/v3/171258f48b2c4f26a218cf89708fa0a1"));
	// 호스트계정의  PRIVATE KEY 복사하여 연결
	private static final Credentials hostCredentials = Credentials.create("BFBBE8F7D376179A0FD9BE7DFF0697B1F2FC2CFCFB5FECD06291BFF0A28E52B5");
	// gasLimit과 gasPrice를 설정한다.(고정값은 없으나 너무 작으면 블록생성시 시간이 오래걸린다)
	private static final BigInteger gasLimit = new BigInteger("6721975");
	private static final BigInteger gasPrice = new BigInteger("30000000000");  // gwei로 1이상
	String contractAddress = "";  // deploy된 컨트랙주소를 담을 변수
	Credentials new_credentials = null;  // 개설자의 지갑정보를 얻을수 있는 privatekey를 담을 변수
    
	// etherToWei
	public static BigInteger etherToWei(BigDecimal ether) {
        return Convert.toWei(ether, Convert.Unit.ETHER).toBigInteger();
    }
	
	
	// StringToBytes32
    public static byte[] stringToBytes32(String string) {
        byte[] byteValue = string.getBytes();
        byte[] byteValueLen32 = new byte[32];
        System.arraycopy(byteValue, 0, byteValueLen32, 0, byteValue.length);
        return byteValueLen32;
    }
    		
 // 배포하고 생성된 컨트랙 주소를 변수에 담는다. 생성된 컨트랙주소를 가지고 etherscan에서 확인가능
    @SuppressWarnings("deprecation")
	public void deploy() throws Exception {    	
    	contractAddress = CreateClub.deploy(web3j, hostCredentials, gasPrice, gasLimit).send().getContractAddress();
    	System.out.println(contractAddress);    	    	
    }
    
    // 이더를 전송하는 메소드
    @SuppressWarnings("deprecation")
    public void payCreateClub(HttpServletRequest req, Model model) throws Exception {
    	// 접속자, 개설자의 privatekey, 전송할 이더, 개설신청한 클럽명을 화면에서 받는다.
    	String r_name= (String) req.getSession().getAttribute("memId");
    	String user_key = req.getParameter("user_key");
    	String amount = req.getParameter("amount");
    	String club_name = req.getParameter("club_name");
    	
    	try {    	
	    	// 입력받은 primary key를 사용하여  Credentials를 생성한다.
	    	new_credentials = Credentials.create(user_key);
	    	//System.out.println("Account address: " + new_credentials.getAddress());
	        //System.out.println("Balance: " + Convert.fromWei(web3j.ethGetBalance(new_credentials.getAddress(), DefaultBlockParameterName.LATEST).send().getBalance().toString(), Unit.ETHER));
	
	    	byte[] name = stringToBytes32(r_name); 
	    	BigInteger price = etherToWei(new BigDecimal(amount)); // 입력받은 이더를 웨이로 변환
	    	
	    	// 자바로 변환된 CreateClub의 메소드(load)를 호출하여 사용 : 이더 전송
	    	// 첫번째 매개변수인 contractAddress는 deploy메소드에서얻은 계약주소 
	    	CreateClub club = CreateClub.load(contractAddress, web3j, new_credentials, gasPrice, gasLimit);
	    	// 솔리디티의 newCreateClub을 호출 : 두번째 계정인 new_credentials이 host에게 이더를 전송하기위함
	    	// 첫번재 매개변수는 고정된 매물id인데 사용하지않으므로 0고정시켜도 상관없다.
	    	// 두번째 매개변수는 현재 접속한 세션의 아이디
	    	// 트랜잭션 해쉬값을 변수에 저장한다.(개설비 지불을 확인할수 있는 해쉬값)
			String txHash = club.newCreateClub(new BigInteger("0"), name, price).send().getTransactionHash();
			//System.out.println(txHash);
			
			// 바구니에 담아서
			ClubVO vo = new ClubVO();			
			vo.setClub_name(club_name);
			vo.setClub_master(r_name);
			vo.setHashkey(txHash);
			// DB에 저장한다.
			int updateCnt = dao.payCreateClubDone(vo);
			model.addAttribute("updateCnt", updateCnt);
			
    	} catch (IOException | InterruptedException ex) {
    		throw new RuntimeException(ex);
        }
    }
}
