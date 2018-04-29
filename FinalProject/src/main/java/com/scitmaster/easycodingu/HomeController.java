package com.scitmaster.easycodingu;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scitmaster.easycodingu.learning.dao.LearningDAO;
import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	PersonDAO p_dao;
	@Autowired
	LearningDAO l_dao;
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "intro"; 
   }
   
   // 180331 인트로에서 홈으로 이동 합니다 (주 지호)
         @RequestMapping(value="home",method=RequestMethod.GET)
         public String home(HttpSession session, Model model){
            logger.info("메인 페이지 이동시작");
            String loginId = (String)session.getAttribute("loginId");
            
            if(loginId != null){
	            Person person = p_dao.selectPerson(loginId);
    			//로그인 했을 때
    			//dao에서 넘어온 최고레벨
    			Integer bestLevel1 = l_dao.selectBestLevel(loginId);
    			System.out.println(bestLevel1);
    			
    			if(bestLevel1 != null){
    				//int 120을 받아서 String으로 바꾸고 앞에 두자리만 잘라서 다시 int 12로 바꾼다
    				int temp = Integer.parseInt(Integer.toString(bestLevel1).substring(0, 2));
    				System.out.println("jsp로 넘겨줄 최고레벨 : "+temp);
    				
    				//화면으로 넘겨줄 변수 선언
    				int bestLevel2 = 0;
    				
    				switch (temp) {
    				case 11:
    					bestLevel2 = 1;
    					break;
    					
    				case 12:
    					bestLevel2 = 2;
    					break;
    					
    				case 21:
    					bestLevel2 = 3;
    					break;
    					
    				case 22:
    					bestLevel2 = 4;
    					break;
    					
    				case 31:
    					bestLevel2 = 5;
    					break;
    					
    				case 32:
    					bestLevel2 = 6;
    					break;
    					
    				case 41:
    					bestLevel2 = 7;
    					break;
    					
    				case 42:
    					bestLevel2 = 8;
    					break;
    					
    				case 51:
    					bestLevel2 = 9;
    					break;
    					
    				case 52:
    					bestLevel2 = 10;
    					break;
    					
    				case 61:
    					bestLevel2 = 11;
    					break;
    					
    				case 62:
    					bestLevel2 = 12;
    					break;
    				}
    				System.out.println("최고레벨:"+bestLevel2);
    				model.addAttribute("bestLevel", bestLevel2);
    			}else if(bestLevel1 == null){
    				model.addAttribute("bestLevel", 0);
    			}
    			model.addAttribute("person", person);
            }
            else if(loginId == null){
            	
            }
            logger.info("메인 페이지 이동종료");
            return "home";
         }
   
}