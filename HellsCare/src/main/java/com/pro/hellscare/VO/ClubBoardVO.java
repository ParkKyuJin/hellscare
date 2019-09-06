package com.pro.hellscare.VO;

import java.sql.Date;

public class ClubBoardVO {
	
	private String club_board_code;
	private String username;
	private String club_name;
	private String title;
	private String content;
	private int readCnt;
	private Date write_date;
	
	public ClubBoardVO() {}

	public String getClub_board_code() {
		return club_board_code;
	}

	public void setClub_board_code(String club_board_code) {
		this.club_board_code = club_board_code;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getClub_name() {
		return club_name;
	}

	public void setClub_name(String club_name) {
		this.club_name = club_name;
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

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
}
