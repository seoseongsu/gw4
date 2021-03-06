package gw.fund;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import gw.employee.EmployeeJoinVO;
import gw.employee.EmployeeVO;

@Controller
public class FundController{
	@Autowired SqlMapClientTemplate sqlMap;

	@RequestMapping("/fund/fundList.do")
	public String fundList(HttpServletRequest request, HttpSession session){
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeJoinVO empVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);
		List fundList = sqlMap.queryForList("fundList", emp_code);

		request.setAttribute("empVo", empVo);
		request.setAttribute("fundList", fundList);
		return "/fund/fundList";
	}
	
	@RequestMapping("/fund/fundAdd.do")
	public String fundAdd(HttpServletRequest request, HttpSession session){
		
		//String emp_code = request.getParameter("emp_code");
		String emp_code = (String)session.getAttribute("memId");
		EmployeeJoinVO employeeJoinVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);

		request.setAttribute("fundVo", employeeJoinVo);
		
		return "/fund/fundAdd";
	}
	
	@RequestMapping("/fund/fundAddPro.do")
	public String fundAddPro(HttpServletRequest request, HttpSession session, FundVO vo) throws Exception{
		
		//String emp_code = request.getParameter("emp_code");
		String emp_code = (String)session.getAttribute("memId");

		EmployeeJoinVO employeeJoinVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);

		vo.setEmp_code(employeeJoinVo.getEmp_code());
		vo.setDept_code(employeeJoinVo.getDept_code());
		vo.setPo_code(employeeJoinVo.getPo_code());

		sqlMap.insert("fundAddPro", vo);
		
		return "/fund/fundAddPro";
	}
	
	@RequestMapping("/fund/fundDeletePro.do")
	public String fundDeletePro(HttpServletRequest request,HttpSession session, FundVO vo){
		String fund_emp = request.getParameter("emp_code");
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeVO empVo = (EmployeeVO)sqlMap.queryForObject("fundMemberList", emp_code);
		if(emp_code == null || (emp_code != null && !emp_code.equals(fund_emp)))
		{
			return "/fund/fundNoAuth";
		}else{
			String fund_code = (String) request.getParameter("fund_code");
			sqlMap.delete("fundDeletePro", fund_code);
			return "/fund/fundDeletePro";
		}
	}
	
	@RequestMapping("/fund/fundUpdate.do")
	public String fundUpdate(HttpServletRequest request, HttpSession session){
		String fund_emp = request.getParameter("emp_code");
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeVO empVo = (EmployeeVO)sqlMap.queryForObject("fundMemberList", emp_code);
		if(emp_code == null || (emp_code != null && !emp_code.equals(fund_emp)))
		{
			return "/fund/fundNoAuth";
		}else{
			String fund_code = (String) request.getParameter("fund_code");
			FundJoinVO fundJoinVo = (FundJoinVO) sqlMap.queryForObject("fundSelectUpdate", fund_code);
			request.setAttribute("fundJoinVo", fundJoinVo);
		
		return "/fund/fundUpdate";
		}
	}
	
	@RequestMapping("/fund/fundUpdatePro.do")
	public String fundUpdatePro(HttpServletRequest request, FundVO vo) throws Exception{
		sqlMap.update("fundUpdate", vo);
		return "/fund/fundUpdatePro";
	}
	
	@RequestMapping("/fund/fundDays.do")
	public String fundDays(Model model, HttpServletRequest request){
		
		String fund_days = (String) request.getParameter("fund_days");
		String fund_day = (String) request.getParameter("fund_day");
		HashMap map = new HashMap();
	    map.put("fund_days", fund_days);
	    map.put("fund_day", fund_day);
		
		List fundDays = sqlMap.queryForList("fundSelectDays", map);
		model.addAttribute("fundDays", fundDays);

		return "/fund/fundDays";
	}
}
