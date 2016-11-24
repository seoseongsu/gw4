package gw.salary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
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
		
		deptList = sqlMap.queryForList("dept.deptSelectAll", null);
		poList = sqlMap.queryForList("po.poSelectAll", null);
		
		request.setAttribute("deptList", deptList);
		request.setAttribute("poList", poList);
		
		return "/salary/salaryAdd";
	}
}
	