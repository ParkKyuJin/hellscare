package com.pro.hellscare.VO;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;


//org.springframework.security.core.userdetails.User; => security가 제공하는 user클래스
// User 클래스는 스프링 시큐리티에 내장된 추상클래스로, 사용자 상세정보를 담는 그릇역할을 하는 클래스 
//User 클래스는 추상클래스이므로 상속받아 추상메서드를 오버라이드해서 구현한다.  
public class UserVO extends User {
	
	private String username; 
	// 두생성자 중 첫번째 선택,  마지막 매개변수에 String userid 추가 
	// super는 부모 User클래스 
	public UserVO(String username1, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, String username) {
		super(username1, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		this.username = username; //추가 
	
	}
	
	
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	@Override
	public String toString() {
		return "UserVO [username=" + username + "]";
	}
	
}