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
	
	// 가나슈와 연결 한다 : localhost:8545
	private static final Web3j web3j = Web3j.build(new HttpService("https://ropsten.infura.io/v3/171258f48b2c4f26a218cf89708fa0a1"));
	// 호스트에 가나슈 첫번째 계정의  PRIVATE KEY 복사하여 연결
	private static final Credentials hostCredentials = Credentials.create("26B516E3344E0627DDEB4F7C60B50F863EB178A489766D63315623F0CE4C980D");
	// 가나슈의 gasLimit과 gasPrice를 적어준다.
	private static final BigInteger gasLimit = new BigInteger("6721975");
	private static final BigInteger gasPrice = new BigInteger("20000000000");
	String contractAddress = "";
	Credentials new_credentials = null;
    
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
    		
    // 배포함으로서 가나슈에서 Transaction -> CONTRACT CREATION ->  CONTRACT ADDRESS 가 발생하고 정보를 와서 변수에 담고 DB저장하여 사용할수 있다.(사용안함)
    @SuppressWarnings("deprecation")
	public void deploy() throws Exception {    	
    	contractAddress = CreateClub.deploy(web3j, hostCredentials, gasPrice, gasLimit).send().getContractAddress();
    	System.out.println(contractAddress);    	    	
    }
    
    // 이더를 전송하는 메소드
    @SuppressWarnings("deprecation")
	public void payCreateClub(HttpServletRequest req, Model model) throws Exception {
    	String r_name= (String) req.getSession().getAttribute("memId");
    	String user_key = req.getParameter("user_key");
    	String amount = req.getParameter("amount");
    	String club_name = req.getParameter("club_name");
    	
    	try {    	
	    	// 2번째 계정의 primary key를 접속한 동호회 개설자에게 부여한다.
	    	new_credentials = Credentials.create(user_key);
	    	//System.out.println("Account address: " + new_credentials.getAddress());
	        //System.out.println("Balance: " + Convert.fromWei(web3j.ethGetBalance(new_credentials.getAddress(), DefaultBlockParameterName.LATEST).send().getBalance().toString(), Unit.ETHER));
	    	
	
	    	byte[] name = stringToBytes32(r_name); 
	    	BigInteger price = etherToWei(new BigDecimal(amount)); // 개설비는 입력받아 웨이로 변환
	    	
	    	// 자바로 변환된 CreateClub의 메소드(load)를 호출하여 사용 : 이더 전송
	    	// 첫번째 매개변수인 contractAddress는 deploy메소드에서얻은 계약주소 
	    	CreateClub club = CreateClub.load(contractAddress, web3j, new_credentials, gasPrice, gasLimit);
	    	// 솔리디티의 newCreateClub을 호출 : 두번째 계정인 new_credentials이 host에게 1이더를 전송하기위함
	    	// 첫번재 매개변수는 매물id인데 사용하지않아 상관없으므로 0으로 초기화
	    	// 두번째 매개변수는 현재 접속한 세션의 아이디  	
			String txHash = club.newCreateClub(new BigInteger("0"), name, price).send().getTransactionHash();
			System.out.println(txHash);
			
			
			ClubVO vo = new ClubVO();
			
			vo.setClub_name(club_name);
			vo.setClub_master(r_name);
			vo.setHashkey(txHash);
			
			int updateCnt = dao.payCreateClubDone(vo);
			model.addAttribute("updateCnt", updateCnt);
		
    	} catch (IOException | InterruptedException ex) {
    		throw new RuntimeException(ex);
        }
    }


    
	
}
