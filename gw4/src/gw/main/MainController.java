package gw.main;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gw.employee.EmployeeVO;
@Controller
public class MainController{
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/main/main.do")
	public String main(HttpServletRequest request, HttpSession session){
		return"/main/main";
	}
	
	@RequestMapping("/main/login.do")
	public String login(){
		
		return "/main/login";
	}
	
	@RequestMapping("/main/loginPro.do")
	public String loginPro(HttpServletRequest request, HttpSession session){
		String emp_code = request.getParameter("emp_code");
		String emp_passwd =request.getParameter("emp_passwd");
		HashMap map = new HashMap();
        map.put("emp_code", emp_code);
        map.put("emp_passwd", emp_passwd);
		int check = 0;
			check = (Integer)sqlMap.queryForObject("userCheck", map);
			if(check == 1){
				session.setAttribute("memId", emp_code);
			}else{}
		request.setAttribute("emp_code", emp_code);
		request.setAttribute("emp_passwd", emp_passwd);
		request.setAttribute("check", check);

		return "/main/loginPro";
	}
	
	@RequestMapping("/main/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("memId");
		return "/main/logout";
	}
}

