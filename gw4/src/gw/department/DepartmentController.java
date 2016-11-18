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
		List treeList = null;
		treeList = sqlMap.queryForList("dept.deptSelectTree", null);
		request.setAttribute("treeList", treeList);
		return "/dept/deptList";
	}
}
