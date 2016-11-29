package gw.commute;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuteController {
	@Autowired
	SqlMapClientTemplate sqlMap;
	@RequestMapping("/commute/comList.do")
	public String comList(HttpServletRequest request){
		
		return "/commute/comList.do";
	}
}
