package gw.commute;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuteController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/commute/comList.do")
	public String comList(HttpServletRequest request, CommuteVO comVo){
		String emp_code = request.getParameter("emp_code");
		String ip = (String)request.getRemoteAddr();
		int count = 0;
		
		Date currentDay = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String checkDay = sdf.format(currentDay);
		System.out.println("List"+checkDay);
		HashMap map = new HashMap();
		map.put("emp_code", emp_code);
		map.put("checkDay", checkDay);
		System.out.println("List"+map);
		count = (int) sqlMap.queryForObject("com.comSelectTodayCount", map);
		comVo = (CommuteVO) sqlMap.queryForObject("com.comSelectToday", map);
		System.out.println("List"+count);
		System.out.println("List"+comVo);
	
		request.setAttribute("emp_code", emp_code);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("comVo", comVo);
		request.setAttribute("ip", ip);
		
		return "/commute/comList";
	}
	
	@RequestMapping("/commute/comGo.do")
	public String comGo(HttpServletRequest request){
		String emp_code = request.getParameter("emp_code");
		System.out.println(emp_code);
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
			System.out.println(checkDay);
			System.out.println(emp_code);
			System.out.println(map);
			int checkCount = (Integer) sqlMap.queryForObject("com.comSelectTodayCount", map);
			System.out.println(checkCount);
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
		return "redirect:/commute/comList.do";
	}
	
	@RequestMapping("/commute/comOff.do")
	public String comOff(HttpServletRequest request){
		String com_code = request.getParameter("com_code");
		request.setAttribute("com_code", com_code);
		return "/commute/comOff";
	}
	
	@RequestMapping("/commute/comOffPro.do")
	public String leaveToWorkPro(HttpServletRequest request, CommuteVO comVo){
		String com_code = request.getParameter("com_code");
		String ip = (String)request.getRemoteAddr();
		
		comVo = (CommuteVO) sqlMap.queryForObject("com.comSelectTodayOff", com_code);
		
		comVo.setCom_code(com_code);
		if(comVo.getCom_ip().equals(ip)){
			comVo.setCom_status("퇴근");
		}else{
			comVo.setCom_status("외근");
		}
		
		sqlMap.update("com.comUpdateOff", comVo);
		
		return "redirect:/commute/comList.do";
	}
}
