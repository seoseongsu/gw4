package gw.department;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DepartmentController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/dept/deptList.do")
	public String deptList(HttpServletRequest request){
		List treeListD = null;
		List treeListT = null;
		treeListD = sqlMap.queryForList("dept.deptSelectTreeD", null);
		treeListT = sqlMap.queryForList("dept.deptSelectTreeT", null);
		request.setAttribute("treeListD", treeListD);
		request.setAttribute("treeListT", treeListT);
		return "/dept/deptList";
	}
}
