package gw.bstatement;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import gw.employee.EmployeeJoinVO;
import gw.employee.EmployeeVO;

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
		EmployeeJoinVO empJoinVo = new EmployeeJoinVO();
		empJoinVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);
		BstatementInVO bsInVo = (BstatementInVO) sqlMap.queryForObject("bs.bsSelectIn", emp_code);
		bsApList = sqlMap.queryForList("bs.bsSelectAp", empJoinVo.getDept_code());
		
		request.setAttribute("empJoinVo", empJoinVo);
		request.setAttribute("bsApList", bsApList);
		return "/bs/bsInsert";
	}
	
	@RequestMapping("/bs/bsInsertPro.do")
	public String bsInsertPro(HttpServletRequest request){
		int count = Integer.parseInt(request.getParameter("count"));
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
		if(count > 0){
			for(int i=1; i<=count; i++){
				int bs_code = (int) sqlMap.queryForObject("bs.bsSelectCode", null);
				bbVo.setBs_code(Integer.toString(bs_code));
				bbVo.setBb_main(request.getParameter("bb_main"+i));
				bbVo.setBb_status(Integer.parseInt(request.getParameter("bb_status"+i)));
				bbVo.setBb_time(Integer.parseInt(request.getParameter("bb_time"+i)));
				bbVo.setBb_product(request.getParameter("bb_product"+i));
				sqlMap.insert("bs.bbInsert", bbVo);
			}
		}
		return "/bs/bsInsertPro";
	}
	
	@RequestMapping("/bs/bsUpdate.do")
	public String bsUpdate(HttpServletRequest request){
		String emp_code = (String) request.getParameter("emp_code");
		String bs_code = (String) request.getParameter("bs_code");
		List bsApList = null;
		EmployeeJoinVO empJoinVo = new EmployeeJoinVO();
		empJoinVo = (EmployeeJoinVO) sqlMap.queryForObject("emp.empSelect", emp_code);
		BstatementInVO bsInVo = (BstatementInVO) sqlMap.queryForObject("bs.bsSelectIn", emp_code);
		bsApList = sqlMap.queryForList("bs.bsSelectAp", empJoinVo.getDept_code());
		BstatementVO bsVo = (BstatementVO) sqlMap.queryForObject("bs.bsSelectUp", bs_code);
		
		//업무내역 행추가 삭제 카운트
		List bbList = null;
		int bbCount = 0;
		bbList = sqlMap.queryForList("bs.bbSelectBs", bs_code);
		bbCount = (int) sqlMap.queryForObject("bs.bbSelectCountBs", bs_code);
		
		request.setAttribute("bsVo", bsVo);
		request.setAttribute("empJoinVo", empJoinVo);
		request.setAttribute("bsApList", bsApList);
		request.setAttribute("bs_code", bs_code);
		
		request.setAttribute("bbList", bbList);
		request.setAttribute("bbCount", bbCount);
		return "/bs/bsUpdate";
	}
	
	@RequestMapping("/bs/bsUpdatePro.do")
	public String bsUpdatePro(HttpServletRequest request){
		int count = Integer.parseInt(request.getParameter("count"));
		String bs_code = request.getParameter("bs_code");
		List bb_codeList = null;
		BstatementVO bsVo = new BstatementVO();
		BbreakdownVO bbVo = new BbreakdownVO();

		bsVo.setBs_code(request.getParameter("bs_code"));
		bsVo.setEmp_code(request.getParameter("emp_code"));
		bsVo.setDept_code(request.getParameter("dept_code"));
		bsVo.setPo_code(request.getParameter("po_code"));
		bsVo.setBs_st(request.getParameter("bs_st"));
		bsVo.setBs_goal(request.getParameter("bs_goal"));
		bsVo.setBs_year(request.getParameter("bs_year"));
		bsVo.setBs_ap(request.getParameter("bs_ap"));
		
		sqlMap.update("bs.bsUpdate", bsVo);
		bb_codeList = sqlMap.queryForList("bs.bbSelectUp", bs_code);
		//업무내역 삭제
		for(int i=0; i<bb_codeList.size(); i++){
			bbVo = (BbreakdownVO)bb_codeList.get(i);
			sqlMap.delete("bs.bbDelete", bbVo.getBb_code());
		}
		//업무내역 추가
		if(count > 0){
			for(int i=1; i<=count; i++){
				bbVo.setBs_code(bs_code);
				bbVo.setBb_main(request.getParameter("bb_main"+i));
				bbVo.setBb_status(Integer.parseInt(request.getParameter("bb_status"+i)));
				bbVo.setBb_time(Integer.parseInt(request.getParameter("bb_time"+i)));
				bbVo.setBb_product(request.getParameter("bb_product"+i));
				sqlMap.insert("bs.bbInsert", bbVo);
			}
		}
		return "/bs/bsUpdatePro";
	}
	
	@RequestMapping("/bs/bsDeletePro.do")
	public String bsDeletePro(HttpServletRequest request){
		String bs_code = request.getParameter("bs_code");
		List bb_codeList = null;
		
		BbreakdownVO bbVo = new BbreakdownVO();

		bb_codeList = sqlMap.queryForList("bs.bbSelectUp", bs_code);
		//업무내역 삭제
		for(int i=0; i<bb_codeList.size(); i++){
			bbVo = (BbreakdownVO)bb_codeList.get(i);
			sqlMap.delete("bs.bbDelete", bbVo.getBb_code());
		}
		
		sqlMap.delete("bs.bsDelete",bs_code);
		return "/bs/bsDeletePro";
	}
}
