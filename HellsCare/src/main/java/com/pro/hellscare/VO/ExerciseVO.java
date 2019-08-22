package com.pro.hellscare.VO;

public class ExerciseVO {
	
	private String exercise_code;	// 운동 고유코드
	private String exercise_name;	// 운동이름
	private String exercise_img;	// 운동영상
	private String way;				// 운동방법
	private String part;			// 운동부위
	private int kcal;				// 소모되는 칼로리
	private String note;			// 주의사항
	private int kind;				// 운동종류
	private String exercise_video;
	
	public ExerciseVO() {}

	public String getExercise_code() {
		return exercise_code;
	}

	public void setExercise_code(String exercise_code) {
		this.exercise_code = exercise_code;
	}

	public String getExercise_name() {
		return exercise_name;
	}

	public void setExercise_name(String exercise_name) {
		this.exercise_name = exercise_name;
	}

	public String getExercise_img() {
		return exercise_img;
	}

	public void setExercise_img(String exercise_img) {
		this.exercise_img = exercise_img;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public String getExercise_video() {
		return exercise_video;
	}

	public void setExercise_video(String exercise_video) {
		this.exercise_video = exercise_video;
	}
	
	
	
	
}
