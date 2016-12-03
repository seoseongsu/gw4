package gw.employee;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		List deptList = null; 
		List poList = null; 
		
		count = (Integer)sqlMap.queryForObject("emp.empSelectCount", null);
		if (count > 0) {
            articleList = sqlMap.queryForList("emp.empSelectList", null);
        } else {
            articleList = Collections.EMPTY_LIST;
        }
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);
		
		request.setAttribute("count", new Integer(count));
		request.setAttribute("articleList", articleList);
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		return "/emp/empList";
	}
	
	@RequestMapping("/emp/empListSh.do")
	public String empListSh(HttpServletRequest request){
		int count = 0;
		List articleList = null;
		List deptList = null; 
		List poList = null; 
		String dept_code = request.getParameter("dept_code");
		String po_code = request.getParameter("po_code");
		if(dept_code.equals("d") && po_code.equals("p")){
			count = (Integer)sqlMap.queryForObject("emp.empSelectCount", null);
			System.out.println(count);
			if (count > 0) {
	            articleList = sqlMap.queryForList("emp.empSelectList", null);
	        } else {
	            articleList = Collections.EMPTY_LIST;
	        }
		}else if(dept_code.equals("d")){
			count = (Integer)sqlMap.queryForObject("emp.empShCountP", po_code);
			if (count > 0) {
	            articleList = sqlMap.queryForList("emp.empListShP", po_code);
	        } else {
	            articleList = Collections.EMPTY_LIST;
	        }
		}else if(po_code.equals("p")){
			count = (Integer)sqlMap.queryForObject("emp.empShCountD", dept_code);
			if (count > 0) {
	            articleList = sqlMap.queryForList("emp.empListShD", dept_code);
	        } else {
	            articleList = Collections.EMPTY_LIST;
	        }
		}else if(!(dept_code.equals("d") && po_code.equals("p"))){
			HashMap map = new HashMap();
			map.put("dept_code", dept_code);
			map.put("po_code", po_code);
			
			count = (Integer)sqlMap.queryForObject("emp.empShCount", map);
			if (count > 0) {
	            articleList = sqlMap.queryForList("emp.empListSh", map);
	        } else {
	            articleList = Collections.EMPTY_LIST;
	        }
		}
		
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);
		
		request.setAttribute("count", new Integer(count));
		request.setAttribute("articleList", articleList);
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		request.setAttribute("dept_code", dept_code);
		request.setAttribute("po_code", po_code);
		
		return "/emp/empListSh";
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
	public String empDeletePro(HttpServletRequest request){
		String emp_code = (String) request.getParameter("emp_code");
		sqlMap.delete("emp.empDelete", emp_code);
		return "/emp/empDeletePro";
	}
	
	
	//개인 사원 정보
	@RequestMapping("/my/myView.do")
	public String myView(HttpServletRequest request, HttpSession session){
		String emp_code = (String)session.getAttribute("memId");
		
		EmployeeJoinVO empVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);

		request.setAttribute("empVo", empVo);
		return "/my/myView";
	}
	
	@RequestMapping("/my/myUpdate.do")
	public String myUpdate(HttpServletRequest request, HttpSession session){
		String emp_code = (String)session.getAttribute("memId");
		List deptList = null; 
		List poList = null; 
		
		EmployeeVO empVo = (EmployeeVO) sqlMap.queryForObject("emp.empSelectUp", emp_code);
		EmployeeJoinVO empJoinVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);
		
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);

		
		request.setAttribute("empVo", empVo);
		request.setAttribute("empJoinVo", empJoinVo);
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		return "/my/myUpdate";
	}
	
	@RequestMapping("/my/myUpdatePro.do")
	public String myUpdatePro(HttpServletRequest request, EmployeeVO vo){
		sqlMap.update("emp.empUpdate", vo);
		return "/my/myUpdatePro";
	}
}
