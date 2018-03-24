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
	
	@RequestMapping(value="test",method=RequestMethod.POST)
	public String test(Person person){
		logger.info("테스트 시작");
		System.out.println(person);
		dao.insertPerson(person);
		logger.info("테스트 종료");
		return "/";
	}
}
