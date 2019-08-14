package com.pro.hellscare.VO;

public class NewsVO {
	private String newsTitle;  //뉴스기사 타이틀
	private String newsThumbnail; //뉴스 썸네일
	private String newsContents; //뉴스 내용
	private String newsSummary; //뉴스 요약
	private String newsDate; //뉴스 일자
	private String newsAuthor; //기자
	
	public NewsVO() {}
	
	public String getNewsTitle() {
		return newsTitle;
	}
	
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	
	public String getNewsThumbnail() {
		return newsThumbnail;
	}
	
	public void setNewsThumbnail(String newsThumbnail) {
		this.newsThumbnail = newsThumbnail;
	}
	
	public String getNewsContents() {
		return newsContents;
	}
	
	public void setNewsContents(String newsContents) {
		this.newsContents = newsContents;
	}

	public String getNewsSummary() {
		return newsSummary;
	}

	public void setNewsSummary(String newsSummary) {
		this.newsSummary = newsSummary;
	}

	public String getNewsDate() {
		return newsDate;
	}

	public void setNewsDate(String newsDate) {
		this.newsDate = newsDate;
	}

	public String getNewsAuthor() {
		return newsAuthor;
	}

	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}
}
