package gw.fund;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundController{
	@Autowired SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/fund/fundList.do")
	public String fundList(HttpServletRequest request)throws Exception{
		
		List fundList = sqlMap.queryForList("fundList", null);
		
		request.setAttribute("fundList", fundList);
		return "/fund/fundList";
	}
	
	@RequestMapping("/fund/fundAdd.do")
	public String fundAdd(HttpServletRequest request){
		
		List fundAdd = sqlMap.queryForList("fundAdd", null);
		
		request.setAttribute("fundAdd", fundAdd);
		
		return "/fund/fundAdd";
	}
	
	@RequestMapping("/fund/fundAddPro.do")
	public String fundAddPro(HttpServletRequest request, FundVO vo) throws Exception{
		sqlMap.insert("fundAddPro", vo);
		return "/fund/fundAddPro";
	}
	
	@RequestMapping("/fund/fundDeletePro.do")
	public String fundDeletePro(HttpServletRequest request, FundVO vo){
		String fund_code = (String) request.getParameter("fund_code");
		sqlMap.delete("fundDeletePro", fund_code);
		return "/fund/fundDeletePro";
	}
	
	@RequestMapping("/fund/fundUpdate.do")
	public String fundUpdate(HttpServletRequest request){
		String fund_code = (String) request.getParameter("fund_code");
		
		FundVO fundVo = (FundVO) sqlMap.queryForObject("fundSelectUpdate", fund_code);
		request.setAttribute("fundVo", fundVo);
		
		return "/fund/fundUpdate";
	}
	
	@RequestMapping("/fund/fundUpdatePro.do")
	public String fundUpdatePro(HttpServletRequest request, FundVO vo) throws Exception{
		sqlMap.update("fundUpdate", vo);
		return "/fund/fundUpdatePro";
	}
}

