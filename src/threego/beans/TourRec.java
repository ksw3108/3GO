package threego.beans;

public class TourRec {
	private String t_name;
	private String t_addr;
	private String t_tel;
	private String t_usetime;
	private String t_holiday;
	private String t_leadtime;
	private String t_outline;
	private int t_price;
	private String t_parking;
	private int t_rank;
	private String board_kind;
	private String site_addr;
	private int t_no;
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
	public int getT_no() {
		return t_no;
	}
	public void setT_no(int t_no) {
		this.t_no = t_no;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_addr() {
		return t_addr;
	}
	public void setT_addr(String t_addr) {
		this.t_addr = t_addr;
	}
	public String getT_tel() {
		return t_tel;
	}
	public void setT_tel(String t_tel) {
		this.t_tel = t_tel;
	}
	public String getT_usetime() {
		return t_usetime;
	}
	public void setT_usetime(String t_usetime) {
		this.t_usetime = t_usetime;
	}
	public String getT_holiday() {
		return t_holiday;
	}
	public void setT_holiday(String t_holiday) {
		this.t_holiday = t_holiday;
	}
	public String getT_leadtime() {
		return t_leadtime;
	}
	public void setT_leadtime(String t_leadtime) {
		this.t_leadtime = t_leadtime;
	}
	public String getT_outline() {
		return t_outline;
	}
	public void setT_outline(String t_outline) {
		this.t_outline = t_outline;
	}
	public int getT_price() {
		return t_price;
	}
	public void setT_price(int t_price) {
		this.t_price = t_price;
	}
	public String getT_parking() {
		return t_parking;
	}
	public void setT_parking(String t_parking) {
		this.t_parking = t_parking;
	}
	public int getT_rank() {
		return t_rank;
	}
	public void setT_rank(int t_rank) {
		this.t_rank = t_rank;
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
