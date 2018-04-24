package com.scitmaster.easycodingu.learning.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scitmaster.easycodingu.learning.vo.Learning;
import com.scitmaster.easycodingu.person.vo.Person;

@Repository
public class LearningDAO {
   
   private static final Logger logger = LoggerFactory.getLogger(LearningDAO.class);

   @Autowired
   SqlSession sqlSession;
   
   //학습내역 저장
   public void insertLearning(Learning learning){
	   logger.info("학습내역 저장 시작");
	   LearningMapper mapper = sqlSession.getMapper(LearningMapper.class);
	   
	   try{
		   mapper.insertLearning(learning);
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   logger.info("학습내역 저장 종료");
   }
   
   //클리어한 최종 레벨 셀렉트
   public Integer selectBestLevel(String loginId){
	   logger.info("최종레벨 셀렉트 시작");
	   LearningMapper mapper = sqlSession.getMapper(LearningMapper.class);
	   Integer bestLevel = 0;
	   try{
		   bestLevel = mapper.selectBestLevel(loginId);
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   logger.info("최종레벨 셀렉트 종료");
	   
	   return bestLevel;
   }
   
   //c_num과 id를 넘겨받아 내역이 존재하는지 확인
   public ArrayList<Learning> selectLearning(Learning param_learning){
	   logger.info("학습내역 조회 시작");
	   LearningMapper mapper = sqlSession.getMapper(LearningMapper.class);
	   ArrayList<Learning> learning = null;
	   
	   try{
		   learning = mapper.selectLearning(param_learning);
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   logger.info("학습내역 조회 종료");
	   return learning;
   }

   /*//중복된 c_num 제거한 개수, 사용자 레벨 정의
   public int selectClearCount(String loginId){
	   logger.info("사용제레벨 시작");
	   LearningMapper mapper = sqlSession.getMapper(LearningMapper.class);
	   int countLevel 
	   
	   logger.info("사용제레벨 종료");
   }*/
   
}