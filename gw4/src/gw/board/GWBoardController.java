package gw.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.AbstractView;
import org.springframework.web.servlet.view.RedirectView;








	@Controller
	public class GWBoardController implements ServletContextAware {
		@Autowired
		private SqlMapClientTemplate sqlMap;
		private Object servletContext;
		
		@RequestMapping("board_Main.do")
		public String board_Main(HttpServletRequest request)throws Exception{
			
			return "/gboard/board_Main";
		}

		@Override
		public void setServletContext(ServletContext arg0){
			this.servletContext = servletContext;
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
		        map.put("aa", "공지사항");
		        if (count > 0) {
		        	boardList = sqlMap.queryForList("gboard.boardAll", map);
		        } else {
		        	category_code = request.getParameter("category_code");
		        	}
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
	
			request.setAttribute("categoryList", categoryList);  
			request.setAttribute("boardList", boardList);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("category_code", category_code);
	
			return "/gboard/board_List";
		}


/*--------------------------------ListPro---------------------------------------------------*/		
	
	@RequestMapping("board_ListPro.do")
		public String board_ListPro(HttpServletRequest request, Model model, Iboard_categoryVO category) throws Exception{
		
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
	        	category_code = request.getParameter("category_code");
	        	}
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
     
		request.setAttribute("categoryList", categoryList);  
		request.setAttribute("boardList", boardList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category_code", category_code);
		
		return "/gboard/board_List";
	}
	
	
/*---------------------------- WriteForm -------------------------------------------------------*/	

	
	
	@RequestMapping("board_WriteForm.do")
		public String board_writeForm(HttpServletRequest request,Model model) throws Exception{
			
			int num = 0 ;
				String board_num = request.getParameter("board_num");
	        try{  
	          if(request.getParameter("board_num") != null) {
		         num=Integer.parseInt(request.getParameter("board_num"));
		      }
	         
	       
			}catch(Exception e){
				e.printStackTrace();
				}
				model.addAttribute("board_num", num);
				
				
				Iboard_categoryVO category = new Iboard_categoryVO();
				List categoryList = sqlMap.queryForList("gboard.categorySelect", category);
			    request.setAttribute("categoryList", categoryList);
			
			return "/gboard/board_WriteForm";
		}

	
/*---------------------------- WritePro -------------------------------------------------------*/	
	
	
	@RequestMapping("board_WritePro.do")
		public ModelAndView board_writePro(MultipartHttpServletRequest req, BoardVO boardVO, 
				Model model) throws Exception{
			
		
			int num = Integer.parseInt(req.getParameter("board_num"));
			MultipartFile f = req.getFile("file");
			String board_file_orgname = f.getOriginalFilename();
			String board_file_savname = f.getOriginalFilename()+ "_"+System.currentTimeMillis();
			
			model.addAttribute("boardVO" , boardVO);
			boardVO.setBoard_file_orgname(board_file_orgname);
			boardVO.setBoard_file_savname(board_file_savname);
	
			sqlMap.insert("gboard.boardInsert", boardVO);
			ModelAndView mav = new ModelAndView();
			
		
		
		
			
			req.setAttribute("board_file_orgname", board_file_orgname);
			req.setAttribute("board_file_savname", board_file_savname);
			
			try {
				
				
				byte[] b = f.getBytes();
				File file = new File("d:\\file\\"+board_file_orgname);
				
				//파일에 바이트 배열을 기록할 수 있는 스트림 생성
				FileOutputStream fos = new FileOutputStream(file);
				fos.write(b);
				fos.close();
			} catch(IOException e){
				
			}
			req.setAttribute("board_num", num);
			mav.setViewName("/gboard/board_WritePro");
			return mav;
			
	}
			
			
			
			
			
			
			
			
			
			
			/*
			MultipartFile f = boardVO.getFile();
			if(!f.isEmpty()){
				String board_file_orgname = f.getOriginalFilename();
				String board_file_savname = board_file_orgname + System.currentTimeMillis()
											+ f.getSize();
				String path = ((ServletContext) servletContext).getRealPath("/resources");
				System.out.println("path :" + path);
				File file = new File(path + File.separator + board_file_savname );
				boardVO.setBoard_file_orgname(board_file_orgname);
				boardVO.setBoard_file_savname(board_file_savname);
				f.transferTo(file);
			}
			boardVO.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
			*/
			
			
		
		
		
/*------------------------------Content-----------------------------------------------------*/		

	
	
	@RequestMapping("board_Content.do")
		public String board_Content(Map<String, Object> model, HttpServletRequest request, 
				HttpServletResponse response, Board_replyVO board_replyVO) 
						throws Exception {
		
		
		
		int num = Integer.parseInt(request.getParameter("board_num"));
        String pageNum = request.getParameter("pageNum");
        
        

        sqlMap.update("gboard.boardReadcount", num);
        BoardVO boardList =  (BoardVO)sqlMap.queryForObject("gboard.boardSelectNum", num);
        
        List replyList = sqlMap.queryForList("gboard.board_replyView", board_replyVO);
         
        
        
        
        
	        	
        request.setAttribute("board_num", num);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("boardList", boardList);
        request.setAttribute("replyList", replyList);
        
		
        
		return "/gboard/board_Content";
	}

	


/*------------------------------DeleteForm-----------------------------------------------------*/	

	
	
	@RequestMapping("board_DeleteForm.do")
		public String board_DeleteForm(HttpServletRequest request) throws Exception{
		
		int num = Integer.parseInt(request.getParameter("board_num"));
	    String pageNum = request.getParameter("pageNum");
	
		
		request.setAttribute("board_num", new Integer(num));
	    request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/gboard/board_DeleteForm";
		}

/*------------------------------DeletePro-----------------------------------------------------*/	
                                  
	
	@RequestMapping("board_DeletePro.do")
		public String board_DeletePro(HttpServletRequest request) throws Exception{
		
	
	
	    int num = Integer.parseInt(request.getParameter("board_num"));
	    String pageNum = request.getParameter("pageNum");
	    
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
	
	

/*--------------------------------- ModifyForm --------------------------------------------------------------*/	
	

	
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

	
	
/*-------------------------------- ModifyPro  --------------------------------------------------------------*/	
	
	
	
	
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


		
	

	
/*--------------------- Board_reply(Insert)  --------------------------------------------------------------*/	
	
	@RequestMapping("replyInsert.do")
	public String ReplyInsert(HttpServletRequest request, BoardVO boardVO, 
			Board_replyVO board_replyVO, Model model)throws Exception{
		
		int num = Integer.parseInt(request.getParameter("board_num"));
		String pageNum = request.getParameter("pageNum");
		
		 model.addAttribute("boardVO" , boardVO);
		model.addAttribute("board_replyVO" , board_replyVO);
		
		sqlMap.insert("gboard.board_replyInsert", board_replyVO);
		
		request.setAttribute("board_num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "/gboard/board_ReplyPro";
		}
	
	
/*--------------------- Board_reply(View)  --------------------------------------------------------------*/	
		
	
	@RequestMapping("replyView.do")
	public String ReplyView( HttpServletRequest request , BoardVO boardVO, 
			Board_replyVO board_replyVO, Model model) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("board_num"));
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		
		model.addAttribute("boardVO" , boardVO);
		model.addAttribute("board_replyVO" , board_replyVO);
		
		
		
		request.setAttribute("board_num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("reply_num", reply_num);

		return "/gboard/board_ReplyPro";
	
		}
	
	
	
/*--------------------- Board_reply(Delete)  --------------------------------------------------------------*/		
	
	@RequestMapping("reply_DeletePro.do")
		public String reply_Delete(HttpServletRequest request, BoardVO boardVO, 
				Board_replyVO board_replyVO ) throws Exception{
		int num = Integer.parseInt(request.getParameter("board_num"));
	    int reply_num = Integer.parseInt(request.getParameter("reply_num"));
	    String pageNum = request.getParameter("pageNum");
	    
	
	    
	    
	    sqlMap.delete("gboard.replyDelete", reply_num);
	    
	    
	    request.setAttribute("pageNum", pageNum);
		request.setAttribute("reply_num", reply_num);
		request.setAttribute("board_num", num);

		System.out.println(reply_num);
		
		return "/gboard/reply_DeletePro";
	
		}
	
	
/*--------------------- Board_reply(ModifyPro)  --------------------------------------------------------------*/			
	
	
	@RequestMapping("reply_ModifyForm.do")
		public String reply_ModifyForm(HttpServletRequest request, Board_replyVO board_replyVO) throws Exception{
		
		int num = Integer.parseInt(request.getParameter("board_num"));
	    int reply_num = Integer.parseInt(request.getParameter("reply_num"));
	    String pageNum = request.getParameter("pageNum");
	    
	    
	    Board_replyVO replyList =  (Board_replyVO)sqlMap.queryForObject("gboard.replySelectNum", reply_num);
	  
        request.setAttribute("replyList", replyList);
	    request.setAttribute("pageNum", pageNum);
		request.setAttribute("reply_num", reply_num);
		request.setAttribute("board_num", num);
		request.setAttribute("board_replyVO", board_replyVO);
		
		
		
		return "/gboard/reply_ModifyForm";
		}
	
	
/*--------------------- Board_reply(ModifyPro)  --------------------------------------------------------------*/			
		
	@RequestMapping("reply_ModifyPro.do")
		public String reply_ModifyPro(HttpServletRequest request,Model model, Board_replyVO board_replyVO) throws Exception{
		
		int num = Integer.parseInt(request.getParameter("board_num"));
	    int reply_num = Integer.parseInt(request.getParameter("reply_num"));
	    String pageNum = request.getParameter("pageNum");
	    
	    model.addAttribute("board_replyVO" , board_replyVO);
	    sqlMap.update("gboard.replyModify", reply_num);
	    
	    request.setAttribute("pageNum", pageNum);
		request.setAttribute("reply_num", reply_num);
		request.setAttribute("board_num", num);
		request.setAttribute("board_replyVO", board_replyVO);
		
		
		return "/gboard/reply_ModifyPro";
	}
	
	}
	
	
	