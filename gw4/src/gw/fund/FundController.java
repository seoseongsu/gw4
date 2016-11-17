package gw.fund;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundController {
	@Autowired SqlMapClientTemplate sqlMap;

	@RequestMapping("/fund/fundList.do")
	public String fundList(HttpServletRequest request)throws Exception{

		List fundList = sqlMap.queryForList("FundList", null);
	
		request.setAttribute("fundList", fundList);
		return "/fund/fundList";
	}
	
	@RequestMapping("/fund/fundAdd.do")
	public String fundAdd(){
		return "/fund/fundAdd";
	}
}
