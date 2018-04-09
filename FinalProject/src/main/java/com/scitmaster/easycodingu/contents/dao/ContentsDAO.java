package com.scitmaster.easycodingu.contents.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scitmaster.easycodingu.contents.vo.Contents;
import com.scitmaster.easycodingu.person.vo.Person;

@Repository
public class ContentsDAO {
   
   private static final Logger logger = LoggerFactory.getLogger(ContentsDAO.class);

   @Autowired
   SqlSession sqlSession;
   
   public Contents selectContent(int c_num){
      logger.info("selectContent START");
      System.out.println("c_num : " + c_num);
      ContentsMapper mapper = sqlSession.getMapper(ContentsMapper.class);
      Contents contents = null;
      try{
        contents = mapper.selectContent(c_num);
        System.out.println("contents : " + contents);
      }catch (Exception e){
         e.printStackTrace();
      }
      logger.info("selectContent END");
      return contents;
   }
   
}