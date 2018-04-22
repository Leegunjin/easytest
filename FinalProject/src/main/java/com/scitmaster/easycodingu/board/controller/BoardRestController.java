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
import com.scitmaster.easycodingu.reply.vo.Reply;

@RestController
@RequestMapping(value="board")
public class BoardRestController {
   
   @Autowired
   BoardDAO dao;
   
   private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
   
}