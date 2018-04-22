package com.scitmaster.easycodingu.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.scitmaster.easycodingu.board.vo.Board;
import com.scitmaster.easycodingu.contents.vo.Contents;
import com.scitmaster.easycodingu.person.vo.Person;

public interface BoardMapper {
	
	public int getTotal(HashMap<String, Object> searchMap);
   
	//전체 보드 select - 게시판 보기
	public ArrayList<Board> selectBoardAll(HashMap<String, Object> searchMap, RowBounds rb);
	
	//insert - 글 보기
	public int insertBoard(Board board);
	
	public void updateHits(int b_num);
	
	//board1개 select - 글 1개 읽기
	public Board selectBoardOne(int b_num);
	
	//delete - 글 삭제
	public int deleteBoard(int b_num);
	
	//update - 글 수정
	public int updateBoard(Board board);
}