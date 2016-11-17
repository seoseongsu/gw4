package gw.employee;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/emp/empList.do")
	public String empList(HttpServletRequest request){
		int count = 0;
		List articleList = null;
		count = (Integer)sqlMap.queryForObject("emp.empSelectCount", null);
		if (count > 0) {
            articleList = sqlMap.queryForList("emp.empSelectAll", null);
        } else {
            articleList = Collections.EMPTY_LIST;
        }
		request.setAttribute("count", new Integer(count));
		request.setAttribute("articleList", articleList);
		return "/emp/empList";
	}
	
	@RequestMapping("/emp/empInsert.do")
	public String empInsert(HttpServletRequest request){
		List deptList = null; 
		List poList = null; 
		
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);

		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		return "/emp/empInsert";
	}
	
	@RequestMapping("/emp/empInsertPro.do")
	public String empInsertPro(HttpServletRequest request, EmployeeVO vo) throws Exception{
		sqlMap.insert("emp.empInsert", vo);
		return "/emp/empInsertPro";
	}
	
	@RequestMapping("/emp/empUpdate.do")
	public String empUpdate(HttpServletRequest request){
		String emp_code = (String) request.getParameter("emp_code");
		List deptList = null; 
		List poList = null; 
		
		EmployeeVO empVo = (EmployeeVO) sqlMap.queryForObject("emp.empSelectUp", emp_code);
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);

		request.setAttribute("empVo", empVo);
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		return "/emp/empUpdate";
	}
	
	@RequestMapping("/emp/empUpdatePro.do")
	public String empUpdatePro(HttpServletRequest request, EmployeeVO vo){
		sqlMap.update("emp.empUpdate", vo);
		return "/emp/empUpdatePro";
	}
	
	@RequestMapping("/emp/empDeletePro.do")
	public String empDeletePro(HttpServletRequest request, EmployeeVO vo){
		String emp_code = (String) request.getParameter("emp_code");
		sqlMap.delete("emp.empDelete", emp_code);
		return "/emp/empDeletePro";
	}
}
