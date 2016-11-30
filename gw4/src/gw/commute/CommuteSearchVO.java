package gw.commute;

import java.sql.Timestamp;

public class CommuteSearchVO {
	private String com_code;
	private String emp_code;
	private String emp_name;
	private String dept_code;
	private String dept_name;
	private String po_code;
	private String po_name;
	private Timestamp com_go;
	private Timestamp com_off;
	private String com_status;
	private String com_ip;
	
	public String getCom_code() {
		return com_code;
	}
	public void setCom_code(String com_code) {
		this.com_code = com_code;
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
	public Timestamp getCom_go() {
		return com_go;
	}
	public void setCom_go(Timestamp com_go) {
		this.com_go = com_go;
	}
	public Timestamp getCom_off() {
		return com_off;
	}
	public void setCom_off(Timestamp com_off) {
		this.com_off = com_off;
	}
	public String getCom_status() {
		return com_status;
	}
	public void setCom_status(String com_status) {
		this.com_status = com_status;
	}
	public String getCom_ip() {
		return com_ip;
	}
	public void setCom_ip(String com_ip) {
		this.com_ip = com_ip;
	}
	
	
}
