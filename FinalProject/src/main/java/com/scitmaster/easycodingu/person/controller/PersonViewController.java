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

import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

@Controller
@RequestMapping(value="person")
public class PersonViewController {

   @Autowired
   PersonDAO dao;
   
   private static final Logger logger = LoggerFactory.getLogger(PersonViewController.class);
   
      // 180328 로그인 폼에서 회원가입 폼으로 이동 (주 지호)
      @RequestMapping(value="joinForm",method=RequestMethod.GET)
      public String joinForm(){
         logger.info("회원가입 페이지 이동시작");
         logger.info("회원가입 페이지 이동시작");
         return "person/joinForm";
      }
      
      
      // 180328 회원가입 (주 지호)
      @RequestMapping(value="join",method=RequestMethod.POST)
      public String join(Person person, Model model, String radio){
         logger.info("회원가입 시작");
         person.setAdmin_Flag(radio);
         System.out.println(radio);
         //person.setAdmin_Flag("user");
         
         int result = dao.insertJoin(person);
         if(result != 1)
         {
            //등록 실패
            model.addAttribute("errorMsg", "회원가입 실패");
            
            logger.info("【UserController : return】〓▶▶ 【user/joinForm】(회원가입 실패)" + "\n");
            return "user/joinForm";
         }

      //등록 성공    
         logger.info("회원가입 종료");
      return "person/joinComplete";
         
      }
      
      
      
         
         // 180328 튜토리얼 화면 이동 (주 지호)
         @RequestMapping(value="tutorial",method=RequestMethod.GET)
         public String tutorial(){
            logger.info("튜토리얼 페이지 이동시작");
            logger.info("튜토리얼 페이지 이동종료");
            return "person/tutorial";
         }
   
   
   /**
    * loginForm
    * 로그인 폼으로 이동
    * */
   @RequestMapping(value="loginForm",method=RequestMethod.GET)
   public String loginForm(){
      logger.info("로그인 페이지 이동시작");
      logger.info("로그인 페이지 이동시작");
      return "person/loginForm";
   }
   
   /**
    * login
    * @param id 사용자가 입력한 ID
    * @param password 사용자가 입력한 Passwrod
    * @param session 세션에 ID를 setAttribute하기 위한 HttpSession
    * @return redirect:../ home.jsp로 돌아간다
    * */
   @RequestMapping(value="login", method=RequestMethod.POST)
   public String login(String id, String password, HttpSession session){
      logger.info("login START");
      Person person = dao.selectPerson(id);
      System.out.println(person);
      if (person != null && person.getPassword().equals(password)) {
         session.setAttribute("loginId", person.getId());
         session.setAttribute("loginName", person.getName());
      }      
      logger.info("login END");
      return "person/loginComplete";
   }
   
   @RequestMapping(value="logoutComplete",method=RequestMethod.GET)
   public String logoutComplete(HttpSession session){
      session.removeAttribute("loginName");
      return "/home";
   }
   
   
   @RequestMapping(value="logout",method=RequestMethod.GET)
   public String logout(HttpSession session){
      session.removeAttribute("loginId");
      return "person/logoutComplete";
   }
   
   
   /**
    * forgot
    * 로그인 페이지에서 ID, PW 찾기 링크를 클릭시 forgotForm으로 이동*/
   @RequestMapping(value="forgot", method=RequestMethod.GET)
   public String forgot(){
      logger.info("forgot START");
      logger.info("forgot END");
      return "person/forgotForm";
   }
   
   
   /**
       * googleUser
       * @param request 사용자의 구글 계정으로부터 가져온 이름과 Email정보 
       * @param session 로그인한 사용자 정보를 session에 저장
       * */
      @RequestMapping(value="/googleUser", method = RequestMethod.GET)
      public String successGoogleLogin(ServletRequest request, HttpSession session) {
         
         // JavaScript에서 가져온 Google User 정보
         String name = (String)request.getParameter("name");
         String email = (String)request.getParameter("email");
         String password  =(String)request.getParameter("id");
         
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
         if(selectPerson == null) {
            dao.insertJoin(person);
            session.setAttribute("loginId", person.getId());
            session.setAttribute("loginName", person.getName());
         // 기존 회원이면 Session에만 저장
         } else {
            session.setAttribute("loginId", person.getId());
            session.setAttribute("loginName", person.getName());
         }
         
         
         
         logger.info((String)session.getAttribute("loginId"));
         logger.info((String)session.getAttribute("loginName"));
         
         logger.info("login END");
         
         return "redirect:../";
      }
   
   
   
   
   
   
     
}