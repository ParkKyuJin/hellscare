package com.pro.hellscare.Service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.http.HttpService;
import org.web3j.utils.Convert;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.Scope;

@Service
public class ClubService {	
	
	private static final Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	private static final Credentials hostCredentials = Credentials.create("bfbbe8f7d376179a0fd9be7dff0697b1f2fc2cfcfb5fecd06291bff0a28e52b5");
	private static final BigInteger gasLimit = new BigInteger("6721975");
	private static final BigInteger gasPrice = new BigInteger("20000000000");
	String contractAddress = "";
    
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
		
    @SuppressWarnings("deprecation")
	public void deploy() throws Exception {    	
    	contractAddress = CreateClub.deploy(web3j, hostCredentials, gasPrice, gasLimit).send().getContractAddress();
    	//  System.out.println(contractAddress);    	    	
    }
    
    @SuppressWarnings("deprecation")
	public void payCreateClub(HttpServletRequest req) throws Exception {
    	String r_name= (String) req.getSession().getAttribute("memId");
    	
    	Credentials new_credentials = Credentials.create("e1bc6e0fc06696e454b1c42286b0b5b0ddcf4eba190976a24e9645924f70485a");

    	byte[] name = stringToBytes32(r_name); 
    	BigInteger price = etherToWei(new BigDecimal(1));
    	
    	CreateClub club = CreateClub.load(contractAddress, web3j, new_credentials, gasPrice, gasLimit);
		club.newCreateClub(new BigInteger("0"), name, price).send();
    }
	
}
