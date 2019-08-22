package com.pro.hellscare.VO;

public class DiseaseVO {

	private String disease_code; // 질병코드
	private String disease_name; // 질병명
	private String d_category;
	private String definition; // 정의
	private String cause; // 원인
	private String symptom; // 증상
	private String cure; // 치료
	
	public DiseaseVO() {}

	// getter, setter


	public String getDisease_code() {
		return disease_code;
	}

	public void setDisease_code(String disease_code) {
		this.disease_code = disease_code;
	}

	public String getDisease_name() {
		return disease_name;
	}

	public void setDisease_name(String disease_name) {
		this.disease_name = disease_name;
	}

	public String getD_category() {
		return d_category;
	}

	public void setD_category(String d_category) {
		this.d_category = d_category;
	}
	
	public String getDefinition() {
		return definition;
	}

	public void setDefinition(String definition) {
		this.definition = definition;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getCure() {
		return cure;
	}

	public void setCure(String cure) {
		this.cure = cure;
	}
	
	
	
}
