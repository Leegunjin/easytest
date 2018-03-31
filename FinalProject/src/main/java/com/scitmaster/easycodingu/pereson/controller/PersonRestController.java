package com.scitmaster.easycodingu.pereson.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/**
	 * findPw
	 * @param id  Pw를 찾기위해 사용자가 입력한 id
	 * @return HashMmap ID로 SELECT해 온 Person
	 */
	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public HashMap<String, Object> findPw(String id, Locale locale) {
		logger.info("findPw START");
		HashMap map = new HashMap<>();
		System.out.println("id" + id);
		Person person = dao.selectPw(id);
		
		Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        
        String formattedDate = dateFormat.format(date);
             
        
        String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
        String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
        
        //String sendTime = inDate + inTime;
        String sendTime = new java.text.SimpleDateFormat("ddHHmmss").format(new java.util.Date());
           System.out.println("inDate : " + inDate);
           System.out.println("inTime : "+inTime);
           System.out.println("sendTime : " + sendTime);
       
		
		if (person != null) {
			double num = Math.random();
			int randomNum = (int) (num * 1000000) + 1;
			System.out.println(randomNum);
			String foundPw = person.getPassword();
			String foundEmail = person.getEmail();
			
			map.put("foundPw", foundPw);
			map.put("foundEmail", foundEmail);
			map.put("randomNum", randomNum);
			map.put("sendTime", sendTime);
		}
		System.out.println("Person:" + person);
		logger.info("findPw END");
		return map;
	}
	
	
	/**
	 * resetPw
	 * @param resetPw Pw를 변경하기위해 사용자가 입력한 Pw
	 * @return result Pw update의 결과
	 */
	@RequestMapping(value = "resetPw", method = RequestMethod.POST)
	public int resetPw(String resetPw, String id){
		logger.info("resetPw START");
		//String selectId = (String)session.getAttribute("loginId");
		System.out.println("resetPw in controller : "+resetPw);
		Person person = dao.selectPerson(id);
		person.setPassword(resetPw);
		System.out.println("person in controller : "+person);
		int result = dao.updatePw(person);
		System.out.println("updatePw result int : " + result);
		/*String resultMsg = null;
		if (result == 1) {
			resultMsg = "비밀번호 변경 성공";
		} else {
			resultMsg = "비밀번호 변경 실패";
		}*/
		logger.info("resetPw END");
		return result;
	}
	
}
