package com.pro.hellscare.VO;

public class DrugInfoVO {
	private String item_seq; 		// 품목일련번호
	private String item_name; 		// 품목명
	private String entp_name; 		// 업체명
	private String drug_shape; 		// 모양
	private String color_class1; 	// 색상
	private String form_code_name; 	// 정제
	private String leng_long; 		// 장축
	private String leng_short; 		// 단축
	private String thick; 			// 두께
	
	// 생성자
	public DrugInfoVO() {}


	// getter, setter
	public String getItem_name() {
		return item_name;
	}

	public String getItem_seq() {
		return item_seq;
	}


	public void setItem_seq(String item_seq) {
		this.item_seq = item_seq;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getEntp_name() {
		return entp_name;
	}

	public void setEntp_name(String entp_name) {
		this.entp_name = entp_name;
	}

	public String getDrug_shape() {
		return drug_shape;
	}

	public void setDrug_shape(String drug_shape) {
		this.drug_shape = drug_shape;
	}

	public String getColor_class1() {
		return color_class1;
	}

	public void setColor_class1(String color_class1) {
		this.color_class1 = color_class1;
	}

	public String getForm_code_name() {
		return form_code_name;
	}

	public void setForm_code_name(String form_code_name) {
		this.form_code_name = form_code_name;
	}


	public String getLeng_long() {
		return leng_long;
	}


	public void setLeng_long(String leng_long) {
		this.leng_long = leng_long;
	}


	public String getLeng_short() {
		return leng_short;
	}


	public void setLeng_short(String leng_short) {
		this.leng_short = leng_short;
	}


	public String getThick() {
		return thick;
	}


	public void setThick(String thick) {
		this.thick = thick;
	};
	
	
	
	
}
