package com.scitmaster.easycodingu.pereson.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.scitmaster.easycodingu.pereson.controller.PersonViewController;
import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

@RestController
@RequestMapping(value="person")
public class PersonRestController {
	
	@Autowired
	PersonDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(PersonViewController.class);
	
	//화면 이동하는 요청은 View Controller에서 해주세요~~~~

	/*@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public String loginForm(){
		logger.info("로그인 페이지 이동시작");
		logger.info("로그인 페이지 이동시작");
		return "loginForm";
	}*/
	
	/**
	 * findId
	 * @param email ID를 찾기위해 사용자가 입력한 email
	 * @return foundId Email로 SELECT해 온 Person의 ID 
	 * */
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public Person findId(String email){
		logger.info("findId START");
		
		System.out.println("Email : " + email);
		Person person = dao.selectId(email);
		System.out.println("Person : " + person);
		
		logger.info("findId END");
		return person;
	}
	
}
