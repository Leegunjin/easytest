package com.scitmaster.easycodingu.contents.vo;

public class Contents {

	private int c_num;	//문제번호
	private String c_title;	//문제 타이틀
	private String c_answer;	//문제 답
	
	public Contents() {
		super();
	}

	public Contents(int c_num, String c_title, String c_answer) {
		super();
		this.c_num = c_num;
		this.c_title = c_title;
		this.c_answer = c_answer;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_answer() {
		return c_answer;
	}

	public void setC_answer(String c_answer) {
		this.c_answer = c_answer;
	}

	@Override
	public String toString() {
		return "Contents [c_num=" + c_num + ", c_title=" + c_title + ", c_answer=" + c_answer + "]";
	}
	
	
}
