package com.scitmaster.easycodingu.reply.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.scitmaster.easycodingu.person.controller.PersonViewController;
import com.scitmaster.easycodingu.reply.dao.ReplyDAO;

@RestController
@RequestMapping(value="reply")
public class ReplyRestController {
   
   @Autowired
   ReplyDAO dao;
   
   private static final Logger logger = LoggerFactory.getLogger(ReplyViewController.class);
   
   
   
}