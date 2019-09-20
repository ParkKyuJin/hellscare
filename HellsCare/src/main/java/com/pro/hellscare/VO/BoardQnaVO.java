package com.pro.hellscare.VO;

import java.sql.Date;

public class BoardQnaVO {
	
	private int qna_code;		//원글번호
	private String username;  //작성자
	private String title; //글제목
	private String content; //글내용
	private int readCnt;	//조회수
	private Date qna_write_date;	//작성일
	private int comment_cnt;	//댓글갯수
	//private String board_image;	//첨부파일
	private int rNum;
	private int commentCnt;	//총댓글갯수
	private String qna_password;
	private String kind;
	private String state;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public Date getQna_write_date() {
		return qna_write_date;
	}
	public void setQna_write_date(Date qna_write_date) {
		this.qna_write_date = qna_write_date;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public String getQna_password() {
		return qna_password;
	}
	public void setQna_password(String qna_password) {
		this.qna_password = qna_password;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
