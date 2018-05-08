package com.scitmaster.easycodingu.Handler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class EasyExceptionHandler 
{
	// 컨트롤러 쪽에서 발생하는 익셉션을 받아오는 어노테이션 두 개 적용
	// @ControllerAdvice(클래스 위에) @ExceptionHandler(함수 위에)
	
	/*익셉션을 아래 파라메터 안에 모든 익셉션을 하나가 처리하게 할 수도 있고 익셉션 상황별로 따로따로 처리 할 수도 있다*/
	@ExceptionHandler(Exception.class)// 모든 익셉션을 처리할 수 있는 최상위 익셉션을 받아온 상황
	public String errorHandler(Exception e)
	{
		e.printStackTrace();
		
		//아까 만든 에러페이지
		return "/error";
	}
	
	
	
}
