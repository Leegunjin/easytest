package com.scitmaster.easycodingu.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scitmaster.easycodingu.board.dao.BoardDAO;
import com.scitmaster.easycodingu.board.vo.Board;
import com.scitmaster.easycodingu.common.util.FileService;
import com.scitmaster.easycodingu.common.util.PageNavigator;

@Controller
@RequestMapping(value="board")
public class BoardViewController {

   @Autowired
   BoardDAO dao;
   
   final String uploadPath = "/boardfile";	
	
   final int countPerPage = 10;
   final int pagePerGroup = 10;
   
    private static final Logger logger = LoggerFactory.getLogger(BoardViewController.class);
   
    @RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(Model model
			,@RequestParam(value="searchText", defaultValue="")String searchText
			,@RequestParam(value="searchSelect", defaultValue="b_title") String searchSelect
			,@RequestParam(value="page", defaultValue="1")int page){
		logger.info("boardList START");
		System.out.println("searchText : " + searchText);
		System.out.println("searchSelect : " + searchSelect);
		HashMap<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchSelect", searchSelect);
		searchMap.put("searchText", searchText);
		
		int total = dao.getTotal(searchMap);
		System.out.println("total : " + total);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		ArrayList<Board> list = null;
		/*list = dao.selectBoardAll(searchMap, navi.getStartRecord(),navi.getCountPerPage());*/
		list = dao.selectBoardAll(searchMap, navi.getStartRecord(), navi.getCountPerPage());
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);	
		model.addAttribute("searchSelect", searchSelect);
		System.out.println("list"+list);
		logger.info("boardList END");
		return "board/board";
	}
   
   @RequestMapping(value="writeForm", method=RequestMethod.GET)
   public String writeForm(){
	   logger.info("writeForm START");
		
	   logger.info("writeForm END");
	   return "board/writeForm";
   }
   
   @RequestMapping(value="write", method=RequestMethod.POST)
   public String wirte(Board board, HttpSession session, MultipartFile upload/*, String b_title, String b_contents, String hashArr*/){
	   logger.info("write START");
	   System.out.println("board : " + board );
	   String b_id = (String)session.getAttribute("loginId");
	   /*String hashTag = hashArr;
	   
	   board.setB_id(b_id);
	   board.setB_title(b_title);
	   board.setB_contents(b_contents);
	   board.setHashTag(hashTag);*/
	   
	   System.out.println("upload : " + upload);
	   System.out.println("board : "+board);
	   
	    /*if (!upload.isEmpty()) {
	    	System.out.println("upload2 : "  + upload);
	    	String savedFileName = FileService.saveFile(upload, uploadPath);
			//board.setSavedfile(savedfilename);
			board.setSavedFileName(savedFileName);
			//board.setOriginalfile(upload.getOriginalFilename());
			board.setOriginalFileName(upload.getOriginalFilename());
		}*/
	    System.out.println("dao.insertBoard pre");
		int result = dao.insertBoard(board);
		if (result != 1) {
			return "board/writeForm";
		}
		logger.info("write END");
		return "redirect:boardList";
	}
   
   @RequestMapping(value="readContent", method=RequestMethod.GET)
	public String readContent(int b_num, Model model){
		logger.info("readContent START");
			
		Board board = dao.selectBoardOne(b_num);
		model.addAttribute("board", board);
		logger.info("readContent END");
		return "board/read";
	}
   
   @RequestMapping(value="deleteBoard", method=RequestMethod.GET)
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
	}
   
   @RequestMapping(value="updateForm", method=RequestMethod.GET)
	public String updateForm(int b_num, Model model, HttpSession session){
		logger.info("updateForm START");
		String id = (String)session.getAttribute("loginId");
		Board board = dao.selectBoardOne(b_num);
		
		if (!(id.equals(board.getB_id()))) {
			return "redirect:boardList";
		}
		System.out.println(board);
		model.addAttribute("board", board);
		
		logger.info("updateForm END");
		return "board/updateForm";
	}
   
   @RequestMapping(value="update", method=RequestMethod.POST)
	public String update(Board board, Model model, HttpSession session){
		logger.info("update START");
		String b_id = (String)session.getAttribute("loginId");
		board.setB_id(b_id);;
		
		System.out.println(board);
	
		int result = dao.updateBoard(board);
		if (result != 1) {
			return "board/updateForm";
		}
		
		model.addAttribute("b_num", board.getB_num());
		logger.info("update END");
		return "redirect:readContent";
	}
}