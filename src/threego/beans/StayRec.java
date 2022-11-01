package threego.beans;

public class StayRec {
	private String s_name;
	private String s_addr;
	private String s_tel;
	private String s_usetime;
	private String s_holiday;
	private int s_price;
	private String s_parking;
	private int s_rank;
	private String board_kind;
	private String site_addr;
	private int s_no;
	private String image;
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
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_addr() {
		return s_addr;
	}
	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_usetime() {
		return s_usetime;
	}
	public void setS_usetime(String s_usetime) {
		this.s_usetime = s_usetime;
	}
	public String getS_holiday() {
		return s_holiday;
	}
	public void setS_holiday(String s_holiday) {
		this.s_holiday = s_holiday;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_parking() {
		return s_parking;
	}
	public void setS_parking(String s_parking) {
		this.s_parking = s_parking;
	}
	public int getS_rank() {
		return s_rank;
	}
	public void setS_rank(int s_rank) {
		this.s_rank = s_rank;
	}
	public String getBoard_kind() {
		return board_kind;
	}
	public void setBoard_kind(String board_kind) {
		this.board_kind = board_kind;
	}
	public String getSite_addr() {
		return site_addr;
	}
	public void setSite_addr(String site_addr) {
		this.site_addr = site_addr;
	}
}
