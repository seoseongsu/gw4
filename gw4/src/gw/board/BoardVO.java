package gw.board;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	private String category_code; // 카테고리 코드
	private String category_name; // 카테고리 네임
	private int board_num;	 // 글 번호
	private String board_subject; // 글제목
	private String board_content; // 글 내용
	private String board_passwd; // 글 비밀번호
	private Timestamp board_date; // 글 작성시간
	private int board_readcount;   // 클릭수
	private String board_file_orgname; // 파일 오리지널 네임
	private String board_file_savname; // 파일 저장 이름
	private MultipartFile file; 
	private String emp_code; // 사원번호
	private String emp_name; // 사원 이름
	
	
	
	
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
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_passwd() {
		return board_passwd;
	}
	public void setBoard_passwd(String board_passwd) {
		this.board_passwd = board_passwd;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_file_orgname() {
		return board_file_orgname;
	}
	public void setBoard_file_orgname(String board_file_orgname) {
		this.board_file_orgname = board_file_orgname;
	}

	public String getBoard_file_savname() {
		return board_file_savname;
	}
	public void setBoard_file_savname(String board_file_savname) {
		this.board_file_savname = board_file_savname;
	}

	
}
