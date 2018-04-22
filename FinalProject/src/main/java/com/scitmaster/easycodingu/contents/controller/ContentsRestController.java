package com.scitmaster.easycodingu.contents.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.scitmaster.easycodingu.contents.dao.ContentsDAO;
import com.scitmaster.easycodingu.contents.vo.Contents;

@RestController
@RequestMapping(value = "contents")
public class ContentsRestController {

	@Autowired
	ContentsDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(ContentsRestController.class);

	@RequestMapping(value = "contents71", method = RequestMethod.POST)
	public boolean blankTest(String answer, String cNum) {

		logger.info("contents71 START");

		logger.info("answer : " + answer);
		String c_num = "71" + cNum;
		int testNum = Integer.parseInt(c_num);
		System.out.println(testNum);
		Contents contents13 = dao.selectContent(testNum);
		String getanswer = contents13.getC_answer();

		String[] answerArr = getanswer.split("/");

		boolean result = false;

		for (int i = 0; i < answerArr.length; i++) {
			logger.info(answerArr[i]);

			if (answerArr[i].equals(answer)) {
				result = true;
				break;
			} else {
				result = false;
			}
		}

		logger.info("contents71 END");
		return result;
	}

	/*@RequestMapping(value = "contents310", method = RequestMethod.POST)
	public HashMap Contents310(int cNum, String userAnswer) {
		System.out.println("userAnswer : " + userAnswer);
		
		HashMap<String, Object> blankMap = new HashMap<>();
		boolean result = false;

		//String c_num = "31" + (Integer) userAnswer.get("cNum");
		String c_num = "31" + cNum;
		logger.info(c_num);

		Contents contents31 = dao.selectContent(Integer.parseInt(c_num));
		String answer = contents31.getC_answer();
		//String[] answerArr = answer.split("&");

		ArrayList<String> userAnswerArr = (ArrayList) userAnswer.get("answerArr");
		ArrayList<String> wrongAnswerArr = new ArrayList<>();
		ArrayList<String> rightAnswerArr = new ArrayList<>();
		ArrayList<String> errorReasonArr = new ArrayList<>();
		
		boolean semiCheckStr = true;
		for (int i = 0; i < answerArr.length; i++) {
			logger.info("answerArr[" + i + "]" + answerArr[i]);
			logger.info(userAnswerArr.get(i));

			if (answerArr[i].equals(userAnswerArr.get(i))) {
				result = true;
				blankMap.put("result", result);
			} else {
				result = false;
				wrongAnswerArr.add(userAnswerArr.get(i));
				rightAnswerArr.add(answerArr[i]);
				// semiCheckStr = userAnswerArr.get(1).equals(";");
				// return blankMap;
				// System.out.println("semiCheckStr : "+semiCheckStr);

			}
		}
		if (!(answerArr[0].equals(userAnswerArr.get(0)))) {
			result = false;
			switch (answerArr[0]) {
			case "+":
				errorReasonArr.add("두 수를 더해야 하는 관계이므로  + 가 정답입니다. ");
				break;
			case "-":
				errorReasonArr.add("두 수를 빼야 하는 관계이므로  - 가 정답입니다. ");
				break; 
			case "*":
				errorReasonArr.add("두 수를 곱해야 하는 관계이므로  * 가 정답입니다. ");
				break;
			case "/":
				errorReasonArr.add("두 수를 나누어야 하는 관계이므로  / 가 정답입니다. ");
				break;
			case "%":
				errorReasonArr.add("퍼센트 관계 이므로  % 를 써야합니다.  ");
				break;
			case "==":
				errorReasonArr.add("두개가 같으므로  == 가 정답입니다.  ");
				break;
			case "!=":
				errorReasonArr.add("두개가 다르므로  != 가 정답입니다. ");
				break;
			default:
				break;
			}
		}

		System.out.println("errorReasonArr : " + errorReasonArr);
		blankMap.put("wrongAnswerArr", wrongAnswerArr);
		blankMap.put("rightAnswerArr", rightAnswerArr);
		blankMap.put("errorReasonArr", errorReasonArr);
		blankMap.put("result", result);
		return blankMap;
	}*/

	@RequestMapping(value = "contents320", method = RequestMethod.POST)
	public boolean Contents320(@RequestBody HashMap<String, Object> userAnswer) {

		boolean result = false;

		String c_num = "32" + (Integer) userAnswer.get("cNum");
		logger.info(c_num);

		Contents contents32 = dao.selectContent(Integer.parseInt(c_num));
		String answer = contents32.getC_answer();
		String[] answerArr = answer.split("&");

		ArrayList<String> userAnswerArr = (ArrayList) userAnswer.get("answerArr");

		for (int i = 0; i < answerArr.length; i++) {
			logger.info(answerArr[i]);
			logger.info(userAnswerArr.get(i));

			if (answerArr[i].equals(userAnswerArr.get(i))) {
				result = true;
			} else {
				result = false;
				return result;
			}
		}

		return result;
	}

}