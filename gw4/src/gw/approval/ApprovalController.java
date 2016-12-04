package gw.approval;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import gw.employee.EmployeeJoinVO;

@Controller
public class ApprovalController {
	@Autowired SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/approval/approvalGuide.do")
	public String approvalGuide(){
		
		return "/approval/approvalGuide";
	}
	
	@RequestMapping("/approval/approvalDining.do")
	public String approvalDining(HttpServletRequest request, HttpSession session){
		
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeJoinVO employeeJoinVo = (EmployeeJoinVO) sqlMap.queryForObject("approvalSelect", emp_code);
		List empList = sqlMap.queryForList("approvalSelectAll", null);
		
		request.setAttribute("empList", empList);
		request.setAttribute("employeeJoinVo", employeeJoinVo);
		return "/approval/approvalDining";
	}
	
	@RequestMapping("/approval/approvalDiningPro.do")
	public String approvalDiningPro(HttpServletRequest request, HttpSession session, ApprovalVO vo)throws Exception{
		
		//String emp_code = request.getParameter("emp_code");
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeJoinVO employeeJoinVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);

		vo.setEmp_code(employeeJoinVo.getEmp_code());
		vo.setDept_code(employeeJoinVo.getDept_code());
		vo.setPo_code(employeeJoinVo.getPo_code());
		
		sqlMap.insert("approvalDiningPro", vo);
		
		return "/approval/approvalDiningPro";
	}
	
	@RequestMapping("/approval/approvalDiningContent.do")
	public String approvalDiningContent(HttpServletRequest request){
		String approval_code = request.getParameter("approval_code");
		
		ApprovalJoinVO approvalJoinVo = (ApprovalJoinVO) sqlMap.queryForObject("approvalSelectDining", approval_code);
		request.setAttribute("approvalJoinVo", approvalJoinVo);
		
		return "/approval/approvalDiningContent";
	}
	
	@RequestMapping("/approval/approvalSend.do")
	public String approvalSend(HttpServletRequest request, HttpSession session){
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeJoinVO empVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);
		List approvalList = sqlMap.queryForList("approvalList", emp_code);
		
		request.setAttribute("empVo", empVo);
		request.setAttribute("approvalList", approvalList);
		
		return "/approval/approvalSend";
	}
	
	@RequestMapping("/approval/approvalUp.do")
	public String approvalUp(HttpServletRequest request, HttpSession session){
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeJoinVO empVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);
		List approvalList = sqlMap.queryForList("approvalList", null);
		
		request.setAttribute("empVo", empVo);
		request.setAttribute("approvalList", approvalList);
		
		return "/approval/approvalUp";
	}
	
	@RequestMapping("/approval/approvalDelete.do")
	public String approvalDelete(HttpServletRequest request, ApprovalVO vo){
		String approval_code = (String) request.getParameter("approval_code");
		sqlMap.delete("approvalDelete", approval_code);
		return "/approval/approvalDelete";
	}
	
	
}