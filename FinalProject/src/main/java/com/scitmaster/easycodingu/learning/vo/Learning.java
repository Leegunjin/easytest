package com.scitmaster.easycodingu.learning.vo;

public class Learning {
	private int no;
	private int c_num;
	private String id;
	private int pass_Flag;
	private String pass_Date;
	
	public Learning() {
		super();
	}

	public Learning(int no, int c_num, String id, int pass_Flag, String pass_Date) {
		super();
		this.no = no;
		this.c_num = c_num;
		this.id = id;
		this.pass_Flag = pass_Flag;
		this.pass_Date = pass_Date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPass_Flag() {
		return pass_Flag;
	}

	public void setPass_Flag(int pass_Flag) {
		this.pass_Flag = pass_Flag;
	}

	public String getPass_Date() {
		return pass_Date;
	}

	public void setPass_Date(String pass_Date) {
		this.pass_Date = pass_Date;
	}

	@Override
	public String toString() {
		return "Learning [no=" + no + ", c_num=" + c_num + ", id=" + id + ", pass_Flag=" + pass_Flag + ", pass_Date="
				+ pass_Date + "]";
	}
	
	
}
