package threego.beans;

public class FoodRec {
	private String c_name; // 이름
	private String c_addr; // 주소
	private String c_tel;   // 전화
	private String c_parking; // 주차
	private String c_usetime;  // 이용시간
	private int c_rank;  // 조회수
	private String c_kind;  // 종류
	private int f_no;
	private String image;
	private int likes;
	private long timestamp;
	private String key;
	
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
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
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
	public int getC_rank() {
		return c_rank;
	}
	public void setC_rank(int c_rank) {
		this.c_rank = c_rank;
	}
	public String getC_kind() {
		return c_kind;
	}
	public void setC_kind(String c_kind) {
		this.c_kind = c_kind;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
}
