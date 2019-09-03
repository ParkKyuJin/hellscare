package com.pro.hellscare.VO;

import java.sql.Date;

public class CommentQnaVO {
	
	private int qna_code;		//원글번호
	private String username;  //작성자
	private String content; //글내용

	private Date comment_date;	//작성일
	private int rNum;
	
	
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	
	
	
	
}
