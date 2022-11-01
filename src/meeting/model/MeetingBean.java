package meeting.model;

public class MeetingBean {
	private int m_board_no;
	private int b_r_k_no;
	private int group_no;
	private String m_board_date;
	private String seq_no;
	private int m_board_count;
	private String m_board_pass;
	private String m_board_content;
	private int m_no;
	private String m_board_title;
	private String m_board_final_update;
	
	public String getm_board_title() {
		return m_board_title;
	}
	public void setm_board_title(String m_board_title) {
		this.m_board_title = m_board_title;
	}
	public String getm_board_final_update() {
		return m_board_final_update;
	}
	public void setm_board_final_update(String m_board_final_update) {
		this.m_board_final_update = m_board_final_update;
	}
	public int getm_board_no() {
		return m_board_no;
	}
	public void setm_board_no(int m_board_no) {
		this.m_board_no = m_board_no;
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
	public String getm_board_date() {
		return m_board_date;
	}
	public void setm_board_date(String m_board_date) {
		this.m_board_date = m_board_date;
	}
	public String getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(String seq_no) {
		this.seq_no = seq_no;
	}
	public int getm_board_count() {
		return m_board_count;
	}
	public void setm_board_count(int m_board_count) {
		this.m_board_count = m_board_count;
	}
	public String getm_board_pass() {
		return m_board_pass;
	}
	public void setm_board_pass(String m_board_pass) {
		this.m_board_pass = m_board_pass;
	}
	public String getm_board_content() {
		return m_board_content;
	}
	public void setm_board_content(String m_board_content) {
		this.m_board_content = m_board_content;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
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
}
