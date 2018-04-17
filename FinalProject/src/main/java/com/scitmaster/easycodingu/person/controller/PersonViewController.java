package com.scitmaster.easycodingu.person.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

@Controller
@RequestMapping(value = "person")
@SessionAttributes("person")
public class PersonViewController {

	@Autowired
	PersonDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(PersonViewController.class);

	// 180328 로그인 폼에서 회원가입 폼으로 이동 (주 지호)
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm() {
		logger.info("회원가입 페이지 이동시작");
		logger.info("회원가입 페이지 이동시작");
		return "person/joinForm";
	}

	// 180328 회원가입 (주 지호)
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Person person, Model model, String radio) {
		logger.info("회원가입 시작");
		person.setAdmin_Flag(radio);
		System.out.println(radio);
		// person.setAdmin_Flag("user");

		int result = dao.insertJoin(person);
		if (result != 1) {
			// 등록 실패
			model.addAttribute("errorMsg", "회원가입 실패");

			logger.info("【UserController : return】〓▶▶ 【user/joinForm】(회원가입 실패)" + "\n");
			return "user/joinForm";
		}

		// 등록 성공
		logger.info("회원가입 종료");
		return "person/joinComplete";

	}

	// 180328 튜토리얼 화면 이동 (주 지호)
	@RequestMapping(value = "tutorial", method = RequestMethod.GET)
	public String tutorial() {
		logger.info("튜토리얼 페이지 이동시작");
		logger.info("튜토리얼 페이지 이동종료");
		return "person/tutorial";
	}

	/**
	 * loginForm 로그인 폼으로 이동
	 */
	/*@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 페이지 이동시작");
		logger.info("로그인 페이지 이동시작");
		return "person/loginForm";
	}*/

	/**
	 * login
	 * 
	 * @param id
	 *            사용자가 입력한 ID
	 * @param password
	 *            사용자가 입력한 Passwrod
	 * @param session
	 *            세션에 ID를 setAttribute하기 위한 HttpSession
	 * @return redirect:../ home.jsp로 돌아간다
	 */
	/*@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Person person, HttpSession session, Model model) {
		logger.info("login START");
		Person vo = dao.selectPerson(person.getId());
		
		
		if(vo != null && vo.getPassword().equals(person.getPassword()))
		{
			session.setAttribute("loginId", vo.getId());
			session.setAttribute("loginName", vo.getName());
		}
		
			값 넘어가나 보려고 잠시 Grade 컬럼 좀 빌려서 사용합니다 - g호
			session.setAttribute("testUserLevel", person.getGrade()); 
		
		logger.info("login END");
		return "person/loginComplete";
	}*/

	/*@RequestMapping(value = "logoutComplete", method = RequestMethod.GET)
	public String logoutComplete(HttpSession session) {
		session.removeAttribute("loginName");
		return "/home";
	}*/

	/*@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "person/logoutComplete";
	}*/

	/**
	 * forgot 로그인 페이지에서 ID, PW 찾기 링크를 클릭시 forgotForm으로 이동
	 */
	@RequestMapping(value = "forgot", method = RequestMethod.GET)
	public String forgot() {
		logger.info("forgot START");
		logger.info("forgot END");
		return "person/forgotForm";
	}

	/**
	 * googleUser
	 * 
	 * @param request
	 *            사용자의 구글 계정으로부터 가져온 이름과 Email정보
	 * @param session
	 *            로그인한 사용자 정보를 session에 저장
	 */
	@RequestMapping(value = "/googleUser", method = RequestMethod.GET)
	public String successGoogleLogin(ServletRequest request, HttpSession session) {

		// JavaScript에서 가져온 Google User 정보
		String name = (String) request.getParameter("name");
		String email = (String) request.getParameter("email");
		String password = (String) request.getParameter("id");

		// ↑ 가져온 값으로 Person 객체 생성
		Person person = new Person();
		person.setId(email);
		person.setName(name);
		person.setPassword(password);
		person.setEmail(email);
		person.setAdmin_Flag("user");

		// 회원 DB에 데이터가 존재하는지 여부 확인
		Person selectPerson = dao.selectPerson(email);

		// 기존회원이 아니면 DB에 추가 후 Session에 저장
		if (selectPerson == null) {
			dao.insertJoin(person);
			session.setAttribute("loginId", person.getId());
			session.setAttribute("loginName", person.getName());
			// 기존 회원이면 Session에만 저장
		} else {
			session.setAttribute("loginId", person.getId());
			session.setAttribute("loginName", person.getName());
		}

		logger.info((String) session.getAttribute("loginId"));
		logger.info((String) session.getAttribute("loginName"));

		logger.info("login END");

		return "person/loginComplete";
	}
	
	
	/**
	 * 유저 마이페이지로 이동
	 */
	@RequestMapping(value = "mypageUser", method = RequestMethod.GET)
	public String mypageUser(HttpSession session , Model model) {
		logger.info("forgot START");
		
		String loginId = (String)session.getAttribute("loginId");
		
		Person person = dao.selectPerson(loginId);
		model.addAttribute("person", person);
		
		logger.info("forgot END");
		return "person/mypageUser";
	}
	
	/**
	 * 개인 정보 수정
	 */
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(SessionStatus status , @ModelAttribute("person") Person person, 
			HttpSession session , Model model){
		 
		System.out.println("화면에서 넘겨준 펄슨" + person);
		
		int result = dao.updateUser(person);
		
		
		if(result != 1)
		{
			model.addAttribute("errorMsg", "개인정보수정 실패");
			
			logger.info("【UserController : return】〓▶▶ 【user/modifyForm】(정보수정 실패)" + "\n");
			return "person/mypageUser";
		}
		
		session.setAttribute("loginName", person.getName());
		session.setAttribute("loginPassword", person.getPassword());
		
		model.addAttribute("loginName", person.getName());
		model.addAttribute("loginPassword", person.getPassword());
		
		System.out.println("모델" + model);
		System.out.println("세션" + session);
		
		status.setComplete();
		
		logger.info("【UserController : return】〓▶▶ 【redirect:/】(정보수정 성공)" + "\n");
		return "redirect:/home";
		
	}
		

	
}