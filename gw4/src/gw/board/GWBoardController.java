package gw.board;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;






	@Controller
	public class GWBoardController {
		@Autowired
		private SqlMapClientTemplate sqlMap;
		
		@RequestMapping("board_Main.do")
		public String board_Main(HttpServletRequest request)throws Exception{
			
			return "/gboard/board_Main";
		}

	
		
/*--------------------------------List---------------------------------------------------*/	
		
		
		
	@RequestMapping("board_List.do")
		public String board_List(HttpServletRequest request, Iboard_categoryVO category) throws Exception{
	   
			List categoryList = sqlMap.queryForList("gboard.categorySelect", category);
	           
	        String pageNum = request.getParameter("pageNum");
	        
	        String category_code = request.getParameter("category_code");
	        
	        
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
	        
	        if (category_code == null) {
	           
	        	count = (Integer)sqlMap.queryForObject("gboard.boardCount", null);
		        HashMap map = new HashMap();
		        map.put("start", startRow);
		        map.put("end", endRow);
		        if (count > 0) {
		        	boardList = sqlMap.queryForList("gboard.boardAll", map);
		        } else {
		        	boardList = Collections.EMPTY_LIST;
		        }
		        	
	        	
	        }
	        else {
	        	
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
			request.setAttribute("pageNum", pageNum);
			
	
			return "/gboard/board_List";
		}

	
	
/*---------------------------- Write -------------------------------------------------------*/	

	
	
	@RequestMapping("board_WriteForm.do")
		public String board_writeForm(HttpServletRequest request,Model model) throws Exception{
				
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
		public String board_writePro(MultipartHttpServletRequest req, BoardVO boardVO, Model model) throws Exception{
			
			boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
			
			model.addAttribute("boardVO" , boardVO);
	
			sqlMap.insert("gboard.boardInsert", boardVO);
			
			
			MultipartFile file = ((MultipartRequest) req).getFile("file");	//form에서 받아오는 save를 file에 넣음	
			//다중업로드
			List<MultipartFile> files = ((MultipartRequest) req).getFiles("file");	//for문 사용해야함
			//업로드 위치
			File copyFile = new File("d://file//"+file.getOriginalFilename());
			//원본을 업로드위치에 복사
			try {
				file.transferTo(copyFile);//복사본을 업로드 할 위치에 복사, 예외처리 발생
			} catch (Exception e) {e.printStackTrace();}
			
			
			
			return "/gboard/board_WritePro";
		}
		
		
		
/*------------------------------Content-----------------------------------------------------*/		

	
	
	@RequestMapping("board_Content.do")
		public String board_Content(HttpServletRequest request) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("board_num"));
        String pageNum = request.getParameter("pageNum");

        sqlMap.update("gboard.boardReadcount", num);
        BoardVO boardList =  (BoardVO)sqlMap.queryForObject("gboard.boardSelectNum", num);
  
        request.setAttribute("board_num", num);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("boardList", boardList);
		
		
		return "/gboard/board_Content";
	}

	
	
/*------------------------------Delete-----------------------------------------------------*/	

	
	
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
	
	

/*--------------------- Modify --------------------------------------------------------------*/	
	

	
	@RequestMapping("board_ModifyForm.do")
		public String board_ModifyForm(HttpServletRequest request)throws Exception{
		
		
			int num = Integer.parseInt(request.getParameter("board_num"));
		    String pageNum = request.getParameter("pageNum");

		    BoardVO boardList = (BoardVO) sqlMap.queryForObject("gboard.boardSelectNum", num);
		    
		    Iboard_categoryVO category = new Iboard_categoryVO();
			List categoryList = sqlMap.queryForList("gboard.categorySelect", category);
		    request.setAttribute("categoryList", categoryList);
		    request.setAttribute("pageNum", pageNum);
		    request.setAttribute("boardList", boardList);
		    request.setAttribute("board_num", num);
		
		
		
		
		return "/gboard/board_ModifyForm";
	}

	
	
/*--------------------- Modify 작업중 --------------------------------------------------------------*/	
	
	
	
	
	@RequestMapping("board_ModifyPro.do")
	public String board_ModifyPro(HttpServletRequest request, BoardVO boardVO, Model model)throws Exception{

	    String pageNum = request.getParameter("pageNum");
	    int num = Integer.parseInt(request.getParameter("board_num"));
		
		
		model.addAttribute("boardList" , boardVO);
		
	    String passwd = request.getParameter("board_passwd");


	    int check = 0;
	    String pwcheck = (String) sqlMap.queryForObject("gboard.boardSelectPasswd", num);
	    if(pwcheck!=null){
	    	if(pwcheck.equals(passwd)){
	    		sqlMap.update("gboard.boardModify", boardVO);
	    		check = 1;
	    	}else{
	    		check = 0;
	    	}
	    }
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("check", check);
	    request.setAttribute("board_num", num);
		return "/gboard/board_ModifyPro";
	}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	