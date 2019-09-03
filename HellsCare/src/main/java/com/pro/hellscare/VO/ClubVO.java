package com.pro.hellscare.VO;

import java.sql.Date;

public class ClubVO {
	private String club_name;
	private String club_kind;
	private int club_max;
	private String area;
	private String club_master;
	private String club_pr;
	private Date club_date;
	
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getClub_kind() {
		return club_kind;
	}
	public void setClub_kind(String club_kind) {
		this.club_kind = club_kind;
	}
	public int getClub_max() {
		return club_max;
	}
	public void setClub_max(int club_max) {
		this.club_max = club_max;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getClub_master() {
		return club_master;
	}
	public void setClub_master(String club_master) {
		this.club_master = club_master;
	}
	public String getClub_pr() {
		return club_pr;
	}
	public void setClub_pr(String club_pr) {
		this.club_pr = club_pr;
	}
	public Date getClub_date() {
		return club_date;
	}
	public void setClub_date(Date club_date) {
		this.club_date = club_date;
	}
	
	
}
