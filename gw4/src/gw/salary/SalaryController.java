package gw.salary;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalaryController {
@Autowired SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/salary/salaryList.do")
	public String salaryList(HttpServletRequest request){
		List salaryList = null;
		
		salaryList = sqlMap.queryForList("salarySelectList", null);
		request.setAttribute("salaryList", salaryList);
		return "/salary/salaryList";
	}
	
	@RequestMapping("/salary/salaryAdd.do")
	public String salaryAdd(HttpServletRequest request){
		List deptList = null;
		List poList = null;
		List empList = null;
		
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);
		empList = sqlMap.queryForList("empSelectAll", null);
		
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		request.setAttribute("empList", empList);
		
		return "/salary/salaryAdd";
	}
	
	@RequestMapping("/salary/salaryAddPro.do")
	public String salaryAddPro(HttpServletRequest request, SalaryVO vo) throws Exception{
		
		String salary_normal = request.getParameter("salary_normal");
		
		sqlMap.insert("salaryAddPro",  vo);
		
		return "/salary/salaryAddPro";
	}
	
	@RequestMapping("/salary/salaryDeletePro.do")
	public String salaryDeletePro(HttpServletRequest request, SalaryVO vo){
		String salary_code = (String) request.getParameter("salary_code");
		sqlMap.delete("salaryDeletePro", salary_code);
		return "/salary/salaryDeletePro";
	}
	
	@RequestMapping("/salary/salaryUpdate.do")
	public String salaryUpdate(HttpServletRequest request){
		List deptList = null;
		List poList = null;
		List empList = null;
		
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);
		empList = sqlMap.queryForList("empSelectAll", null);
		
		String salary_code = (String) request.getParameter("salary_code");
		
		SalaryJoinVO salaryJoinVo = (SalaryJoinVO) sqlMap.queryForObject("salarySelectUpdate", salary_code);
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		request.setAttribute("empList", empList);
		request.setAttribute("salaryJoinVo", salaryJoinVo);
		
		return "/salary/salaryUpdate";
	}
	
	@RequestMapping("salary/salaryUpdatePro.do")
	public String salaryUpdatePro(HttpServletRequest request, SalaryJoinVO vo) throws Exception{
		sqlMap.update("salaryUpdate", vo);
		return "/salary/salaryUpdatePro";
	}
	
	@RequestMapping("salary/salaryDays.do")
	public String salaryDays(Model model, HttpServletRequest request){
		
		String salary_days = (String) request.getParameter("salary_days");
		String salary_day = (String) request.getParameter("salary_day");
		
		HashMap map = new HashMap();
		map.put("salary_days", salary_days);
		map.put("salary_day", salary_day);
		
		List salaryDays = sqlMap.queryForList("salaryDays", map);
		model.addAttribute("salaryDays", salaryDays);
		
		return "/salary/salaryDays";
	}
}
