package gw.product;

import java.sql.Timestamp;

public class ProductSoftVO {
	
	private int product_num; // 장비 번호(시퀀스)
 	private String sw_product_code; // 소프트웨어 장비 코드 (시리얼 넘버)
 	private String product_name; // 장비 이름
 	private String product_divide; // 장비 구분 (입/출 고)
 	private String product_note;  // 비고
 	private String product_posesion; // 보유부서
 	private String product_type; // 장비 종류
 	private String product_quantity; // 총수량
	private String product_in;// 재고량
 	private String product_out; // 출고량
 	private String product_register_day; //등록날짜
 	private String product_rona_day; // 출고 날짜
 	private String product_return_day; // 입고 날짜

 	
 	
 	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getSw_product_code() {
		return sw_product_code;
	}
	public void setSw_product_code(String sw_product_code) {
		this.sw_product_code = sw_product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_divide() {
		return product_divide;
	}
	public void setProduct_divide(String product_divide) {
		this.product_divide = product_divide;
	}
	public String getProduct_note() {
		return product_note;
	}
	public void setProduct_note(String product_note) {
		this.product_note = product_note;
	}
	public String getProduct_posesion() {
		return product_posesion;
	}
	public void setProduct_posesion(String product_posesion) {
		this.product_posesion = product_posesion;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getProduct_in() {
		return product_in;
	}
	public void setProduct_in(String product_in) {
		this.product_in = product_in;
	}
	public String getProduct_out() {
		return product_out;
	}
	public void setProduct_out(String product_out) {
		this.product_out = product_out;
	}
	public String getProduct_register_day() {
		return product_register_day;
	}
	public void setProduct_register_day(String product_register_day) {
		this.product_register_day = product_register_day;
	}
	public String getProduct_rona_day() {
		return product_rona_day;
	}
	public void setProduct_rona_day(String product_rona_day) {
		this.product_rona_day = product_rona_day;
	}
	public String getProduct_return_day() {
		return product_return_day;
	}
	public void setProduct_return_day(String product_return_day) {
		this.product_return_day = product_return_day;
	}
	
 	
}
