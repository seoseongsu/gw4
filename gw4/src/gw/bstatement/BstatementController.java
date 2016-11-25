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
		List bsList = null;
		count = (Integer)sqlMap.queryForObject("bs.bsSelectCount", null);
		if (count > 0) {
			bsList = sqlMap.queryForList("bs.bsSelectList", null);
        } else {
        	bsList = Collections.EMPTY_LIST;
        }
		request.setAttribute("count", new Integer(count));
		request.setAttribute("bsList", bsList);
		return "/bs/bsList";
	}
	
	@RequestMapping("/bs/bsInsert.do")
	public String bsInsert(HttpServletRequest request){
		String emp_code = (String) request.getParameter("emp_code");
		List bsApList = null;
		BstatementInVO bsInVo = (BstatementInVO) sqlMap.queryForObject("bs.bsSelectIn", emp_code);
		bsApList = sqlMap.queryForList("bs.bsSelectAp", bsInVo.getDept_code());
		
		request.setAttribute("bsInVo", bsInVo);
		request.setAttribute("bsApList", bsApList);
		return "/bs/bsInsert";
	}
	
	@RequestMapping("/bs/bsInsertPro.do")
	public String bsInsertPro(HttpServletRequest request){
		int count = Integer.parseInt(request.getParameter("count"));
		System.out.println("emp_code="+request.getParameter("emp_code"));
		System.out.println("dept_code="+request.getParameter("dept_code"));
		System.out.println("po_code="+request.getParameter("po_code"));
		System.out.println("bs_year="+request.getParameter("bs_year"));
		System.out.println("bs_ap="+request.getParameter("bs_ap"));
		System.out.println("bs_st="+request.getParameter("bs_st"));
		System.out.println("bs_goal="+request.getParameter("bs_goal"));
		System.out.println("count="+count);
		BstatementVO bsVo = new BstatementVO();
		BbreakdownVO bbVo = new BbreakdownVO();
		
		bsVo.setEmp_code(request.getParameter("emp_code"));
		bsVo.setDept_code(request.getParameter("dept_code"));
		bsVo.setPo_code(request.getParameter("po_code"));
		bsVo.setBs_st(request.getParameter("bs_st"));
		bsVo.setBs_goal(request.getParameter("bs_goal"));
		bsVo.setBs_year(request.getParameter("bs_year"));
		bsVo.setBs_ap(request.getParameter("bs_ap"));
		sqlMap.insert("bs.bsInsert", bsVo);
//		if(count > 0){
			for(int i=1; i<=count; i++){
				System.out.println("bb_main="+request.getParameter("bb_main"+i));
				System.out.println("bb_status="+request.getParameter("bb_status"+i));
				System.out.println("bb_time="+request.getParameter("bb_time"+i));
				System.out.println("bb_product="+request.getParameter("bb_product"+i));
				int bs_code = (int) sqlMap.queryForObject("bs.bsSelectCode", null);
				bbVo.setBs_code(Integer.toString(bs_code));
				bbVo.setBb_main(request.getParameter("bb_main"+i));
				bbVo.setBb_status(Integer.parseInt(request.getParameter("bb_status"+i)));
				bbVo.setBb_time(Integer.parseInt(request.getParameter("bb_time"+i)));
				bbVo.setBb_product(request.getParameter("bb_product"+i));
				sqlMap.insert("bs.bbInsert", bbVo);
			}
//		}
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
