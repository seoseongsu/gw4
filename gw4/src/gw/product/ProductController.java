package gw.product;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import gw.board.BoardVO;

			@Controller
			public class ProductController {
				
				@Autowired
				private SqlMapClientTemplate sqlMap;
				
				
				@RequestMapping("product_Main.do")
				public String Product_Main(HttpServletRequest request)throws Exception{
				
					return "/product/product_Main";
				}
				
			/* ----------------------List----------------------------------------------------------------------------- */	
				
				
				@RequestMapping("product_List.do")
				
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
						
						List productList= null; 
						HashMap map = new HashMap();
				        map.put("start", startRow);
				        map.put("end", endRow);
				   
				       	productList = sqlMap.queryForList("product.productdAll", map);
				    
						System.out.println(productList);
						System.out.println(request.getAttribute("product_code"));
					       
							number=count-(currentPage-1)*pageSize;
					        request.setAttribute("currentPage", new Integer(currentPage));
					        request.setAttribute("startRow", new Integer(startRow));
					        request.setAttribute("endRow", new Integer(endRow));
					        request.setAttribute("count", new Integer(count));
					        request.setAttribute("pageSize", new Integer(pageSize));
							request.setAttribute("number", new Integer(number));
							request.setAttribute("productList", productList);
							request.setAttribute("pageNum", pageNum);
						
						return "/product/product_List";
				}
				
				
			/* ----------------------Insert----------------------------------------------------------------------------- */		
				
				@RequestMapping("product_Insert.do")
				
					public String product_Insert( Model model, HttpServletRequest request, ProductVO productVO)throws Exception{
				
							
						return "/product/product_Insert";
					
				}
				
				@RequestMapping("product_InsertPro.do")
					public String product_InsertPro( Model model, HttpServletRequest request, ProductVO productVO)throws Exception{
					
					model.addAttribute("ProductVO" , productVO);
					sqlMap.insert("product.HW_productInsert", productVO);
					
						return "/product/product_InsertPro";
					}
			
				
			/* ----------------------Modify----------------------------------------------------------------------------- */		
				
				@RequestMapping("product_Modify.do")
					public String product_Modify(HttpServletRequest request)throws Exception{
					
					int num = Integer.parseInt(request.getParameter("product_num"));
					ProductVO productList = (ProductVO) sqlMap.queryForObject("product.productNum", num);
					
					request.setAttribute("product_num", num);
					request.setAttribute("productList", productList);
					return "/product/product_Modify";
				}
				
				@RequestMapping("product_ModifyPro.do")
					public String product_ModifyPro(HttpServletRequest request, 
							ProductVO productVO, Model model)throws Exception{
					
					int num = Integer.parseInt(request.getParameter("product_num"));
					
					model.addAttribute("productList" , productVO);
					sqlMap.update("product.productModify", productVO);
					
					
					request.setAttribute("product_num", num);
					
					return "/product/product_ModifyPro";
				
					}
				
			
			/* ----------------------Delete----------------------------------------------------------------------------- */		
			
				@RequestMapping("product_Delete.do")
					
					public String product_Delete(HttpServletRequest request)throws Exception{
					
					int num = Integer.parseInt(request.getParameter("product_num"));
					ProductVO productList = (ProductVO) sqlMap.queryForObject("product.productNum", num);
					
					request.setAttribute("productList", productList);
					request.setAttribute("product_num", num);;
					return "/product/product_Delete";
				}
				
				
				@RequestMapping("product_DeletePro.do")
				
					public String product_DeletePro(HttpServletRequest request)throws Exception{
						
					int num = Integer.parseInt(request.getParameter("product_num"));
					ProductVO productList = (ProductVO) sqlMap.queryForObject("product.productNum", num);
					
					sqlMap.delete("product.productDelete", num);
					
					request.setAttribute("productList", productList);
					request.setAttribute("product_num", num);;
						
					
					
						return"/product/product_DeletePro";
				}
			
			/* ----------------------Apply----------------------------------------------------------------------------- */		
				
				
				@RequestMapping("product_Apply.do")
					public String product_Apply(HttpServletRequest request)throws Exception{
						
						int num = Integer.parseInt(request.getParameter("product_num"));
						ProductVO productList = (ProductVO) sqlMap.queryForObject("product.productNum", num);
						
						request.setAttribute("product_num", num);
						request.setAttribute("productList", productList);
					return "/product/product_Apply";
				}
			
			
			
			/* ----------------------apply_List----------------------------------------------------------------------------- */		
			
			
				@RequestMapping("aplly_List.do")
					public String aplly_list(){
					
					return "/product/aplly_List";
					}
	
	
/* ----------------------SoftList----------------------------------------------------------------------------- */	
	
										
										@RequestMapping("productSoft_List.do")
										
											public String productSoft_List(HttpServletRequest request)throws Exception{
											
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
													request.setAttribute("productSoftList", productSoftList);
													request.setAttribute("pageNum", pageNum);
												
												return "/productSoft/productSoft_List";
										}
										
										
									/* ----------------------Insert----------------------------------------------------------------------------- */		
										
										@RequestMapping("productSoft_Insert.do")
										
											public String productSoft_Insert( Model model, HttpServletRequest request, ProductSoftVO productSoftVO)throws Exception{
										
													
												return "/productSoft/productSoft_Insert";
											
										}
										
										@RequestMapping("productSoft_InsertPro.do")
											public String product_InsertPro( Model model, HttpServletRequest request, ProductSoftVO productSoftVO)throws Exception{
											
											model.addAttribute("ProductSoftVO" , productSoftVO);
											sqlMap.insert("product.SW_productSoftInsert", productSoftVO);
											
												return "/productSoft/productSoft_InsertPro";
											}
									
										
									/* ----------------------Modify----------------------------------------------------------------------------- */		
										
										@RequestMapping("productSoft_Modify.do")
											public String productSoft_Modify(HttpServletRequest request)throws Exception{
											
											int num = Integer.parseInt(request.getParameter("product_num"));
											ProductSoftVO productList = (ProductSoftVO) sqlMap.queryForObject("product.productSoftNum", num);
											
											request.setAttribute("productSoft_num", num);
											request.setAttribute("productSoftList", productList);
											return "/productSoft/productSoft_Modify";
										}
										
										@RequestMapping("productSoft_ModifyPro.do")
											public String productSoft_ModifyPro(HttpServletRequest request, 
													ProductSoftVO productSoftVO, Model model)throws Exception{
											
											int num = Integer.parseInt(request.getParameter("productSoft_num"));
											
											model.addAttribute("productSoftList" , productSoftVO);
											sqlMap.update("product.productSoftModify", productSoftVO);
											
											
											request.setAttribute("productSoft_num", num);
											
											return "/productSoft/productSoft_ModifyPro";
										
											}
										
									
									/* ----------------------Delete----------------------------------------------------------------------------- */		
									
										@RequestMapping("productSoft_Delete.do")
											
											public String productSoft_Delete(HttpServletRequest request)throws Exception{
											
											int num = Integer.parseInt(request.getParameter("productSoft_num"));
											ProductSoftVO productSoftList = (ProductSoftVO) sqlMap.queryForObject("product.productSoftNum", num);
											
											request.setAttribute("productSoftList", productSoftList);
											request.setAttribute("productSoft_num", num);;
											return "/productSoft/productSoft_Delete";
										}
										
										
										@RequestMapping("productSoft_DeletePro.do")
										
											public String productSoft_DeletePro(HttpServletRequest request)throws Exception{
												
											int num = Integer.parseInt(request.getParameter("productSoft_num"));
											ProductSoftVO productSoftList = (ProductSoftVO) sqlMap.queryForObject("product.productSoftNum", num);
											
											sqlMap.delete("product.productSoftDelete", num);
											
											request.setAttribute("productSoftList", productSoftList);
											request.setAttribute("productSoft_num", num);;
												
											
											
												return"/productSoft/product_DeletePro";
										}
									
									/* ----------------------Apply----------------------------------------------------------------------------- */		
										
										
										@RequestMapping("productSoft_Apply.do")
											public String productSoft_Apply(HttpServletRequest request)throws Exception{
												
												int num = Integer.parseInt(request.getParameter("productSoft_num"));
												ProductSoftVO productSoftList = (ProductSoftVO) sqlMap.queryForObject("product.productSoftNum", num);
												
												request.setAttribute("productSoft_num", num);
												request.setAttribute("productSoftList", productSoftList);
											return "/productSoft/productSoft_Apply";
										}
									
									
										
	
	}



















