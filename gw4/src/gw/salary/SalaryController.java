package gw.salary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalaryController {
	@Autowired SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/salary/salaryList.do")
	public String salaryList(){
		
		return "/salary/salaryList";
	}
}
