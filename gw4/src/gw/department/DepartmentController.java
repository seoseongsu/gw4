package gw.department;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import gw.employee.EmployeeVO;

@Controller
public class DepartmentController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/dept/deptList.do")
	public String deptList(HttpServletRequest request){
		List treeList = null;
		List treeListD = null;
		List treeListT = null;
		treeList = sqlMap.queryForList("dept.deptSelectAll", null);
		treeListD = sqlMap.queryForList("dept.deptSelectTreeD", null);
		treeListT = sqlMap.queryForList("dept.deptSelectTreeT", null);
		request.setAttribute("treeList", treeList);
		request.setAttribute("treeListD", treeListD);
		request.setAttribute("treeListT", treeListT);
		return "/dept/deptList";
	}
	
	@RequestMapping("/dept/deptInsert.do")
	public String deptInsert(HttpServletRequest request){
		
		return "/dept/deptInsert";
	}
	
	@RequestMapping("/dept/deptInsertPro.do")
	public String deptInsertPro(HttpServletRequest request, DepartmentVO vo){
		sqlMap.insert("dept.deptInsert", vo);
		return "/dept/deptInsertPro";
	}
}
