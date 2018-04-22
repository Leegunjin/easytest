package com.scitmaster.easycodingu.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scitmaster.easycodingu.board.dao.BoardMapper;
import com.scitmaster.easycodingu.board.vo.Board;
import com.scitmaster.easycodingu.reply.vo.Reply;


@Repository
public class BoardDAO {
   
   private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

   @Autowired
   SqlSession sqlSession;
   
   public int getTotal(HashMap<String, Object> searchMap){
		logger.info("getTotal Start");
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		System.out.println("searchMap : " + searchMap);
		int result = 0;
		try {
			result = mapper.getTotal(searchMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		logger.info("getTotal End");
		return result;
	}
   
   public ArrayList<Board> selectBoardAll(HashMap<String, Object> searchMap,int startRecord, int countPerPage){
		
		logger.info("selectBoardAll START");
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Board> list = null;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		try {
			list = mapper.selectBoardAll(searchMap, rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("selectBoardAll END");
		
		return list;
	}
   
   public int insertBoard(Board board){
		logger.info("insertBoard START");
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		
		try {
			result = mapper.insertBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("insertBoard END");
		return result;
	}
   
   public int deleteBoard(int boardnum){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		try {
			result = mapper.deleteBoard(boardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
   
   public Board selectBoardOne(int b_num){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		Board board = null;
		try {
			mapper.updateHits(b_num);
			board = mapper.selectBoardOne(b_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
   
   public int updateBoard(Board board){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.updateBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
   
}