package gw.bstatement;

public class BbreakdownVO {
	private String bb_code;			//업무내역번호
	private String bs_code;			//업무명세서번호
	private String bb_main;			//주요업무
	private int bb_status;			//중요도(%)
	private int bb_time;			//시간비중(%)
	private String bb_product ;		//결과물
	
	public String getBb_code() {
		return bb_code;
	}
	public void setBb_code(String bb_code) {
		this.bb_code = bb_code;
	}
	public String getBs_code() {
		return bs_code;
	}
	public void setBs_code(String bs_code) {
		this.bs_code = bs_code;
	}
	public String getBb_main() {
		return bb_main;
	}
	public void setBb_main(String bb_main) {
		this.bb_main = bb_main;
	}
	public int getBb_status() {
		return bb_status;
	}
	public void setBb_status(int bb_status) {
		this.bb_status = bb_status;
	}
	public int getBb_time() {
		return bb_time;
	}
	public void setBb_time(int bb_time) {
		this.bb_time = bb_time;
	}
	public String getBb_product() {
		return bb_product;
	}
	public void setBb_product(String bb_product) {
		this.bb_product = bb_product;
	}
}
