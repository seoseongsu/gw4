package gw.department;

public class DepartmentVO {
	private String dept_code;		//부서코드
	private String dept_name;		//부서명
	private String dept_higher;		//상위부서명
	private String dept_leader;		//부서장
	private String dept_phone;		//부서연락처
	
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
	public String getDept_phone() {
		return dept_phone;
	}
	public void setDept_phone(String dept_phone) {
		this.dept_phone = dept_phone;
	}
}
