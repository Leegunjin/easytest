package com.scitmaster.easycodingu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scitmaster.easycodingu.dao.PersonDAO;
import com.scitmaster.easycodingu.vo.Person;

@Controller
public class PersonController {

	@Autowired
	PersonDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(PersonController.class);
	
	
	@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public String login(){
		logger.info("로그인 페이지 이동시작");
		logger.info("로그인 페이지 이동시작");
		return "loginForm";
	}
	
}
