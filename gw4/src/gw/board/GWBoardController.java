package gw.board;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;






	@Controller
	public class GWBoardController {
		@Autowired
		private SqlMapClientTemplate sqlMap;
		
		@RequestMapping("board_Main.do")
		public String board_Main(HttpServletRequest request)throws Exception{
			
			return "/gboard/board_Main";
		}
		
	
	@RequestMapping("board_List.do")
		public String board_List(HttpServletRequest request, Iboard_categoryVO category) throws Exception{
	   
			List categoryList = sqlMap.queryForList("gboard.categorySelect", category);
	           
	        String pageNum = request.getParameter("pageNum");
	
	        if (pageNum == null) {
	            pageNum = "1";
	        }
	        int pageSize = 10;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        int count = 0;
	        int number=0;
	
	        List boardList = null;
	        count = (Integer)sqlMap.queryForObject("gboard.boardCount", null);
	        HashMap map = new HashMap();
	        map.put("start", startRow);
	        map.put("end", endRow);
	        if (count > 0) {
	        	boardList = sqlMap.queryForList("gboard.boardAll", map);
	        } else {
	        	boardList = Collections.EMPTY_LIST;
	        }
	       
			number=count-(currentPage-1)*pageSize;
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageSize", new Integer(pageSize));
			request.setAttribute("number", new Integer(number));
	        request.setAttribute("category_name", "통합 게시판");
			request.setAttribute("categoryList", categoryList);  
			request.setAttribute("boardList", boardList);
			System.out.println(number);
			System.out.println(count);
			System.out.println(categoryList);
			System.out.println(boardList);
	
			return "/gboard/board_List";
		}

	@RequestMapping("board_WriteForm.do")
		public String board_writeForm(HttpServletRequest request, Model model) throws Exception{
				
			int num=0;  
			
	        try{  
	          if(request.getParameter("num") != null) {
		         num=Integer.parseInt(request.getParameter("num"));
		      }
			}catch(Exception e){
				e.printStackTrace();
				}
				model.addAttribute("num", num);
				
				Iboard_categoryVO category = new Iboard_categoryVO();
				List categoryList = sqlMap.queryForList("gboard.categorySelect", category);
			    request.setAttribute("categoryList", categoryList);
			
			return "/gboard/board_WriteForm";
		}
	
	@RequestMapping("board_WritePro.do")
		public String board_writePro(HttpServletRequest request, BoardVO boardVO, Model model) throws Exception{
			
			boardVO.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
			
			model.addAttribute("VO" , boardVO);
	
			sqlMap.insert("gboard.boardInsert", boardVO);
			
			
			
			return "/gboard/board_WritePro";
		}
		
		
		
	
	@RequestMapping("board_Content.do")
		public String board_Content(HttpServletRequest request) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("board_num"));
        String pageNum = request.getParameter("pageNum");

        sqlMap.update("gboard.boardReadcount", num);
        BoardVO boardList =  (BoardVO)sqlMap.queryForObject("gboard.boardSelectNum", num);
  
        request.setAttribute("board_num", new Integer(num));
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("boardList", boardList);
		
		
		return "/gboard/board_Content";
	}
	
	@RequestMapping("board_DeleteForm.do")
		public String board_DeleteForm(HttpServletRequest request) throws Exception{
		
		int num = Integer.parseInt(request.getParameter("board_num"));
	    String pageNum = request.getParameter("pageNum");
	
		
		request.setAttribute("board_num", new Integer(num));
	    request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/gboard/board_DeleteForm";
		}
	
	@RequestMapping("board_DeletePro.do")
		public String board_DeletePro(HttpServletRequest request) throws Exception{
		
	
	
	    int num = Integer.parseInt(request.getParameter("board_num"));
	    String pageNum = request.getParameter("pageNum");
	    System.out.println(pageNum);
	    String passwd = request.getParameter("board_passwd");
	    
	    int check = 0;
	    String pwcheck = (String) sqlMap.queryForObject("gboard.boardSelectPasswd", num);
	    if(pwcheck!=null){
	    	if(pwcheck.equals(passwd)){
	    		sqlMap.delete("gboard.boardDelete", num);
	    		check = 1;
	    	}else{
	    		check = 0;
	    	}
	    }
	
	
	    request.setAttribute("pageNum", new Integer(pageNum));
	    request.setAttribute("check", new Integer(check));
		return "/gboard/board_DeletePro";
		}
	
	

	
	
	/*-----------------------------------------------------------------------------------*/	
	
	
	@RequestMapping("board_ModifyForm.do")
		public String board_ModifyForm(HttpServletRequest request)throws Exception{
		
		
			int num = Integer.parseInt(request.getParameter("board_num"));
		    String pageNum = request.getParameter("pageNum");

		    BoardVO boardList = (BoardVO) sqlMap.queryForObject("gboard.boardSelectNum", num);

		
		    request.setAttribute("pageNum", new Integer(pageNum));
		    request.setAttribute("boardList", boardList);
		
		
		
		
		return "/gboard/board_ModifyForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*-----------------------------------------------------------------------------------*/
	
	@RequestMapping("board_ModifyPro.do")
		public String board_ModifyPro(){
		
		return "/gboard/board_ModifyPro";
	}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	