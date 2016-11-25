package gw.bstatement;

import java.sql.Timestamp;

public class BstatementVO {
	private String bs_code;				//업무명세서번호
	private String emp_code;			//사원번호
	private String dept_code;			//부서번호
	private String po_code;				//직급번호
	private String bs_st;				//업무상태(임시저장,검토요청,검토완료)
	private String bs_goal;				//업무목표
	private String bs_year;				//업무실행년도
	private String bs_ap;				//평가자
	private Timestamp bs_date;			//작성일
	public String getBs_code() {
		return bs_code;
	}
	public void setBs_code(String bs_code) {
		this.bs_code = bs_code;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getPo_code() {
		return po_code;
	}
	public void setPo_code(String po_code) {
		this.po_code = po_code;
	}
	public String getBs_st() {
		return bs_st;
	}
	public void setBs_st(String bs_st) {
		this.bs_st = bs_st;
	}
	public String getBs_goal() {
		return bs_goal;
	}
	public void setBs_goal(String bs_goal) {
		this.bs_goal = bs_goal;
	}
	public String getBs_year() {
		return bs_year;
	}
	public void setBs_year(String bs_year) {
		this.bs_year = bs_year;
	}
	public String getBs_ap() {
		return bs_ap;
	}
	public void setBs_ap(String bs_ap) {
		this.bs_ap = bs_ap;
	}
	public Timestamp getBs_date() {
		return bs_date;
	}
	public void setBs_date(Timestamp bs_date) {
		this.bs_date = bs_date;
	}
	
	
	
}
