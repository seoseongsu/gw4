package gw.position;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PositionController {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/po/poInsert.do")
	public String poInsert(HttpServletRequest request){
		return "/po/poInert";
	}
}
