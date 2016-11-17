package gw.fund;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundController {

	@RequestMapping("/fund/fundList.do")
	public String fundList(){
		return "/fund/fundList";
	}
}
