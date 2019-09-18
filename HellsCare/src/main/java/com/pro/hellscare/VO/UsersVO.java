package com.pro.hellscare.VO;

import java.sql.Timestamp;
// ======================2019.08.20_이나현 ======================================

//DTO(Date Transfer Object) = VO (Value Object)
//데이터 전송시키는 역할
public class UsersVO {
   
   //멤버변수
   private String username;
   private String password;
   private String name; 
   private String address;
   private String phone_number;
   private String gender;
   private String birth;
   private String email;
   private Timestamp reg_date;
   private char enabled; //로그인 되게할때 :'1' 로그인 안되게할때:  '0'
   private String apply_code;
   
   
//생성자
   public UsersVO() {}
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getPhone_number() {
      return phone_number;
   }
   public void setPhone_number(String phone_number) {
      this.phone_number = phone_number;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public String getBirth() {
      return birth;
   }
   public void setBirth(String birth) {
      this.birth = birth;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public Timestamp getReg_date() {
      return reg_date;
   }
   public void setReg_date(Timestamp reg_date) {
      this.reg_date = reg_date;
   }
   public char getEnabled() {
      return enabled;
   }
   public void setEnabled(char enabled) {
      this.enabled = enabled;
   }
   public String getApply_code() {
		return apply_code;
   }
   public void setApply_code(String apply_code) {
	this.apply_code = apply_code;
   }

   
}