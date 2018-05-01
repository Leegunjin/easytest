package com.scitmaster.easycodingu.contents.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
 
	ArrayList<String> vbArr = new ArrayList<>();
	ArrayList<String> valueArr = new ArrayList<>();
	HashMap<String, Object> calMap = new HashMap<>();
	
	@RequestMapping(value = "contents71", method = RequestMethod.POST)
	   public HashMap blankTest(String userAnswer, String cNum) {
	      logger.info("contents71 AG TEST START");				//에러 테스트 알고리즘 시작
	      System.out.println("userAnswer : "+ userAnswer);		//화면에서 가져온 정답
	      
	      /* 슬라이드 번호 만들기 */
	      String c_num = "71" + cNum;							//화면에서 가져온 슬라이드 넘버와 문제 번호를 합친 숫자 - 슬라이드를 특정함
	      int slideNum = Integer.parseInt(c_num);				//숫자인 슬라이드 특정 번호를 int로 변경
	      System.out.println("슬라이드 번호 : "+slideNum);			//슬라이드 번호 확인
	      
	      HashMap<String, Object> resultMap = new HashMap<>();
	      resultMap.put("userAnswerFull", userAnswer);
	      
	      if (slideNum == 715 || slideNum == 716 || slideNum == 717) {
	    	  resultMap.put("result", true);
	    	  return resultMap;
		  }
	      
	      /* DB에서 가져온 정답 처리 */
	      Contents contents13 = dao.selectContent(slideNum);	//슬라이드번호로 DB에서 해당하는 번호/문제/답 을 가져옴
	      String getanswer = contents13.getC_answer();			//가져온 것에서 답만 꺼내 getanswer에 담는다.
	      String[] answerArr = getanswer.split("#3355#");		//#3355# 기준으로 getanswer을 잘라서 배열에 넣는다. 
	      
	      /* ArrayList, HashMap 생성 */
	      ArrayList<String> testArr = new ArrayList<>();		//ArrayList생성
	      	//화면에 Return으로 가져갈 HashMap 생성
	      boolean result = true;								//HashMap에 담아갈 정답, 오답 여부
	      ArrayList<String> errorReason = new ArrayList<>();	//에러 이유 알려주는 ArrayList	
	      
	      /* 배열에 넣은 정답을 ArrayList에 넣기 */
	      for(int i = 0; i < answerArr.length; i++) {					//배열 길이만큼 돌면서 하나씩 꺼낸다. 
	    	 System.out.println("answerArr["+i+"] : " + answerArr[i]); 	//꺼내는 것들을 확인
	    	 testArr.add(answerArr[i]);									//ArrayList에 꺼낸 답들을 하나씩 넣는다. 
	    	 System.out.println("testArr.get("+i+") : "+testArr.get(i));
	      }   
	      
	      /* 마지막 자리 ;인지 확인하기 */
	      if (711 <= slideNum && slideNum <= 713 ) {
		      String checkSemi = userAnswer.substring(userAnswer.length()-1, userAnswer.length());
		      System.out.println("checkSemi : " + checkSemi);
		      if (!(checkSemi.equals(";"))) {
		    	  result = false;
		    	  resultMap.put("result", result);
				  //errorReason.add("세미콜론(;)이 없습니다.");
		    	  errorReason.add(";(세미콜론)이 없습니다.");
				  resultMap.put("errorReason", errorReason);
				  return resultMap;
			  }
	      }
	      
	      /* 공백으로 문자열 나누기 */
	      String[] spaceStr = null;
	      if (711 <= slideNum && slideNum <= 713) {
		      spaceStr = userAnswer.split("\\s+");
		      System.out.println("spaceStr.length : "+spaceStr.length);
		      for (int i = 0; i < spaceStr.length; i++) {
		    	  System.out.println("spaceStr["+i+"] : "+spaceStr[i]);
			  }
	      }
	      
	      if (711 <= slideNum && slideNum <= 713 ) {
	      
	      String splitUA1int, splitUA2int, splitUA3int, splitUA4int, splitUA5int;
	      /*switch (contentType) {*/
				/*case "int":*/
					//int 타입 선언 생성 5개 블록
					
					
					//0. equal 체크
					boolean equalCheckInt = userAnswer.contains("=");
				    if (equalCheckInt == false) {
				    	result = false;
				    	resultMap.put("result", result);
						//errorReason.add("Equal(=)이 없습니다.");
				    	errorReason.add("문법에 맞지 않습니다. =(equal)이 없습니다. ");
						resultMap.put("errorReason", errorReason);
						return resultMap;
					}
					
					//1. 자료형 자르기- int OR Integer
					String testInt = userAnswer.substring(0,4);
				    /*String testInteger = userAnswer.substring(0,8);*/
				    System.out.println("testInt : "+testInt);
				    /*System.out.println("testInteger : "+testInteger);*/
				    splitUA1int = "";
				    if (testInt.toLowerCase().equals("int ")) {
				    	System.out.println("int YES");
				        splitUA1int = "int ";
				    }/* else if (testInteger.toLowerCase().equals("integer ")) {
				        System.out.println("Integer YES");
				        splitUA1int = "Integer ";
					}*/
				    System.out.println("splitUA1(자료형) : "+splitUA1int);
				    
				    //1-1. 자료형 에러 
				    if (!(testInt.toLowerCase().equals(testArr.get(0))) && !(spaceStr[0].toLowerCase().equals("integer"))) {
				    	result = false;
				    	errorReason.add("int형이 아닙니다.");
					} else if (testInt.toLowerCase().equals(testArr.get(0))) {
						if (!(testInt.substring(0, 1).equals("i")) && testInt.substring(0, 1).equals("I")) {
							result = false;
				    		errorReason.add("int의 i는 소문자로 써야합니다. ");
						}
					    if (!(testInt.substring(1, 2).equals("n")) && testInt.substring(1, 2).equals("N")) {
				    	    result = false;
				    		errorReason.add("int의 n은 소문자로 써야합니다. ");
						}
					    if (!(testInt.substring(2, 3).equals("t")) && testInt.substring(2, 3).equals("T")) {
				    		result = false;
				    		errorReason.add("int의 t는 소문자로 써야합니다. ");
						}
					} else if (spaceStr[0].toLowerCase().equals("integer")) {
						if (spaceStr[0].substring(0, 1).equals("i")) {
							result = false;
				    		errorReason.add("Integer의 I는 대문자로 써야합니다. ");
						} 
						String upperCaseRegex = "[A-Z]";
						Pattern pattern = Pattern.compile(upperCaseRegex);
						Matcher match = pattern.matcher(spaceStr[0].substring(1, 7));		
						System.out.println("arStr[0].substring(1, 7) : " + spaceStr[0].substring(1, 7));
						System.out.println("match.find() : " + match.find());
						if (match.find() == true) {
							result = false;
				    		errorReason.add("Integer의 I를 제외한 나머지 글자는 소문자로 써야합니다. ");
						}
					}  
				    
				    //2. 변수명
				    userAnswer = userAnswer.replaceFirst(testInt, "");	    //userAnswer에서 splitUA1만큼 제거
				    userAnswer = userAnswer.trim();
				    System.out.println("userAnswer :"+userAnswer);
				    int equalIndexNum = userAnswer.indexOf("=");				//=의 index 꺼냄
				    splitUA2int = userAnswer.substring(0, equalIndexNum);		//=까지 문자열 자름
				    splitUA2int = splitUA2int.trim();
				    String spaceRegex = "\\s";
				    Pattern spacepattern = Pattern.compile(spaceRegex);
					Matcher spacematch = spacepattern.matcher(splitUA2int);	
					if (spacematch.find() == true) {
					    result = false;
					    errorReason.add("변수명에는 공백이 들어갈 수 없습니다. ");
					}
				    System.out.println("splitUA2 (변수명) :"+splitUA2int);	
				    
				    //2-1. 변수명 에러
				    if (splitUA2int.isEmpty()) {
				    	  result = false;
			    		  errorReason.add("변수명이 없습니다.");
					} else if (!(splitUA2int.isEmpty())) {
						Contents keywordContent = dao.selectContent(996);	
						String keyWord = keywordContent.getC_answer();
						String[] keywordarr = keyWord.split("/");
						for (int i = 0; i < keywordarr.length; i++) {
							//System.out.println("keywordarr[i] : "+keywordarr[i]);
						    if (keywordarr[i].equals(splitUA2int.toLowerCase())) {
						    	result = false;
								errorReason.add("키워드는 변수명으로 사용할 수 없습니다. ");
							}
						}
						String upperCaseRegex = "[A-Z]";
						Pattern pattern = Pattern.compile(upperCaseRegex);
						Matcher match = pattern.matcher(splitUA2int.substring(0, 1));
						if (match.find() == true) {
							result = false;
				    		errorReason.add("변수명의 첫글자는 소문자로 써야 합니다.  ");
						}
						String numberRegex = "[0-9]";
						Pattern pattern2 = Pattern.compile(numberRegex);
						Matcher match2 = pattern2.matcher(splitUA2int.substring(0, 1));
						if (match2.find() == true) {
							result = false;
							errorReason.add("변수명의 첫글자는 숫자가 올 수 없습니다. ");
						}
					}
				    /*if (result) {
				    	vbArr.add(splitUA2int);
						//resultMap.put("vbName", vbArr);
				    	System.out.println("vbArr : " + vbArr);
					}*/
				    
				    //3. 등호 표시
				    userAnswer = userAnswer.replaceFirst(splitUA2int, "");
				    userAnswer = userAnswer.trim();
				    System.out.println("userAnswer :"+userAnswer);
				    int equalIndexNum1 = userAnswer.indexOf(";");
				    splitUA3int = userAnswer.substring(0, 1);
				    splitUA3int = splitUA3int.trim();
				    System.out.println("splitUA3 (=):"+splitUA3int);
					//3-1. 등호 에러
					if (!(splitUA3int.equals(testArr.get(2)))) {
				    	result = false;
						errorReason.add("등호(=)가 없습니다.");
					}
					
					//4. 값
					userAnswer = userAnswer.replaceFirst(splitUA3int, "");
				    userAnswer = userAnswer.trim();
				    System.out.println("userAnswer :"+userAnswer);
				    int equalIndexNum2 = userAnswer.indexOf(";");
				    splitUA4int = userAnswer.substring(0, equalIndexNum2);
				    splitUA4int = splitUA4int.trim();
				    System.out.println("splitUA4 :"+splitUA4int);
				    
				    //4-1. 값 에러
				    if (splitUA4int.isEmpty()) {
				    	  result = false;
						  errorReason.add("값이 없습니다.");
					  } else if (!(splitUA4int.isEmpty()) && splitUA1int.toLowerCase().equals(testArr.get(0))) {
						  //String valueRegex = "^[0-9]+$";
						  /*Pattern valuePattern = Pattern.compile("^[0-9]+$");
						  Matcher valueMatch = valuePattern.matcher(splitUA4);*/
						  boolean valueCheck = Pattern.matches("^[0-9]+$", splitUA4int);
						  System.out.println("valueCheck : " + valueCheck);
						  if (valueCheck == false) {
							  System.out.println("valueCheck - 2 : " + valueCheck);
							  result = false;
							  errorReason.add("int형에는 문자를 쓸 수 없습니다. ");
						  }
						  if (splitUA4int.contains(".")) {
							  result = false;
							  errorReason.add("int형에는 소수를 쓸 수 없습니다. ");
						  }
						  /*boolean specialLettersCheck = Pattern.matches("[^A-Za-z0-9]", splitUA4);
						  System.out.println("specialLettersCheck : " + specialLettersCheck);
						  if (specialLettersCheck == false) {
							  System.out.println("specialLettersCheck - 2: " + specialLettersCheck);
							  result = false;
							  errorReason.add("int형에는 특수문자를 쓸 수 없습니다. ");
						  }*/
					  }
				    /*if (result) {
				    	valueArr.add(splitUA4int);
						//resultMap.put("vbValue", valueArr);
				    	System.out.println("valueArr : "+ valueArr);
					}*/
				    
				    //5. 세미콜론
				    userAnswer = userAnswer.replaceFirst(splitUA4int, "");
				    //userAnswer = userAnswer.trim();
				    System.out.println("userAnswer :"+userAnswer);
				    //int equalIndexNum3 = userAnswer.indexOf(";");
				    splitUA5int = userAnswer;
				    splitUA5int = splitUA5int.trim();
				    System.out.println("splitUA5 :"+splitUA5int);
				    
				    if (!(splitUA5int.equals(testArr.get(4)))) {
				    	result = false;
						errorReason.add(";이 없습니다.");
					}
				    System.out.println("errorReason : " + errorReason);
				    calMap.put(splitUA2int, splitUA4int);
				    System.out.println("calMap : " + calMap);
				    System.out.println("calMap.get : " + calMap.get(splitUA2int));
				    resultMap.put("calMap", calMap);
				    resultMap.put("result", result);
				    resultMap.put("userAnswer", userAnswer);
				    resultMap.put("errorReason", errorReason);
				    /*break;*/
					    
				
	      }
	      /* 화면에서 가져온 사용자 답을 처리 */
	      if (slideNum == 711) {
		      /* SplitUA1 : int */
		      //String splitUA1 = userAnswer.substring(0, 4);				//'int '를 꺼내기 위해 substring로 자름
		      /*
		      String splitUA1Integer = userAnswer.substring(0, 8);
		      String splitUA1 = "";
		      if (splitUA1int.toLowerCase().equals("int ")) {
		    	  splitUA1 = "int ";
			  } 
		      if (splitUA1Integer.toLowerCase().equals("integer ")) {
				  splitUA1 = "Integer ";
			  }
			  */
		      /*String testInt = userAnswer.substring(0,4);
		      String testInteger = userAnswer.substring(0,8);
		      System.out.println("testInt : "+testInt);
		      System.out.println("testInteger : "+testInteger);
		      String splitUA1 = "";
		      if (testInt.toLowerCase().equals("int ")) {
		    	  System.out.println("int YES");
		    	  splitUA1 = "int ";
		      } else if (testInteger.toLowerCase().equals("integer ")) {
		    	  System.out.println("Integer YES");
		    	  splitUA1 = "Integer ";
			  }
		      System.out.println("splitUA1(자료형) : "+splitUA1);*/
		      
		      //System.out.println("splitUA1 (int):"+splitUA1);
		      
		      /* SplitUA2 : 변수명 */
		      /*userAnswer = userAnswer.replaceFirst(splitUA1, "");	    //userAnswer에서 splitUA1만큼 제거
		      userAnswer = userAnswer.trim();
		      System.out.println("userAnswer :"+userAnswer);
		      int equalIndexNum = userAnswer.indexOf("=");				//=의 index 꺼냄
		      String splitUA2 = userAnswer.substring(0, equalIndexNum);	//=까지 문자열 자름
		      splitUA2 = splitUA2.trim();
		      String spaceRegex = "\\s";
		      Pattern spacepattern = Pattern.compile(spaceRegex);
			  Matcher spacematch = spacepattern.matcher(splitUA2);	
			  if (spacematch.find() == true) {
				  result = false;
				  errorReason.add("변수명에는 공백이 들어갈 수 없습니다. ");
			  }
		      System.out.println("splitUA2 (변수명) :"+splitUA2);	*/	  
		      		  
		      /* SplitUA3 : = */
		      /*userAnswer = userAnswer.replaceFirst(splitUA2, "");
		      userAnswer = userAnswer.trim();
		      System.out.println("userAnswer :"+userAnswer);
		      int equalIndexNum1 = userAnswer.indexOf(";");
		      String splitUA3 = userAnswer.substring(0, 1);
		      splitUA3 = splitUA3.trim();
		      System.out.println("splitUA3 (=):"+splitUA3);*/
		      
		      /*SplitUA4 : 사용자가 입력한 값*/ 
		      /*userAnswer = userAnswer.replaceFirst(splitUA3, "");
		      userAnswer = userAnswer.trim();
		      System.out.println("userAnswer :"+userAnswer);
		      int equalIndexNum2 = userAnswer.indexOf(";");
		      String splitUA4 = userAnswer.substring(0, equalIndexNum2);
		      splitUA4 = splitUA4.trim();
		      System.out.println("splitUA4 :"+splitUA4);*/
		      
		      /*SplitUA5 : ; */ 
		      /*userAnswer = userAnswer.replaceFirst(splitUA4, "");
		      //userAnswer = userAnswer.trim();
		      System.out.println("userAnswer :"+userAnswer);
		      //int equalIndexNum3 = userAnswer.indexOf(";");
		      String splitUA5 = userAnswer;
		      splitUA5 = splitUA5.trim();
		      System.out.println("splitUA5 :"+splitUA5);*/
		      	      
		      /*if (!(splitUA1.toLowerCase().equals(testArr.get(0))) && !(spaceStr[0].toLowerCase().equals("integer"))) {
		    	  result = false;
		    	  errorReason.add("int형이 아닙니다.");
			  } else if (splitUA1.toLowerCase().equals(testArr.get(0))) {
				  if (!(splitUA1.substring(0, 1).equals("i")) && splitUA1.substring(0, 1).equals("I")) {
		    		  result = false;
		    		  errorReason.add("int의 i는 소문자로 써야합니다. ");
				  }
			      if (!(splitUA1.substring(1, 2).equals("n")) && splitUA1.substring(1, 2).equals("N")) {
		    		  result = false;
		    		  errorReason.add("int의 n은 소문자로 써야합니다. ");
				  }
			      if (!(splitUA1.substring(2, 3).equals("t")) && splitUA1.substring(2, 3).equals("T")) {
		    		  result = false;
		    		  errorReason.add("int의 t는 소문자로 써야합니다. ");
				  }
			  } else if (spaceStr[0].toLowerCase().equals("integer")) {
				  if (spaceStr[0].substring(0, 1).equals("i")) {
					  result = false;
		    		  errorReason.add("Integer의 I는 대문자로 써야합니다. ");
				  } 
				  String upperCaseRegex = "[A-Z]";
				  Pattern pattern = Pattern.compile(upperCaseRegex);
				  Matcher match = pattern.matcher(spaceStr[0].substring(1, 7));		
				  System.out.println("arStr[0].substring(1, 7) : " + spaceStr[0].substring(1, 7));
				  System.out.println("match.find() : " + match.find());
				  if (match.find() == true) {
					  result = false;
		    		  errorReason.add("Integer의 I를 제외한 나머지 글자는 소문자로 써야합니다. ");
				  }
			  }  */
		      /*if (splitUA2.isEmpty()) {
		    	  result = false;
	    		  errorReason.add("변수명이 없습니다.");
			  } else if (!(splitUA2.isEmpty())) {
				  Contents keywordContent = dao.selectContent(996);	
				  String keyWord = keywordContent.getC_answer();
				  String[] keywordarr = keyWord.split("/");
				  for (int i = 0; i < keywordarr.length; i++) {
					  //System.out.println("keywordarr[i] : "+keywordarr[i]);
					  if (keywordarr[i].equals(splitUA2.toLowerCase())) {
						  result = false;
						  errorReason.add("키워드는 변수명으로 사용할 수 없습니다. ");
					  }
				  }
				  String upperCaseRegex = "[A-Z]";
				  Pattern pattern = Pattern.compile(upperCaseRegex);
				  Matcher match = pattern.matcher(splitUA2.substring(0, 1));
				  if (match.find() == true) {
					  result = false;
		    		  errorReason.add("변수명의 첫글자는 소문자로 써야 합니다.  ");
				  }
				  String numberRegex = "[0-9]";
				  Pattern pattern2 = Pattern.compile(numberRegex);
				  Matcher match2 = pattern2.matcher(splitUA2.substring(0, 1));
				  if (match2.find() == true) {
					  result = false;
					  errorReason.add("변수명의 첫글자는 숫자가 올 수 없습니다. ");
				  }
			  }*/
		      
		      /*if (!(splitUA3.equals(testArr.get(2)))) {
		    	  result = false;
				  errorReason.add("등호(=)가 없습니다.");
			  }*/
		      
		      /*if (splitUA4.isEmpty()) {
		    	  result = false;
				  errorReason.add("값이 없습니다.");
			  } else if (!(splitUA4.isEmpty()) && splitUA1.toLowerCase().equals(testArr.get(0))) {
				  //String valueRegex = "^[0-9]+$";
				  Pattern valuePattern = Pattern.compile("^[0-9]+$");
				  Matcher valueMatch = valuePattern.matcher(splitUA4);
				  boolean valueCheck = Pattern.matches("^[0-9]+$", splitUA4);
				  System.out.println("valueCheck : " + valueCheck);
				  if (valueCheck == false) {
					  System.out.println("valueCheck - 2 : " + valueCheck);
					  result = false;
					  errorReason.add("int형에는 문자를 쓸 수 없습니다. ");
				  }
				  if (splitUA4.contains(".")) {
					  result = false;
					  errorReason.add("int형에는 소수를 쓸 수 없습니다. ");
				  }
				  boolean specialLettersCheck = Pattern.matches("[^A-Za-z0-9]", splitUA4);
				  System.out.println("specialLettersCheck : " + specialLettersCheck);
				  if (specialLettersCheck == false) {
					  System.out.println("specialLettersCheck - 2: " + specialLettersCheck);
					  result = false;
					  errorReason.add("int형에는 특수문자를 쓸 수 없습니다. ");
				  }
			  } */
		      /*if (!(splitUA5.equals(testArr.get(4)))) {
		    	  result = false;
				  errorReason.add(";이 없습니다.");
			  } */
		      /*int test = errorReason.indexOf("int형에는 문자를 쓸 수 없습니다. ");
			  String test2 = splitUA5.substring(splitUA5.length()-1, splitUA5.length());
			  boolean testBol = (test != -1) && (test2.equals(";"));
			  if (testBol) {
				  int test3 = errorReason.indexOf(";이 없습니다.");
				  errorReason.remove(test3);
			  }*/
		      
		      /*if (splitUA5.substring(splitUA5.length()-1, splitUA5.length()).equals(";")) {
		    	  String semiMsg = ";이 없습니다.";
				  int semiCheck = errorReason.indexOf(semiMsg);
				  System.out.println(semiCheck);
				  errorReason.remove(semiCheck);
			  }*/
		      //errorReason.add("test");
		      
			  /*System.out.println("errorReason : "+errorReason);
		      resultMap.put("result", result);
		      resultMap.put("userAnswer", userAnswer);
		      resultMap.put("errorReason", errorReason);*/
	      }
	      
	      if (slideNum == 714) {
	    	  System.out.println("714UserAnswer : " + userAnswer);
	    	  String[] slide714answerArr = userAnswer.split("/");
	    	  
	    	  Set set = calMap.keySet();
	    	  Iterator iterator = set.iterator();
	    	  String key = "";
	    	  int check = 0;
	    	  while(iterator.hasNext()){
	    		  key = (String)iterator.next();
	    		  System.out.println("calMap Key : " + key);
	    		  if (slide714answerArr[0].equals(key)){
	    			  check++;
				  }
	    		  if (slide714answerArr[1].equals(key)) {
	    			  check++;
				  }
	    		  if (slide714answerArr[2].equals(key)) {
	    			  check++;
				  }
	    	  }
	    	  int xSum = 1;
	    	  if (check != 3) {
	    		  result = false;
	    		  errorReason.add("정해 놓은 변수명과 다릅니다.");
			  } else if (check == 3) {
				  while(iterator.hasNext()){
		    		  //key = (String)iterator.next();
		    		  System.out.println("calMap Key2 : " + key);
		    		  int keyValue = (int)calMap.get(key);
		    		  xSum *= keyValue;
		    	  }
			  }
	    	 
	    	  System.out.println("xSum : "+xSum);
	    	  resultMap.put("xSum", xSum);
	    	  resultMap.put("calMap", calMap);
			  resultMap.put("result", result);
			  resultMap.put("userAnswer", userAnswer);
			  resultMap.put("errorReason", errorReason);
	      }
	      
	      if (slideNum == 715) {
	    	  Set set = calMap.keySet();
	    	  Iterator iterator = set.iterator();
	    	  String key = "";
	    	  int check = 0;
	    	  int xSum = 1;
	    	  while(iterator.hasNext()){
	    		  key = (String)iterator.next();
	    		  System.out.println("calMap Key2 : " + key);
	    		  int keyValue = (int)calMap.get(key);
	    		  xSum *= keyValue;
	    	  }
	    	  System.out.println("xSum : "+xSum);
	    	  resultMap.put("xSum", xSum);
	    	  resultMap.put("slideNum", 715);
		  }
	      
	      logger.info("contents71 END");
	      return resultMap;
	   }
	
	/*@RequestMapping(value = "contents71", method = RequestMethod.POST)
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
	}*/

	/*@RequestMapping(value = "contents5", method = RequestMethod.POST)
	public HashMap Contents31(int cNum, String userAnswer) {
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
	
	   /*@RequestMapping(value = "contents5", method = RequestMethod.POST)
	   public HashMap Contents31(String cNum, String userAnswer) {
	   
	      HashMap<String, Object> blankMap = new HashMap<>();
	      boolean result = false;
	      
	      // 컨텐츠넘버
	      String c_num = "31" + cNum;
	      logger.info(c_num);

	      // 번호로 컨텐츠 가져오기
	      Contents contents31 = dao.selectContent(Integer.parseInt(c_num));
	      // 컨텐츠의 정답 불러오기
	      String answer = contents31.getC_answer();

	      // 잘못된 정답
	      String wrongAnswer = "";
	      // 맞은 정답
	      String rightAnswer = "";
	      // 에러 메세지
	      String errorReason = "";

	      if (answer.equals(userAnswer)) {
	         result = true;
	         blankMap.put("result", result);
	      } else {
	         result = false;
	         wrongAnswer = userAnswer;
	         rightAnswer = answer;

	         switch (answer) {
	            case "+":
	               errorReason = "두 수를 더해야 하는 관계이므로  + 가 정답입니다.";
	               break;
	            case "-":
	               errorReason = "두 수를 더해야 하는 관계이므로  - 가 정답입니다.";
	               break;
	            case "*":
	               errorReason = "두 수를 곱해야 하는 관계이므로  * 가 정답입니다. ";
	               break;
	            case "/":
	               errorReason = "두 수를 나누어야 하는 관계이므로  / 가 정답입니다. ";
	               break;
	            case "%":
	               errorReason = "퍼센트 관계 이므로  % 를 써야합니다. ";
	               break;
	            case "==":
	               errorReason = "두개가 같으므로  == 가 정답입니다. ";
	               break;
	            case "!=":
	               errorReason = "두개가 다르므로  != 가 정답입니다. ";
	               break;
	            default:
	               break;
	         }
	      }

	      System.out.println("errorReason : " + errorReason);
	      blankMap.put("wrongAnswer", wrongAnswer);
	      blankMap.put("rightAnswer", rightAnswer);
	      blankMap.put("errorReason", errorReason);
	      blankMap.put("result", result);
	      return blankMap;
	   }*/

	 
		@RequestMapping(value = "contents6", method = RequestMethod.POST)
		public HashMap Contents320(@RequestBody HashMap<String, Object> userAnswer) {
		      
			  HashMap<String, Object> blankMap = new HashMap<>();
		      boolean result = false;
		      
		      String c_num = "32" + (Integer) userAnswer.get("cNum");
		      logger.info(c_num);
		   
		      Contents contents32 = dao.selectContent(Integer.parseInt(c_num));
		      String answer = contents32.getC_answer();
		      String[] answerArr = answer.split("&");
		      
		      ArrayList<String> userAnswerArr = (ArrayList) userAnswer.get("answerArr");
		      ArrayList<String> wrongAnswerArr = new ArrayList<>();
		      ArrayList<String> rightAnswerArr = new ArrayList<>();
		      ArrayList<String> errorReasonArr = new ArrayList<>();
		      boolean semiCheckStr = true;
		      for(int i = 0; i < answerArr.length; i++) {
		         logger.info("answerArr["+i+"]"+answerArr[i]);
		         logger.info(userAnswerArr.get(i));
		         
		         if(answerArr[i].equals(userAnswerArr.get(i))) {
		            result = true;
		            blankMap.put("result", result);
		         } else {
		            result = false;
		            wrongAnswerArr.add(userAnswerArr.get(i));
		            rightAnswerArr.add(answerArr[i]);
		            semiCheckStr = userAnswerArr.get(1).equals(";"); 
		            //return blankMap;
		            System.out.println("semiCheckStr : "+semiCheckStr);
		            
		         }
		      }
		      if (semiCheckStr == false) {
		    	  result = false;
		    	  errorReasonArr.add("문장의 마지막에 세미콜론을 쓰지 않았습니다. ");
			  } 
		      if (!(answerArr[0].equals(userAnswerArr.get(0)))) {
		    	  result = false;
		          switch (answerArr[0]) {
			    		case "+":
			    			errorReasonArr.add("두 문장을 더해야 하는 관계이므로 +가 정답입니다. ");
			    			break;
						case "-":
							errorReasonArr.add("두 문장을 빼야 하는 관계이므로 -가 정답입니다. ");    			
							break;
						case "*":
							errorReasonArr.add("두 문장을 곱해야 하는 관계이므로 *가 정답입니다. ");
							break;
						case "/":
							errorReasonArr.add("두 문장을 나누어야 하는 관계이므로 /가 정답입니다. ");
							break;
			    		default:
			    			break;
		  	    }
		      }
		      System.out.println("errorReasonArr : "+errorReasonArr);
		      blankMap.put("wrongAnswerArr", wrongAnswerArr);
		      blankMap.put("rightAnswerArr", rightAnswerArr);
		      blankMap.put("errorReasonArr", errorReasonArr);
		      blankMap.put("result", result);
		      return blankMap;
	   }
	   
	   @RequestMapping(value = "contents8", method = RequestMethod.POST)
	   public boolean Contents42(@RequestBody HashMap<String, Object> userAnswerMap) {
	      
	      boolean result = false;
	      
	      String c_num = "42" + (Integer) userAnswerMap.get("cNum");
	      logger.info(c_num);
	   
	      Contents contents42 = dao.selectContent(Integer.parseInt(c_num));
	      String answer = contents42.getC_answer();
	      
	      String userAnswer = (String) userAnswerMap.get("answer");
	      
	         logger.info(userAnswer);
	         
	         if(answer.equals(userAnswer)) {
	            result = true;
	         } else {
	            result = false;
	            return result;
	         }

	         return result;
	   }
	      
	   @RequestMapping(value = "contents10", method = RequestMethod.POST)
	   public boolean Contents52(@RequestBody HashMap<String, Object> userAnswer) {
	         
		   boolean result = false;
	         
	         String c_num = "52" + (Integer) userAnswer.get("cNum");
	         logger.info(c_num);
	      
	         Contents contents52 = dao.selectContent(Integer.parseInt(c_num));
	         String answer = contents52.getC_answer();
	         String[] answerArr = answer.split("#3355#");
	         
	         ArrayList<String> userAnswerArr = (ArrayList) userAnswer.get("answerArr");
	         
	        for(int i = 0; i < answerArr.length; i++) {
	            logger.info(answerArr[i]);
	            logger.info(userAnswerArr.get(i));
	            
	            if(answerArr[i].equals(userAnswerArr.get(i))) {
	               result = true;
	            } else {
	               result = false;
	               return result;
	            }
	         }

	         return result;
	      }

}