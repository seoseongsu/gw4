package gw.main;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import gw.employee.EmployeeVO;
@Controller
public class MainController{
	@Autowired
	SqlMapClientTemplate sqlMap;
	public static ArrayList accessUserCount = new ArrayList();
	
	@RequestMapping("/main/main.do")
	public String main(){	 

		return"/main/main";
	}
	
	@RequestMapping("/main/login.do")
	public String login(){
		
		return "/main/login";
	}
	
	@RequestMapping("/main/loginPro.do")
	public String loginPro(){
		
		return "/main/loginPro";
	}
	
	@RequestMapping("/main/logout.do")
	public String logout(){
		return "/main/logout";
	}
	@RequestMapping("/error/error.do")
	public String error(){
		return "/error/error";
	}
}

