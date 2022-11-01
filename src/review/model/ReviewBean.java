package review.model;

public class ReviewBean {
	private int b_no;
	private int b_r_k_no;
	private int group_no;
	private String b_date;
	private String seq_no;
	private int b_count;
	private String b_password;
	private String b_content;
	private int m_no;
	private String b_title;
	private String b_final_update;
	
	private String b_file1;
	private String b_file2;
	private String b_file3;
	
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_final_update() {
		return b_final_update;
	}
	public void setB_final_update(String b_final_update) {
		this.b_final_update = b_final_update;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getB_r_k_no() {
		return b_r_k_no;
	}
	public void setB_r_k_no(int b_r_k_no) {
		this.b_r_k_no = b_r_k_no;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(String seq_no) {
		this.seq_no = seq_no;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_password() {
		return b_password;
	}
	public void setB_password(String b_password) {
		this.b_password = b_password;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	
	public String getB_file1() {
		return b_file1;
	}
	public void setB_file1(String b_file1) {
		this.b_file1 = b_file1;
	}
	public String getB_file2() {
		return b_file2;
	}
	public void setB_file2(String b_file2) {
		this.b_file2 = b_file2;
	}
	public String getB_file3() {
		return b_file3;
	}
	public void setB_file3(String b_file3) {
		this.b_file3 = b_file3;
	}
	
	public int getLevel()
	{
		if( seq_no == null			)	{ return -1; }
		if( seq_no.length() != 16 	) 	{ return -1; }
		if( seq_no.endsWith("999999")) 	{ return 0; }
		if( seq_no.endsWith("9999")	) 	{ return 1; }
		if( seq_no.endsWith("99")	) 	{ return 2; }
		return 3;
	}
	public void setB_no(boolean b_no2) {
		// TODO Auto-generated method stub
		
	}
	
}
