package com.scitmaster.easycodingu.board.vo;

public class Board {
	
	private int b_num;
	private String b_id;
	private String b_title;
	private String b_contents;
	private int hits;
	private String b_date;
	private String b_uptDate;
	private String hashTag;
	private int warn_Count;
	private int delete_Flag;
	private String delete_Date;
	private String originalFileName;
	private String savedFileName;
	
	public Board() {
		super();
	}

	public Board(int b_num, String b_id, String b_title, String b_contents, int hits, String b_date, String b_uptDate,
			String hashTag, int warn_Count, int delete_Flag, String delete_Date, String originalFileName,
			String savedFileName) {
		super();
		this.b_num = b_num;
		this.b_id = b_id;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.hits = hits;
		this.b_date = b_date;
		this.b_uptDate = b_uptDate;
		this.hashTag = hashTag;
		this.warn_Count = warn_Count;
		this.delete_Flag = delete_Flag;
		this.delete_Date = delete_Date;
		this.originalFileName = originalFileName;
		this.savedFileName = savedFileName;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_contents() {
		return b_contents;
	}

	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getB_uptDate() {
		return b_uptDate;
	}

	public void setB_uptDate(String b_uptDate) {
		this.b_uptDate = b_uptDate;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

	public int getWarn_Count() {
		return warn_Count;
	}

	public void setWarn_Count(int warn_Count) {
		this.warn_Count = warn_Count;
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

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getSavedFileName() {
		return savedFileName;
	}

	public void setSavedFileName(String savedFileName) {
		this.savedFileName = savedFileName;
	}

	@Override
	public String toString() {
		return "Board [b_num=" + b_num + ", b_id=" + b_id + ", b_title=" + b_title + ", b_contents=" + b_contents
				+ ", hits=" + hits + ", b_date=" + b_date + ", b_uptDate=" + b_uptDate + ", hashTag=" + hashTag
				+ ", warn_Count=" + warn_Count + ", delete_Flag=" + delete_Flag + ", delete_Date=" + delete_Date
				+ ", originalFileName=" + originalFileName + ", savedFileName=" + savedFileName + "]";
	}
	
	
	
}
