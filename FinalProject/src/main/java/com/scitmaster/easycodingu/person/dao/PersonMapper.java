package com.scitmaster.easycodingu.person.dao;

import com.scitmaster.easycodingu.person.vo.Person;

public interface PersonMapper {

	/**
	 * insertPerson
	 * 회원가입
	 * @param person 
	 * */
	public void insertPerson(Person person);
	
	/**
	 * selectPerson
	 * Login에 사용
	 * @param id 
	 * @return Person
	 * */
	public Person selectPerson(String id);
	
	/**
	 * selectId
	 * ID찾기
	 * @param email 
	 * @return Person
	 * */
	public Person selectId(String email);
}
