package com.smk.quotebook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smk.quotebook.dao.AdminDao;
import com.smk.quotebook.model.Admin;
import com.smk.quotebook.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="adminChk")
	public String adminLoginChk(Admin admin, Model model) {
		int result= adminService.adminloginChk(admin);
		model.addAttribute("result", result);		
		return "admin/loginChk";
	}
	
	@RequestMapping(value="adminLogin",method=RequestMethod.POST)
	public String adminLogin(Admin admin, HttpSession session) {
		Admin loginAdmin = adminService.getAdmin(admin.getAid());
		//System.out.println("loginAdmin: "+loginAdmin);	
		session.setAttribute("aid", loginAdmin.getAid());
		session.setAttribute("apw", loginAdmin.getApw());
		session.setAttribute("aname", loginAdmin.getAname());
		return "admin/main_admin";
	}
	
	@RequestMapping(value="adminMain")
	public String adminMain() {		
		return "admin/main_admin";
	}
	
	@RequestMapping(value="adminLogout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping(value="faqView")
	public String faqView() {
		return "help/faq";
	}
	
	@RequestMapping(value="tellus")
	public String tellusView() {
		return "help/tellus";
	}
}
