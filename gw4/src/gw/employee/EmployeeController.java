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
		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getParameter("emp_name"));
		System.out.println(vo.getEmp_code());
		System.out.println(vo.getDept_code());
		System.out.println(vo.getPo_code());
		System.out.println(vo.getEmp_passwd());
		System.out.println(vo.getEmp_name());
		System.out.println(vo.getEmp_jumin());
		System.out.println(vo.getEmp_birth());
		System.out.println(vo.getEmp_phone());	
		System.out.println(vo.getEmp_email());
		System.out.println(vo.getEmp_acability());
		System.out.println(vo.getEmp_career());
		System.out.println(vo.getEmp_join());
		System.out.println(vo.getEmp_bank());
		System.out.println(vo.getEmp_acnum());
		sqlMap.insert("emp.empInsert", vo);
		return "/emp/empInsertPro";
	}
	
	@RequestMapping("/emp/empUpdate.do")
	public String empUpdate(HttpServletRequest request){
		String emp_code = (String) request.getParameter("emp_code");
		List deptList = null; 
		List poList = null; 
		
		System.out.println(emp_code);
		EmployeeVO empVo = (EmployeeVO) sqlMap.queryForObject("emp.empSelectUp", emp_code);
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);

		request.setAttribute("empVo", empVo);
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		return "/emp/empUpdate";
	}
}
