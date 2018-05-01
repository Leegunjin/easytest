package com.scitmaster.easycodingu.board.controller;

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

import com.scitmaster.easycodingu.board.dao.BoardDAO;
import com.scitmaster.easycodingu.board.vo.Board;
import com.scitmaster.easycodingu.common.util.FileService;
import com.scitmaster.easycodingu.reply.vo.Reply;

@RestController
@RequestMapping(value="board")
public class BoardRestController {
   
   @Autowired
   BoardDAO dao;
   
   private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
   
   @RequestMapping(value="read", method=RequestMethod.POST)
   public Board read(int bnum){
	   logger.info("read START");
	   System.out.println("bnum : "+bnum);
	   
	   int b_num = bnum;
	   Board board = dao.selectBoardOne(b_num);
	   System.out.println("board.getHashTag() : "+board.getHashTag());
	   if (board.getHashTag() != null) {
		   String[] hashtagArr = board.getHashTag().split("#");
	   }
		
	   logger.info("read END");
	   return board;
   }
   
   /*@RequestMapping(value="deleteBoard", method=RequestMethod.GET)
	public String deleteBoard(int b_num, HttpSession session){
		logger.info("deleteBoard START");
		
		String id = (String)session.getAttribute("loginId");
		Board board= dao.selectBoardOne(b_num);
		
		if (!(id.equals(board.getB_id()))) {
			return "redirect:boardList";
		}
		Board vo = dao.selectBoardOne(b_num);
		int result = dao.deleteBoard(b_num);
		if (result != 1) {
			return "redirect:readContent";
		}
	
		boolean flag = FileService.deleteFile(uploadPath + "/" + vo.getSavedFileName());
		
		logger.info("deleteBoard END");
		return "redirect:boardList";
	}*/
   
   @RequestMapping(value="delBoard", method=RequestMethod.POST)
   public boolean delBoard(int bnum, HttpSession session){
	   logger.info("delBoard START");
	   
	   boolean result = true;
	   int b_num = bnum;
	   Board board= dao.selectBoardOne(b_num);
	   
	   String id = (String)session.getAttribute("loginId");
	   
	   if (!(id.equals(board.getB_id()))) {
		    result = false;
			return result;
		}
	   
	   int delResult = dao.deleteBoard(b_num);
	   if (delResult != 1) {
		   result = false;
			return result;
	   }
	   
	   /*boolean flag = FileService.deleteFile(uploadPath + "/" + vo.getSavedFileName());*/
	   logger.info("delBoard END");
	   return result;
   }
   
}