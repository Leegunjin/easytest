package com.scitmaster.easycodingu.person.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

@Controller
@RequestMapping(value="person")
public class PersonLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonLoginController.class);

	@Autowired
	PersonDAO dao;
	
	/**
	 * loginForm 로그인 폼으로 이동
	 */
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 페이지 이동시작");
		logger.info("로그인 페이지 이동시작");
		return "person/loginForm";
	}
	
	
	@RequestMapping(value="login" , method = RequestMethod.POST)
	public String login(Person person , HttpSession session , Model model)
	{
		logger.info("【UserLoginController】 〓▷▷【login 메소드(로그인)】"); 
		
		Person vo = dao.selectPerson(person.getId());
		logger.info("【UserLoginController】 〓▷▷【DB에서 찾아온 ID : " + vo + "】"); 
		
		
		if(vo != null && vo.getPassword().equals(person.getPassword()))
		{
			session.setAttribute("loginId", vo.getId());
			session.setAttribute("loginName", vo.getName());
			session.setAttribute("testUserLevel", vo.getGrade()); /*그레이드 컬럼 좀 빌립니다*/
			session.setAttribute("testDate", vo.getDelete_Date()); /*델리트 데이트 좀 빌립니다*/
			session.setAttribute("profileImage", vo.getProfile_Image()); /*델리트 데이트 좀 빌립니다*/
		}
		else
		{ 
			model.addAttribute("errorMsg", "오류 : 로그인 실패"); 
			
			logger.info("【UserLoginController : return】〓▶▶ 【home】(로그인 실패)" + "\n");
			return "person/loginForm"; 
			}
		
		logger.info("【UserLoginController : return】〓▶▶ 【redirect:/】(로그인 성공)" + "\n");
		return "person/loginComplete";
	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("testUserLevel");
		return "person/logoutComplete";
	}
	
	@RequestMapping(value = "logoutComplete", method = RequestMethod.GET)
	public String logoutComplete(HttpSession session) {
		session.removeAttribute("loginName");
		return "/home";
	}
	
	
}
