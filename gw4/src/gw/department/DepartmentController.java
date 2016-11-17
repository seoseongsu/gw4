package gw.department;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DepartmentController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/dept/deptInsert.do")
	public String deptInsert(HttpServletRequest request){
		return "/dept/deptInsert";
	}
}
