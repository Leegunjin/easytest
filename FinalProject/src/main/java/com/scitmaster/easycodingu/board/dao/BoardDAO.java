package com.scitmaster.easycodingu.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scitmaster.easycodingu.contents.vo.Contents;
import com.scitmaster.easycodingu.person.vo.Person;

@Repository
public class BoardDAO {
   
   private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

   @Autowired
   SqlSession sqlSession;
   
   
   
}