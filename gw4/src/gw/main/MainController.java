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
	public String main(HttpServletRequest request, HttpSession session){	 
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeVO dto = (EmployeeVO)sqlMap.queryForObject("empSelect", emp_code);
		request.setAttribute("empDto", dto);
		request.setAttribute("empCode", emp_code);
		return"/main/main.jsp";
	}
	
	@RequestMapping("/main/loginPro.do")
	public String loginPro(EmployeeVO dto, HttpSession session, HttpServletRequest request){
		ServletContext application = request.getServletContext();
		HashMap userInfo = new HashMap();
		int check = (Integer)sqlMap.queryForObject("userCheck", dto);
		String x = "";
		if(check == 1){
			session.setAttribute("memId", dto.getEmp_code());
			application.setAttribute("appId", dto.getEmp_code());
			String id = (String)application.getAttribute("appId");
			
			dto = (EmployeeVO)sqlMap.queryForObject("getEmpList",id);
			
			String ec = (String)sqlMap.queryForObject("codeCheck", dto.getEmp_code());
			session.setAttribute("empCode", ec);
			String name = (String)sqlMap.queryForObject("selectNm", dto.getEmp_name());
			session.setAttribute("empName", name);
			
			userInfo.put(session, session.getId());
			userInfo.put("empcode", dto.getEmp_code());
			userInfo.put("empName", dto.getEmp_name());
			
			accessUserCount.add(userInfo);
			
			application.setAttribute("userlist", accessUserCount);
			
			x = "redirect:/main/main.nhn";
		}else{
			request.setAttribute("check", new Integer(check));
			x = "main/loginPro.jsp";
		}
		return x;
	}
	@RequestMapping("/main/logout.do")
	public String logout(){
		return "/main/logout.jsp";
	}
	@RequestMapping("/error/error.do")
	public String error(){
		return "/error/error.jsp";
	}
}

