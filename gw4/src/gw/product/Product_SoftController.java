package gw.product;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Product_SoftController {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	

/* ----------------------List----------------------------------------------------------------------------- */	

	
	@RequestMapping("productSoft_List.do")
	
		public String product_List(HttpServletRequest request)throws Exception{
		
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
			
			List productSoftList= null; 
			HashMap map = new HashMap();
	        map.put("start", startRow);
	        map.put("end", endRow);
	   
	       	productSoftList = sqlMap.queryForList("product.productdSoftAll", map);
	    
			System.out.println(productSoftList);
			System.out.println(request.getAttribute("product_code"));
		       
				number=count-(currentPage-1)*pageSize;
		        request.setAttribute("currentPage", new Integer(currentPage));
		        request.setAttribute("startRow", new Integer(startRow));
		        request.setAttribute("endRow", new Integer(endRow));
		        request.setAttribute("count", new Integer(count));
		        request.setAttribute("pageSize", new Integer(pageSize));
				request.setAttribute("number", new Integer(number));
				request.setAttribute("productList", productSoftList);
				request.setAttribute("pageNum", pageNum);
			
			return "/productSoft/productSoft_List";
	}


/* ----------------------Insert----------------------------------------------------------------------------- */		

	@RequestMapping("productSoft_Insert.do")
	
		public String productSoft_Insert( Model model, HttpServletRequest request, 
				ProductSoftVO productSoftVO)throws Exception{
	
				
			return "/productSoft/productSoft_Insert";
		
	}
	
	@RequestMapping("productSoft_InsertPro.do")
		public String productSoft_InsertPro( Model model, HttpServletRequest request,
				ProductSoftVO productSoftVO)throws Exception{
		
		model.addAttribute("productSoftVO" , productSoftVO);
		sqlMap.insert("product.SW_productSoftInsert", productSoftVO);
		
			return "/productSoft/productSoft_InsertPro";
		}
	
	}
