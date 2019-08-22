package com.pro.hellscare.VO;

import java.sql.Date;

public class BoardVO {
	
	private int board_code;		//원글번호
	private String username;  //작성자
	private String title; //글제목
	private String content; //글내용
	private int readCnt;	//조회수
	private Date write_date;	//작성일
	private int comment_cnt;	//댓글갯수
	private String board_image;	//첨부파일
	private int rNum;
	private int commentCnt;	//총댓글갯수
	
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
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

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	public Date getWrite_date() {
		return write_date;
	}
	
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public String getBoard_image() {
		return board_image;
	}
	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	
	public int getrNum() {
		return rNum;
	}
	
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}


}
