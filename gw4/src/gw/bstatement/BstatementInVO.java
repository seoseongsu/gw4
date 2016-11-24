package gw.bstatement;

import java.sql.Timestamp;

public class BstatementInVO {
	public class BstatementVO {
		private String bs_code;				//업무명세서번호
		private String emp_code;			//사원번호
		private String emp_name;			//사원이름
		private String dept_code;			//부서번호
		private String dept_name;			//부서이름
		private String dept_higher;			//상위부서명
		private String dept_leader;			//부서장명
		private String po_code;				//직급번호
		private String po_name;				//직급이름
		private String bs_st;				//업무상태(임시저장,검토요청,검토완료)
		private String bs_year;				//작성일
		private String bs_goal;				//업무실행년도
		private Timestamp bs_date;			//업무목표
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
		public String getEmp_name() {
			return emp_name;
		}
		public void setEmp_name(String emp_name) {
			this.emp_name = emp_name;
		}
		public String getDept_code() {
			return dept_code;
		}
		public void setDept_code(String dept_code) {
			this.dept_code = dept_code;
		}
		public String getDept_name() {
			return dept_name;
		}
		public void setDept_name(String dept_name) {
			this.dept_name = dept_name;
		}
		public String getDept_higher() {
			return dept_higher;
		}
		public void setDept_higher(String dept_higher) {
			this.dept_higher = dept_higher;
		}
		public String getDept_leader() {
			return dept_leader;
		}
		public void setDept_leader(String dept_leader) {
			this.dept_leader = dept_leader;
		}
		public String getPo_code() {
			return po_code;
		}
		public void setPo_code(String po_code) {
			this.po_code = po_code;
		}
		public String getPo_name() {
			return po_name;
		}
		public void setPo_name(String po_name) {
			this.po_name = po_name;
		}
		public String getBs_st() {
			return bs_st;
		}
		public void setBs_st(String bs_st) {
			this.bs_st = bs_st;
		}
		public String getBs_year() {
			return bs_year;
		}
		public void setBs_year(String bs_year) {
			this.bs_year = bs_year;
		}
		public String getBs_goal() {
			return bs_goal;
		}
		public void setBs_goal(String bs_goal) {
			this.bs_goal = bs_goal;
		}
		public Timestamp getBs_date() {
			return bs_date;
		}
		public void setBs_date(Timestamp bs_date) {
			this.bs_date = bs_date;
		}
	}
}
