package gw.commute;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import gw.employee.EmployeeVO;

@Controller
public class CommuteController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/commute/comDay.do")
	public String comDay(HttpServletRequest request, HttpSession session, CommuteVO comVo){
//		String emp_code = (String)session.getAttribute("memId");
		String emp_code = request.getParameter("emp_code");
		String ip = (String)request.getRemoteAddr();
		int count = 0;
		EmployeeVO empVo = new EmployeeVO();
		
		Date currentDay = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String checkDay = sdf.format(currentDay);

		HashMap map = new HashMap();
		map.put("emp_code", emp_code);
		map.put("checkDay", checkDay);
		
		empVo = (EmployeeVO) sqlMap.queryForObject("emp.empSelectUp", emp_code);
		count = (int) sqlMap.queryForObject("com.comSelectTodayCount", map);
		comVo = (CommuteVO) sqlMap.queryForObject("com.comSelectToday", map);
	
		request.setAttribute("empVo", empVo);
		request.setAttribute("emp_code", emp_code);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("comVo", comVo);
		request.setAttribute("ip", ip);
		
		return "/commute/comDay";
	}
	
	@RequestMapping("/commute/comGo.do")
	public String comGo(HttpServletRequest request){
		String emp_code = request.getParameter("emp_code");
//		System.out.println("comGo"+emp_code);
		request.setAttribute("emp_code", emp_code);
		return "/commute/comGo";
	}
	
	@RequestMapping("/commute/comGoPro.do")
	public String comGoPro(HttpServletRequest request, CommuteVO comVo, HttpSession session, HttpServletResponse response){
		try{
			String emp_code = request.getParameter("emp_code");
			String ip = (String)request.getRemoteAddr();
			
			Date currentDay = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String checkDay = sdf.format(currentDay);
	
			HashMap map = new HashMap();
			map.put("emp_code", emp_code);
			map.put("checkDay", checkDay);
//			System.out.println("comGoPro"+checkDay);
//			System.out.println("comGoPro"+emp_code);
//			System.out.println("comGoPro"+map);
			int checkCount = (Integer) sqlMap.queryForObject("com.comSelectTodayCount", map);
			System.out.println(checkCount);
			request.setAttribute("emp_code", emp_code);
			if(checkCount == 0){
				comVo.setEmp_code(emp_code);
				comVo.setCom_status("출근");
				comVo.setCom_ip(ip);
				sqlMap.insert("com.comInsertGo", comVo);
			}else{
			    return "/commute/comGoPro";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/commute/comDay.do";
	}
	
	@RequestMapping("/commute/comOff.do")
	public String comOff(HttpServletRequest request){
		String emp_code = request.getParameter("emp_code");
		request.setAttribute("emp_code", emp_code);
		return "/commute/comOff";
	}
	
	@RequestMapping("/commute/comOffPro.do")
	public String leaveToWorkPro(HttpServletRequest request, CommuteVO comVo){
		String emp_code = request.getParameter("emp_code");
		String ip = (String)request.getRemoteAddr();
		
		String com_code = (String) sqlMap.queryForObject("com.comSelectTodayOffCode", emp_code);
		comVo = (CommuteVO) sqlMap.queryForObject("com.comSelectTodayOff", com_code);
		
		comVo.setCom_code(com_code);
		if(comVo.getCom_ip().equals(ip)){
			comVo.setCom_status("퇴근");
		}else{
			comVo.setCom_status("외근");
		}
		
		sqlMap.update("com.comUpdateOff", comVo);
		
		return "redirect:/commute/comDay.do";
	}
	
	@RequestMapping("/commute/comSearch.do")
	public String comSearch(HttpServletRequest request, CommuteVO comVo){
		String emp_code = request.getParameter("emp_code");
		String checkDay = request.getParameter("searchDate");
		List comSearchVo = null;
		
		HashMap map = new HashMap();
		map.put("emp_code", emp_code);
		map.put("checkDay", checkDay);
		
		comSearchVo = sqlMap.queryForList("com.comSelectSearch", map);
		
		request.setAttribute("emp_code", emp_code);
		request.setAttribute("comSearchVo", comSearchVo);
		request.setAttribute("checkDay", checkDay);
		return "/commute/comSearch";
	}
	
	@RequestMapping("/commute/comList.do")
	private String comList(HttpServletRequest request) {
		List comSearchVo = null;
		List deptList = null;
		
		comSearchVo = sqlMap.queryForList("com.comList", null);
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		
		request.setAttribute("deptList", deptList);
		request.setAttribute("comSearchVo", comSearchVo);
		return "/commute/comList";
	}
	
	@RequestMapping("/commute/comListSearch.do")
	private String comListSearch(HttpServletRequest request) {
		String checkDay1 = request.getParameter("searchDate1");
		String checkDay2 = request.getParameter("searchDate2");
		String dept_code = request.getParameter("dept_code");
		List comSearchVo = null;
		List deptList = null;
		
		HashMap map = new HashMap();
		map.put("checkDay1", checkDay1);
		map.put("checkDay2", checkDay2);
		map.put("dept_code", dept_code);
		
		comSearchVo = sqlMap.queryForList("com.comListSearch", map);
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		
		request.setAttribute("checkDay1", checkDay1);
		request.setAttribute("checkDay2", checkDay2);
		request.setAttribute("dept_code", dept_code);
		request.setAttribute("comSearchVo", comSearchVo);
		request.setAttribute("deptList", deptList);
		return "/commute/comListSearch";
	}
}
