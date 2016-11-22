package gw.bstatement;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BstatementController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/bs/bsList.do")
	public String bsList(HttpServletRequest request){
		
		return "/bs/bsList";
	}
}
