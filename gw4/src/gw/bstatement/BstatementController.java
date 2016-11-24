package gw.bstatement;


import java.util.Collections;
import java.util.List;

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
		int count = 0;
		List articleList = null;
		count = (Integer)sqlMap.queryForObject("bs.bsSelectCount", null);
		if (count > 0) {
            articleList = sqlMap.queryForList("bs.bsSelectAll", null);
        } else {
            articleList = Collections.EMPTY_LIST;
        }
		request.setAttribute("count", new Integer(count));
		request.setAttribute("articleList", articleList);
		return "/bs/bsList";
	}
	
	@RequestMapping("/bs/bsInsert.do")
	public String bsInsert(HttpServletRequest request){
		String emp_code = request.getParameter("emp_code");
		BstatementInVO bsInVo = (BstatementInVO) sqlMap.queryForObject("bs.bsSelectIn", emp_code);
		System.out.println(emp_code);
	//	System.out.println(bsInVo.);
		
		request.setAttribute("bsInVo", bsInVo);
		return "/bs/bsInsert";
	}
	
	@RequestMapping("/bs/bsInsertPro.do")
	public String bsInsertPro(HttpServletRequest request){
		
		return "/bs/bsInsertPro";
	}
	
	@RequestMapping("/bs/bsUpdate.do")
	public String bsUpdate(HttpServletRequest request){
		
		return "/bs/bsUpdate";
	}
	
	@RequestMapping("/bs/bsUpdatePro.do")
	public String bsUpdatePro(HttpServletRequest request){
		
		return "/bs/bsUpdatePro";
	}
	
	@RequestMapping("/bs/bsDeletePro.do")
	public String bsDeletePro(HttpServletRequest request){
		
		return "/bs/bsDeletePro";
	}
}
