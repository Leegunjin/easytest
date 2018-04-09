package com.scitmaster.easycodingu.reply.vo;

public class Reply {

	private int r_num;
	private int b_num;
	private String r_id;
	private String r_contents;
	private String r_date;
	private String r_uptDate;
	private int delete_Flag;
	private String delete_Date;
	
	public Reply() {
		super();
	}

	public Reply(int r_num, int b_num, String r_id, String r_contents, String r_date, String r_uptDate, int delete_Flag,
			String delete_Date) {
		super();
		this.r_num = r_num;
		this.b_num = b_num;
		this.r_id = r_id;
		this.r_contents = r_contents;
		this.r_date = r_date;
		this.r_uptDate = r_uptDate;
		this.delete_Flag = delete_Flag;
		this.delete_Date = delete_Date;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_uptDate() {
		return r_uptDate;
	}

	public void setR_uptDate(String r_uptDate) {
		this.r_uptDate = r_uptDate;
	}

	public int getDelete_Flag() {
		return delete_Flag;
	}

	public void setDelete_Flag(int delete_Flag) {
		this.delete_Flag = delete_Flag;
	}

	public String getDelete_Date() {
		return delete_Date;
	}

	public void setDelete_Date(String delete_Date) {
		this.delete_Date = delete_Date;
	}

	@Override
	public String toString() {
		return "Reply [r_num=" + r_num + ", b_num=" + b_num + ", r_id=" + r_id + ", r_contents=" + r_contents
				+ ", r_date=" + r_date + ", r_uptDate=" + r_uptDate + ", delete_Flag=" + delete_Flag + ", delete_Date="
				+ delete_Date + "]";
	}
	
	
}
