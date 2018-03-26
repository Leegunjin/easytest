package com.scitmaster.easycodingu.restcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.scitmaster.easycodingu.controller.PersonController;

@RequestMapping("person")
@RestController
public class PersonRestController {
private static final Logger logger = LoggerFactory.getLogger(PersonController.class);
		
	@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public String loginForm(){
		logger.info("로그인 페이지 이동시작");
		logger.info("로그인 페이지 이동시작");
		return "loginForm";
	}
}
