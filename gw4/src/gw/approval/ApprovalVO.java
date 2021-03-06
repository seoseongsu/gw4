package gw.approval;

public class ApprovalVO {
	private String approval_code;
	private String dept_code;
	private String po_code;
	private String emp_code;
	private String approval_title; //제목
	private String approval_content; //내용
	private String approval_days; //신청일자
	private String approval_member; //인원
	private String approval_day; //휴가일자
	
	public String getApproval_code() {
		return approval_code;
	}
	public void setApproval_code(String approval_code) {
		this.approval_code = approval_code;
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
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getApproval_title() {
		return approval_title;
	}
	public void setApproval_title(String approval_title) {
		this.approval_title = approval_title;
	}
	public String getApproval_content() {
		return approval_content;
	}
	public void setApproval_content(String approval_content) {
		this.approval_content = approval_content;
	}
	public String getApproval_days() {
		return approval_days;
	}
	public void setApproval_days(String approval_days) {
		this.approval_days = approval_days;
	}
	public String getApproval_member() {
		return approval_member;
	}
	public void setApproval_member(String approval_member) {
		this.approval_member = approval_member;
	}
	public String getApproval_day() {
		return approval_day;
	}
	public void setApproval_day(String approval_day) {
		this.approval_day = approval_day;
	}
}
