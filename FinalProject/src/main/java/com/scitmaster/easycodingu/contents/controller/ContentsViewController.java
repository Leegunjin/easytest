package com.scitmaster.easycodingu.contents.controller;

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

import com.scitmaster.easycodingu.contents.dao.ContentsDAO;
import com.scitmaster.easycodingu.person.dao.PersonDAO;
import com.scitmaster.easycodingu.person.vo.Person;

@Controller
@RequestMapping(value="contents")
public class ContentsViewController {

   @Autowired
   ContentsDAO dao;
   
   private static final Logger logger = LoggerFactory.getLogger(ContentsViewController.class);
   
}