package meeting.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MeetingDao {
	private static MeetingDao instance;
	private Connection conn;
	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@61.81.98.221:1521:sds3";
	private static final String dbUser = "banana";
	private static final String dbPass = "pass";
	
	public static MeetingDao getInstance()throws Exception{
		if(instance==null){
			instance = new MeetingDao();
		}
		return instance;		
	}
	private MeetingDao() throws Exception {
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			throw new Exception("DB연결시 오류 : " + e.toString());
		}
	}
	
	public List<MeetingBean> reply(String group_no)throws Exception{
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		List<MeetingBean> list = new ArrayList<MeetingBean>();
		boolean isEmpty = true;
		
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select * from meet_board where group_no="+group_no
					+" order by seq_no desc";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				MeetingBean temp = new MeetingBean();
				temp.setm_board_no(rs.getInt("m_board_no"));
				temp.setB_r_k_no(rs.getInt("B_R_K_NO"));
				temp.setGroup_no(rs.getInt("GROUP_NO"));
				temp.setm_board_date(rs.getString("m_board_date"));
				temp.setSeq_no(rs.getString("SEQ_NO"));
				temp.setm_board_count(rs.getInt("m_board_count"));
				temp.setm_board_pass(rs.getString("m_board_pass"));
				temp.setm_board_content(rs.getString("m_board_content"));
				temp.setM_no(rs.getInt("M_NO"));
				temp.setm_board_title(rs.getString("m_board_title"));
				temp.setm_board_final_update(rs.getString("m_board_final_update"));				
				
				list.add(temp);
				isEmpty=false;
			}
			if (isEmpty)
				return Collections.emptyList();
			
			return list;
			
		}catch (Exception e) {
			throw new Exception("리뷰 ) DB에 댓글 일부 행 목록 검색시 오류  : " + e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {	}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {	}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException ex) {	}
			}
		}	
		
	}
	
	//리뷰 검색/ 페이지 단위로
	public List<MeetingBean> review(int b_r_k_no, int firstRow, int lastRow, int t_no, int s_no, int c_no) throws Exception{
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql=null;
		List<MeetingBean> list = new ArrayList<MeetingBean>();
		boolean isEmpty=true;
		boolean isBoard=true;
		
		
		/*System.out.println(b_r_k_no+","+ firstRow+","+ lastRow+","+ t_no+","+ s_no+","+ c_no);*/
		
		try{
			conn = DriverManager.getConnection(dbUrl,dbUser, dbPass);
			
			
			sql = "select b.m_board_no B_NO, b.b_r_k_no B_BRK_NO, b.group_no GROUP_NO, b.m_board_date B_DATE,"
					+ " b.seq_no B_SEQ_NO, b.m_board_count B_COUNT, b.m_board_pass B_PASSWORD, b.m_board_content B_CONTENT, b.m_no M_NO,"
					+ " b.m_board_title B_TITLE, m_board_final_update B_FINAL_UPDATE"
					+ " from meet_board b, member m, board_reply_kind brk"
					+ " where b.m_no=m.m_no and brk.b_r_k_no=b.b_r_k_no and "
					/*+ "		r.r_no=(select r.r_no"
					+ "					from review r, tour t, stay s, cook c"
					+ "						where r.t_no=t.t_no and r.s_no=s.s_no and r.c_no=c.c_no and"
					+ "						r.t_no= ? and r.s_no = ? and r.c_no= ?) and "*/
					+ " b.b_r_k_no=1 and "
					+ " b.m_board_no in"
					+ "	(select m_board_no from (select m_board_no, rownum as rnum "
					+ "			from (select m_board_no from meet_board order by seq_no desc) )"
					+ "			where rnum>=? and rnum<=?)"
					+ " order by b.seq_no desc";
			/*System.out.println(sql);*/
			
			ps = conn.prepareStatement(sql);
		/*	ps.setInt(1, t_no);
			ps.setInt(2, s_no);
			ps.setInt(3, c_no);*/
			ps.setInt(1, firstRow);
			ps.setInt(2, lastRow);
			rs = ps.executeQuery();
			
			while(rs.next()){
				MeetingBean temp = new MeetingBean();
				temp.setm_board_no(rs.getInt("B_NO"));
				temp.setB_r_k_no(rs.getInt("B_BRK_NO"));
				temp.setGroup_no(rs.getInt("GROUP_NO"));
				temp.setm_board_date(rs.getString("B_DATE"));
				temp.setSeq_no(rs.getString("B_SEQ_NO"));
				temp.setm_board_count(rs.getInt("B_COUNT"));
				temp.setm_board_pass(rs.getString("B_PASSWORD"));
				temp.setm_board_content(rs.getString("B_CONTENT"));
				temp.setM_no(rs.getInt("M_NO"));
				temp.setm_board_title(rs.getString("B_TITLE"));
				temp.setm_board_final_update(rs.getString("B_FINAL_UPDATE"));
				
				list.add(temp);
				isEmpty=false;
			}
			if (isEmpty)
				return Collections.emptyList();
			
			return list;
		}catch (Exception e) {
			throw new Exception("리뷰 ) DB에 리뷰 일부 행 목록 검색시 오류  : " + e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {	}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {	}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException ex) {	}
			}
		}	
		
	}
	public MeetingBean selectById(int parentId) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		MeetingBean rec = new MeetingBean();
		
		try{
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);
			String sql = "select * from meet_board where m_board_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, parentId);
			rs= ps.executeQuery();
			
			while(rs.next()){
				rec.setm_board_no(rs.getInt("m_board_no"));
				rec.setB_r_k_no(rs.getInt("B_R_K_NO"));
				rec.setGroup_no(rs.getInt("GROUP_NO"));
				rec.setm_board_date(rs.getString("m_board_date"));
				rec.setSeq_no(rs.getString("SEQ_NO"));
				rec.setm_board_count(rs.getInt("m_board_count"));
				rec.setm_board_pass(rs.getString("m_board_pass"));
				rec.setm_board_content(rs.getString("m_board_content"));
				rec.setM_no(rs.getInt("M_NO"));
				rec.setm_board_title(rs.getString("m_board_title"));
				rec.setm_board_final_update(rs.getString("m_board_final_update"));
			}
			
			return rec;
		}catch( Exception ex ){
			throw new Exception("리뷰 ) DB에 글번호에 의한 레코드 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
	}
	public int insert(MeetingBean rec) throws Exception {
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		/*System.out.println(rec.getm_board_content());
		System.out.println(rec.getM_no());
		System.out.println(rec.getm_board_no());*/
		
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql="insert into meet_board(m_board_no, b_r_k_no, group_no, m_board_date, seq_no,"
					+ " m_board_count, m_board_pass, m_board_content, m_no, m_board_title, m_board_final_update)"
					+ " values(seq_m_b_no.nextVal, ?,?, sysdate, ?, 0, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
		
			ps.setInt(1, rec.getB_r_k_no());
			ps.setInt(2, rec.getGroup_no());
			ps.setString(3, rec.getSeq_no());
			ps.setString(4, rec.getm_board_pass());
			ps.setString(5, rec.getm_board_content());
			ps.setInt(6, rec.getM_no());
			ps.setString(7, rec.getm_board_title());			
			
			int insertedCount = ps.executeUpdate();		
			
			if(insertedCount>0){
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select seq_m_b_no.currVal from dual");
				while(rs.next()){
					return rs.getInt(1);
				}
			}
			
			return -1;
		
		}catch( Exception ex ){
			throw new Exception("게시판 ) 댓글 입력시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
	}
	public String selectLastSequenceNumber(String maxSeqNum, String minSeqNum) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;

		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select min(seq_no) as minseq from meet_board where seq_no<? and seq_no>=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, maxSeqNum);
			ps.setString(2, minSeqNum);
			rs = ps.executeQuery();
			if(!rs.next()){
				return null;
			}

			return rs.getString("minseq");	// 나중에 검색한 값을 리턴
		}catch( Exception ex ){
			throw new Exception("게시판 ) 부모와 연관된 자식 레코드 중 마지막 순서번호 얻어오기  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
	}
	public int getGroupId() throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int groupId=1;
		try{//그룹번호에 이용할 시퀀스의 현재 카운트 번호 추출
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select seq_group_no.nextVal as group_seq from dual";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				groupId = rs.getInt("group_seq");
			}
			
			return groupId;
		}catch( Exception ex ){
			throw new Exception("게시판 ) 게시글 입력 전에 그룹번호 얻어올 때  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
	}
	
	public int totalRecordCount(int b_r_k_no, int t_no, int s_no, int c_no) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{//count(*)
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "select * from meet_board where b_r_k_no="+b_r_k_no;
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			int cnt=0;
			while(rs.next()){
				cnt++;
			}
			return cnt;//rs.getInt("cnt");
		}catch( Exception ex ){
			throw new Exception("리뷰 ) 전체 레코드 가져오기 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
	}
	public void increaseReadCount(int b_no) throws Exception {
		PreparedStatement ps = null;
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "update meet_board set m_board_count=m_board_count+1 where m_board_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_no);
			ps.executeUpdate();
				
		}catch( Exception ex ){
			throw new Exception("리뷰 ) 게시글 볼 때 조회수 증가시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
		
	}
	public int update(MeetingBean rec) throws Exception  {
		PreparedStatement ps = null;
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql="update meet_board set m_board_content=?, m_board_title=? where m_board_no=? and m_board_pass=?";
			ps = conn.prepareStatement(sql);
			
			System.out.println(rec.getm_board_pass());
			System.out.println(rec.getm_board_no());
			
			ps.setString(1, rec.getm_board_content());
			ps.setString(2, rec.getm_board_title());
			ps.setInt(3, rec.getm_board_no());
			ps.setString(4, rec.getm_board_pass());
			
			int count = ps.executeUpdate();


			return count; // 나중에 수정된 수를 리턴하시오.
		
		}catch( Exception ex ){
			throw new Exception("리뷰 ) 리뷰 수정시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
	}
	public int delete(int b_no, String password) throws Exception {
		PreparedStatement ps = null;
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "delete from meet_board where m_board_no=? and m_board_pass=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_no);
			ps.setString(2, password);
			int cnt = ps.executeUpdate();

			return cnt; // 나중에 수정된 수를 리턴하시오.
		
		}catch( Exception ex ){
			throw new Exception("리뷰 ) 리뷰 삭제시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
	}
	
	public int findMemberNo(String id) throws Exception {
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		try{
			int m_no=0;
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select m_no from member where m_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next())
				m_no=rs.getInt("M_NO");			
			return m_no;
		}catch(Exception e){
			throw new Exception("리뷰 ) 회원 번호 찾기 오류  : " + e.toString() );	
		}finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}
				
	}
/*	public void insertReviewKindNo(int kinds, int m_board_no) throws Exception {
		PreparedStatement ps = null;
		
		try{
			System.out.println(kinds);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "insert into review(r_no, m_board_no, t_no, s_no, c_no)"
					+ " values(seq_r_no.nextVal, "+m_board_no+", ?,?,?)";
			
			ps = conn.prepareStatement(sql);
			switch(kinds){
				case 1: //여행지면
					ps.setInt(1, 1);
					ps.setInt(2, 0);
					ps.setInt(3, 0);
				break;
				case 2: //숙박지면
					ps.setInt(1, 0);
					ps.setInt(2, 1);
					ps.setInt(3, 0);
				break;
				case 3: //맛집이면
					ps.setInt(1, 0);
					ps.setInt(2, 0);
					ps.setInt(3, 1);
				break;				
			}
			
			ps.executeUpdate();
			
		}catch(Exception e){
			throw new Exception("리뷰 ) review 테이블 입력시 오류  : " + e.toString() );	
		}finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}	
		
	}*/
	public String selectId(int m_no) throws Exception {
		PreparedStatement ps=null;
		ResultSet rs = null;
		String id = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select m_id from member where m_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, m_no);
			rs = ps.executeQuery();
			while(rs.next()){
				id = rs.getString("M_ID");
			}
			return id;
		}catch(Exception e){
			throw new Exception("리뷰 ) 아이디 검색시 오류  : " + e.toString() );	
		}finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}		
	}
	public int replyCount(int group_no) throws Exception{
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select * from meet_board where group_no="+group_no+" and b_r_k_no=2";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int count = 0;
			while(rs.next()){
				count++;
			}
			return count;
		}catch(Exception e){
			throw new Exception("리뷰 ) 리플 갯수 계산시 오류  : " + e.toString() );	
		}finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}		
	}
}
