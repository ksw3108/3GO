package food.model;

public class FoodBean {

	private int c_no;
	private int cr_no;
	private String c_name;
	private String c_addr;
	private String c_tel;
	private String c_parking;
	private String c_usetime;
	private String c_rank;
	private String c_kind;
	private int likes;
	private long timestamp;
	
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_addr() {
		return c_addr;
	}

	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}

	public String getC_tel() {
		return c_tel;
	}

	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}

	public String getC_parking() {
		return c_parking;
	}

	public void setC_parking(String c_parking) {
		this.c_parking = c_parking;
	}

	public String getC_usetime() {
		return c_usetime;
	}

	public void setC_usetime(String c_usetime) {
		this.c_usetime = c_usetime;
	}

	public String getC_rank() {
		return c_rank;
	}

	public void setC_rank(String c_rank) {
		this.c_rank = c_rank;
	}

	public String getC_kind() {
		return c_kind;
	}

	public void setC_kind(String c_kind) {
		this.c_kind = c_kind;
	}

}
