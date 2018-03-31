package com.scitmaster.easycodingu.person.vo;

public class Person {

	private String id;			//사용자 아이디
	private String name;		//사용자 이름
	private String password;	//사용자 비밀번호
	private String email;		//사용자 이메일
	private String admin_Flag;	//관리자 여부 확인
	private int grade;			//회원 레벨
	private int delete_Flag;	//탈퇴 신청 여부
	private String delete_Date;	//탈퇴 신청 날짜
	
	public Person() {
		super();
	}
	
	public Person(String id, String name, String password, String email, String admin_Flag, int grade, int delete_Flag,
			String delete_Date) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.admin_Flag = admin_Flag;
		this.grade = grade;
		this.delete_Flag = delete_Flag;
		this.delete_Date = delete_Date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdmin_Flag() {
		return admin_Flag;
	}

	public void setAdmin_Flag(String admin_Flag) {
		this.admin_Flag = admin_Flag;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
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
		return "Person [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", admin_Flag="
				+ admin_Flag + ", grade=" + grade + ", delete_Flag=" + delete_Flag + ", delete_Date=" + delete_Date
				+ "]";
	}
	
	
	
}
