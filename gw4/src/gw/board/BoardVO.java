package gw.board;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	private String category_code;
	private int board_num;	
	private String board_subject;
	private String board_content;
	private String board_passwd;
	private Timestamp board_date;
	private int board_readcount;  
	private String board_file_orgname;
	private String board_file_savname;
	private MultipartFile file;
	
	
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
