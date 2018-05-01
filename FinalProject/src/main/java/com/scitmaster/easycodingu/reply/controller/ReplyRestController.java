package com.scitmaster.easycodingu.reply.controller;

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

import com.scitmaster.easycodingu.person.controller.PersonViewController;
import com.scitmaster.easycodingu.reply.dao.ReplyDAO;
import com.scitmaster.easycodingu.reply.vo.Reply;

@RestController
@RequestMapping(value="reply")
public class ReplyRestController {
   
   @Autowired
   ReplyDAO dao;
   
   private static final Logger logger = LoggerFactory.getLogger(ReplyRestController.class);
   
   @RequestMapping(value="writeReply", method=RequestMethod.POST)
	public void writeReply(@RequestBody Reply reply, HttpSession session){
		logger.info("writeReply START");

		String r_id = (String)session.getAttribute("loginId");
		reply.setR_id(r_id);
		System.out.println(reply);
		int result = dao.insertReply(reply);
		
		logger.info("writeReply END");
	}
   
   @RequestMapping(value="replyList", method=RequestMethod.GET)
	public ArrayList<Reply> replyList(int b_num){
		logger.info("replyList START");

		ArrayList<Reply> replyList = dao.selectReplyAll(b_num);
		
		logger.info("replyList END");
		return replyList;
	}
   
   
   // 리플삭제
   @RequestMapping(value="replyDelete", method=RequestMethod.POST)
   public boolean replyDelete(int r_num, HttpSession session){
      logger.info("replyDelete START!!!!!!");
      String loginId = (String)session.getAttribute("loginId");
      System.out.println("loginId : "+loginId);
      Reply reply = dao.selectReplyOne(r_num);
      String r_id = reply.getR_id();
      System.out.println("r_id : "+r_id);
      boolean result = false;
      if (loginId.equals(r_id)) {
         dao.deleteReply(r_num);
         result = true;
      }
      
      logger.info("replyDelete END");
      return result;
   }
   
}