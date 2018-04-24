package com.scitmaster.easycodingu.learning.dao;

import java.util.ArrayList;

import com.scitmaster.easycodingu.learning.vo.Learning;
import com.scitmaster.easycodingu.person.vo.Person;

public interface LearningMapper {

	//학습내역 저장
	public void insertLearning(Learning learning);
	
	//클리어한 최종 레벨 셀렉트
	public Integer selectBestLevel(String loginId);
	
	//중복된 c_num 제거한 개수, 사용자 레벨 정의
	public int selectClearCount(String loginId);
	
	//c_num과 id를 넘겨받아 내역이 존재하는지 확인
	public ArrayList<Learning> selectLearning(Learning learning);
   
}