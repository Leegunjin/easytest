package com.scitmaster.easycodingu.reply.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scitmaster.easycodingu.board.dao.BoardMapper;
import com.scitmaster.easycodingu.person.vo.Person;
import com.scitmaster.easycodingu.reply.vo.Reply;

@Repository
public class ReplyDAO {
   
   private static final Logger logger = LoggerFactory.getLogger(ReplyDAO.class);

   @Autowired
   SqlSession sqlSession;

   public int insertReply(Reply reply){
		logger.info("insertReply START");
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = 0;
		try {
			result = mapper.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("insertReply END");
		return result;
	}
   
   public ArrayList<Reply> selectReplyAll(int b_num){
		logger.info("selectReplyAll START");
		
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<Reply> list = null;
		
		try {
			list = mapper.selectReplyAll(b_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("selectReplyAll END");
		return list;
	}
   
   public int deleteReply(int r_num){
		logger.info("deleteReply Start");
	   ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = 0;
		try {
			result = mapper.deleteReply(r_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("deleteReply END");
		return result;
	}
   
   
   // 게시글 삭제
   public Reply selectReplyOne (int r_num){
	      logger.info("selectReplyOne START");
	      ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
	      Reply reply = null;
	      try {
	         reply = mapper.selectReplyOne(r_num);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      logger.info("selectReplyOne END");
	      return reply;
	   }
}