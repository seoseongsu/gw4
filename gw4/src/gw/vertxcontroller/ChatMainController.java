package gw.vertxcontroller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

//import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import gw.employee.EmployeeVO;

@Controller
public class ChatMainController  {
	
	@Autowired SqlMapClientTemplate sqlMap;
	ArrayList list = new ArrayList();
	
	@RequestMapping("/chat/chat.do")
	public String Chat(HttpSession session,HttpServletRequest request, EmployeeVO dto) {
		
			ServletContext application = request.getServletContext();
		    list = (ArrayList)application.getAttribute("userlist");
		    String sessions = null;
	        String appId  =  (String)application.getAttribute("appId");
	        System.out.println("id =-= "+appId);
	        Map tmpMap = null;
	        dto = (EmployeeVO)sqlMap.queryForObject("getMemberlist",appId);
		    application.setAttribute("list", dto);    
		    System.out.println(list);
		for(int i=0; i < list.size(); i++){	
			tmpMap =(Map) list.get(i);	
			sessions = String.valueOf(tmpMap.get("sessions"));
		if(sessions.equals(session.getId())){
			boolean a = sessions.equals(session.getId());
			tmpMap.put("accessTime",System.currentTimeMillis());
			list.set(i, tmpMap);
		}
		
		 if((System.currentTimeMillis()-Long.parseLong(String.valueOf(tmpMap.get("accessTime")))) > 30000) {	
			list.remove(i);
		   }
		}
			
		  String tmpUserId = null;
		  String tmpSessionId = null;
		  String tmpSessionName = null;
		
		for(int i=0; i < list.size(); i++){
			tmpMap = (Map)list.get(i); 
			tmpUserId = String.valueOf(tmpMap.get("mapId"));	
			tmpSessionId = String.valueOf(tmpMap.get("sessions"));
			tmpSessionName = String.valueOf(tmpMap.get("mapName"));
			
			if(session.getId().equals(tmpSessionId)){						
			}	
		}
		return "/chat/chat";
	}
	
	@RequestMapping("/chat/chatExit.do")
	public String chatExit() {
    return "/chat/chatExit";
	}
	
	@RequestMapping("/chat/chatlist.do")
	public String chatlist(HttpSession session,HttpServletRequest request, EmployeeVO dto){
		
		    ServletContext application = request.getServletContext();
		    list = (ArrayList)application.getAttribute("userlist");
		    String sessions = null;
	        Map tmpMap = null;
		
            request.setAttribute("list", dto);
		    
		for(int i=0; i < list.size(); i++){
			
			tmpMap =(Map) list.get(i);
			sessions = String.valueOf(tmpMap.get("sessions"));
			
		if(sessions.equals(session.getId())){
			
			boolean a = sessions.equals(session.getId());
		    tmpMap.put("accessTime",System.currentTimeMillis());
		    list.set(i, tmpMap);
		
		}
			if((System.currentTimeMillis()-Long.parseLong(String.valueOf(tmpMap.get("accessTime")))) > 30000) 
			{
				list.remove(i);
			}
		}
		
		  String tmpUserId = null;
		  String tmpSessionId = null;
		  String tmpSessionName = null;
		 
		for(int i=0; i < list.size(); i++)
		{
			tmpMap = (Map)list.get(i);
			tmpUserId = String.valueOf(tmpMap.get("mapId"));	
			tmpSessionId = String.valueOf(tmpMap.get("sessions"));
			tmpSessionName = String.valueOf(tmpMap.get("mapName"));
			
			if(session.getId().equals(tmpSessionId)){
			}	
		}
		    request.setAttribute("count", list.size());    
		    request.setAttribute("nowlist", list);
	        /*
	        ArrayList allList = new ArrayList();
	        Enumeration enu =  application.getAttributeNames();
	       while(enu.hasMoreElements()){
	    	   String name = (String)enu.nextElement();
	    	   System.out.println(name);
	    	   int index = name.indexOf("group_");
	    	   if(index >= 0){
	    		   name = name.substring(name.indexOf("_")+1);
	    		   allList.add(name);
	    	   }
	       }
	        request.setAttribute("allList",allList);
	        */
		    return "/chat/chatlist";
	}
}



