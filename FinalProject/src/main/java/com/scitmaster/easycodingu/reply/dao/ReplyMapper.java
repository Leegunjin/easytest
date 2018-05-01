package com.scitmaster.easycodingu.reply.dao;

import java.util.ArrayList;

import com.scitmaster.easycodingu.person.vo.Person;
import com.scitmaster.easycodingu.reply.vo.Reply;

public interface ReplyMapper {

	//댓글 등록
	public int insertReply(Reply reply);
	
	//댓글 전체 select
	public ArrayList<Reply> selectReplyAll(int b_num);
   
	//댓글 삭제 delete
	public int deleteReply(int r_num);
	
	// 게시글 삭제
	public Reply selectReplyOne (int r_num);
	
}