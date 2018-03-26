package com.scitmaster.easycodingu.pereson.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

@Controller
@RequestMapping(value="person")
public class PersonViewController {

	@Autowired
	PersonDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(PersonViewController.class);
	
	
	@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public String loginForm(){
		logger.info("로그인 페이지 이동시작");
		logger.info("로그인 페이지 이동시작");
		return "person/loginForm";
	}
	
}
