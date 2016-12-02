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
		return"/main/main";
	}
	
	@RequestMapping("/main/login.do")
	public String login(){
		
		return "/main/login";
	}
	
	@RequestMapping("/main/loginPro.do")
	public String loginPro(HttpServletRequest request, HttpSession session, EmployeeVO dto){
		String emp_code = request.getParameter("emp_code");
		String emp_passwd =request.getParameter("emp_passwd");
		ServletContext application = request.getServletContext();
		HashMap userInfo = new HashMap();
		HashMap map = new HashMap();
		map.put("emp_code", emp_code);
        map.put("emp_passwd", emp_passwd);
        int check = 0;
        	check = (Integer)sqlMap.queryForObject("userCheck", map);
        	if(check == 1){
        		session.setAttribute("memId", emp_code);
        		application.setAttribute("appId", emp_code);
        		String id = (String)application.getAttribute("appId");
        		
        		//dto = (EmployeeVO)sqlMap.queryForObject("getMemberlist", id);
        		
        		String name = (String)sqlMap.queryForObject("nameCheck", dto.getEmp_code());
        		session.setAttribute("emp_name", name);
        		
        		userInfo.put("sessions", session.getId());
        		userInfo.put("mapId", dto.getEmp_code());
        		userInfo.put("mapName", dto.getEmp_name());
        		userInfo.put("accessTime", System.currentTimeMillis());
        		
        		accessUserCount.add(userInfo);
        		
        		application.setAttribute("userlist", accessUserCount);
        		request.setAttribute("check", new Integer(check));
        		
        		return "/main/loginPro";
        	}else{
        		request.setAttribute("check", new Integer(check));
        		return "/main/loginPro";
		}
/*		String emp_code = request.getParameter("emp_code");
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
*/
	}
	
	@RequestMapping("/main/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("memId");
		return "/main/logout";
	}
}

