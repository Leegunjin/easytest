package com.scitmaster.easycodingu.contents.controller;

import java.util.ArrayList;

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

import com.scitmaster.easycodingu.contents.dao.ContentsDAO;
import com.scitmaster.easycodingu.learning.dao.LearningDAO;
import com.scitmaster.easycodingu.learning.vo.Learning;
import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

@Controller
@RequestMapping(value = "contents")
public class ContentsViewController {

	@Autowired
	ContentsDAO dao;
	@Autowired
	LearningDAO l_dao;
	@Autowired
	PersonDAO p_dao;
 
	private static final Logger logger = LoggerFactory.getLogger(ContentsViewController.class);

	// 컨텐츠 홈으로 이동
	@RequestMapping(value = "contentsHome", method = RequestMethod.GET)
	public String contentsHome(Model model, HttpSession session) {
		logger.info("컨텐츠 홈 이동 시작");
		String loginId = (String)session.getAttribute("loginId");
		Person person = p_dao.selectPerson(loginId);
		
		if(loginId != null){
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
				//첫 화면 페이지 수 나타낼 변수
				int initPage = 0;
				
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
					
				case 71:
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
					
				case 72:
					bestLevel2 = 10;
					break;
					
				case 61:
					bestLevel2 = 11;
					break;
					
				case 62:
					bestLevel2 = 12;
					break;
					
				case 73:
					bestLevel2 = 12;
					break;
				}
				if(bestLevel2 == 1){
					initPage = 1;
				}else if(bestLevel2 == 2 || bestLevel2 == 3){
					initPage = 2;
				}else if(bestLevel2 == 4 || bestLevel2 == 5){
					initPage = 3;
				}else if(bestLevel2 == 6 || bestLevel2 == 7){
					initPage = 4;
				}else if(bestLevel2 == 8 || bestLevel2 == 9){
					initPage = 5;
				}else if(bestLevel2 == 10 || bestLevel2 == 11){
					initPage = 6;
				}else if(bestLevel2 == 12){
					initPage = 7;
				}
				System.out.println("최고레벨:"+bestLevel2);
				model.addAttribute("initPage", initPage);
				model.addAttribute("bestLevel", bestLevel2);
			}else if(bestLevel1 == null){
				model.addAttribute("bestLevel", 0);
				model.addAttribute("initPage", 1);
			}
		}
		model.addAttribute("person", person);
		logger.info("컨텐츠 홈 이동 종료");
		return "contents/selectLevelPage";
	}
	
	// 챕터 완료 후 컨텐츠 홈으로 이동
	@RequestMapping(value="clearChapter", method=RequestMethod.GET)
	public String clearChapter(HttpSession session,Learning param_learning){
		logger.info("챕터 클리어 후 컨텐츠홈 이동 시작");
		//로그인한 사람의 아이디와 패스플래그를 담아서 Learning 테이블에 저장
		String loginId = (String)session.getAttribute("loginId");
		param_learning.setId(loginId);
		param_learning.setPass_Flag(1);
		System.out.println("넘겨줄 러닝 = "+param_learning);
		
		//기존에 풀었던 c_num이 있는지 확인
		ArrayList<Learning> learning = l_dao.selectLearning(param_learning);
		System.out.println("중복해서 푼 문제 있나"+learning);
		//기존에 풀지 않았던거라면 푼 사람의 레벨 +1 해줌
		if(learning.size() == 0){
			System.out.println("레벨업할 아이디="+loginId);
			p_dao.updateGrade(loginId);
			/*Person loginPerson = p_dao.selectPerson(loginId);
			int currentGrade = loginPerson.getGrade();
			System.out.println("현재레벨 = "+currentGrade);
			loginPerson.setGrade(currentGrade+1);
			int upgradeGrade = loginPerson.getGrade();
			System.out.println("바뀐레벨 = "+upgradeGrade);*/
		}
		Person person = p_dao.selectPerson(loginId);
		int currentGrade = person.getGrade();
		System.out.println("또 풀었을때 레벨변화 있냐" + currentGrade);
		l_dao.insertLearning(param_learning);
		logger.info("챕터 클리어 후 컨텐츠홈 이동 종료");
		return "redirect:contentsHome";
	}

	@RequestMapping(value = "contents1", method = RequestMethod.GET)
	public String contents11() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents11";
	}
	
	@RequestMapping(value = "contents2", method = RequestMethod.GET)
	public String contents12() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents12";
	}

	@RequestMapping(value = "contents3", method = RequestMethod.GET)
	public String contents21() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents21";
	}

	@RequestMapping(value = "contents4", method = RequestMethod.GET)
	public String contents22() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents22";
	}

	@RequestMapping(value = "contents13", method = RequestMethod.GET)
	public String contents71() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents71";

	}

	@RequestMapping(value = "contents5", method = RequestMethod.GET)
	public String contents310() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents31";

	}

	@RequestMapping(value = "contents6", method = RequestMethod.GET)
	public String contents320() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents32";
	}
	
	@RequestMapping(value = "contents7", method = RequestMethod.GET)
	public String contents41() {
		logger.info("QuizPage START");
		logger.info("QuizPage END");
		return "contents/contents41";

	}
	
	@RequestMapping(value = "contents14", method = RequestMethod.GET)
	public String contents72() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents72";

	}
	
	@RequestMapping(value = "contents8", method = RequestMethod.GET)
	public String contents42() {
		logger.info("QuizPage START");
		logger.info("QuizPage END");
		return "contents/contents42";

		}
	 
	@RequestMapping(value = "contents9", method = RequestMethod.GET)
	public String contents51() {
		logger.info("QuizPage START");
		logger.info("QuizPage END");
		return "contents/contents51";

	}
	@RequestMapping(value = "contents10", method = RequestMethod.GET)
	public String contents52() {
		logger.info("QuizPage START");
		logger.info("QuizPage END");
		return "contents/contents52";

	}
	
	@RequestMapping(value = "contents11", method = RequestMethod.GET)
	public String contents61() {
		logger.info("QuizPage START");
		logger.info("QuizPage END");
		return "contents/contents61";

	}
	
	@RequestMapping(value = "contents12", method = RequestMethod.GET)
	public String contents62() {
		logger.info("QuizPage START");
		logger.info("QuizPage END");
		return "contents/contents62";

	}
	
	@RequestMapping(value = "contents15", method = RequestMethod.GET)
	public String contents15() {
		logger.info("QuizPage START");
		logger.info("QuizPage ENE");
		return "contents/contents73";

	}

}