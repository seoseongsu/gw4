package gw.product;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("product_List.do")
	
		public String product_List(){
			return "/product/product_List";
	}
		
	@RequestMapping("product_Insert.do")
	
		public String product_Insert(){
	
			return "/product/product_Insert";
	}
		
	}
