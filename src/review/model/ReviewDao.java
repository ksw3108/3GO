package review.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import review.model.ReviewBean;

public class ReviewDao {
	private static ReviewDao instance;
	private Connection conn;
	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@61.81.98.221:1521:sds3";
	private static final String dbUser = "banana";
	private static final String dbPass = "pass";
	
	public static ReviewDao getInstance()throws Exception{
		if(instance==null){
			instance = new ReviewDao();
		}
		return instance;		
	}
	private ReviewDao() throws Exception {
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			throw new Exception("DB연결시 오류 : " + e.toString());
		}
	}
	
	public List<ReviewBean> reply(String group_no)throws Exception{
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		List<ReviewBean> list = new ArrayList<ReviewBean>();
		boolean isEmpty = true;
		
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "select * from board where group_no="+group_no
					+" order by seq_no desc";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				ReviewBean temp = new ReviewBean();
				temp.setB_no(rs.getInt("B_NO"));
				temp.setB_no(rs.getInt("B_NO"));
				temp.setB_r_k_no(rs.getInt("B_R_K_NO"));
				temp.setGroup_no(rs.getInt("GROUP_NO"));
				temp.setB_date(rs.getString("B_DATE"));
				temp.setSeq_no(rs.getString("SEQ_NO"));
				temp.setB_count(rs.getInt("B_COUNT"));
				temp.setB_password(rs.getString("B_PASSWORD"));
				temp.setB_content(rs.getString("B_CONTENT"));
				temp.setM_no(rs.getInt("M_NO"));
				temp.setB_title(rs.getString("B_TITLE"));
				temp.setB_final_update(rs.getString("B_FINAL_UPDATE"));
				temp.setB_file1(rs.getString("B_FILE1"));
				temp.setB_file2(rs.getString("B_FILE2"));
				temp.setB_file3(rs.getString("B_FILE3"));
				
				
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
	public List<ReviewBean> review(int b_r_k_no, int firstRow, int lastRow, int t_no, int s_no, int c_no) throws Exception{
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql=null;
		List<ReviewBean> list = new ArrayList<ReviewBean>();
		boolean isEmpty=true;
		boolean isBoard=true;
		
		
		System.out.println(b_r_k_no+","+ firstRow+","+ lastRow+","+ t_no+","+ s_no+","+ c_no);
		
		try{
			conn = DriverManager.getConnection(dbUrl,dbUser, dbPass);
			
			
			sql = "select b.b_no B_NO, b.b_r_k_no B_BRK_NO, b.group_no GROUP_NO, b.b_date B_DATE,"
					+ " b.seq_no B_SEQ_NO, b.b_count B_COUNT, b.b_password B_PASSWORD, b.b_content B_CONTENT, b.m_no M_NO,"
					+ " b.b_title B_TITLE, b_final_update B_FINAL_UPDATE"
					+ " from board b, review r, member m, board_reply_kind brk"
					+ " where b.m_no=m.m_no and b.b_no=r.b_no and brk.b_r_k_no=b.b_r_k_no and "					
					+ " b.b_r_k_no=1 and "
					+ " b.b_no in"
					+ "	(select b_no from (select b_no, rownum as rnum "
					+ "			from (select b_no from board order by seq_no desc) )"
					+ "			where rnum>=? and rnum<=?)"
					+ " order by b.seq_no desc";
			
			
			ps = conn.prepareStatement(sql);
		
			ps.setInt(1, firstRow);
			ps.setInt(2, lastRow);
			rs = ps.executeQuery();
			
			while(rs.next()){
				ReviewBean temp = new ReviewBean();
				temp.setB_no(rs.getInt("B_NO"));
				temp.setB_r_k_no(rs.getInt("B_BRK_NO"));
				temp.setGroup_no(rs.getInt("GROUP_NO"));
				temp.setB_date(rs.getString("B_DATE"));
				temp.setSeq_no(rs.getString("B_SEQ_NO"));
				temp.setB_count(rs.getInt("B_COUNT"));
				temp.setB_password(rs.getString("B_PASSWORD"));
				temp.setB_content(rs.getString("B_CONTENT"));
				temp.setM_no(rs.getInt("M_NO"));
				temp.setB_title(rs.getString("B_TITLE"));
				temp.setB_final_update(rs.getString("B_FINAL_UPDATE"));
				
				
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
	public ReviewBean selectById(int parentId) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ReviewBean rec = new ReviewBean();
		
		try{
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);
			String sql = "select * from board where b_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, parentId);
			rs= ps.executeQuery();
			
			while(rs.next()){
				rec.setB_no(rs.getInt("B_NO"));
				rec.setB_r_k_no(rs.getInt("B_R_K_NO"));
				rec.setGroup_no(rs.getInt("GROUP_NO"));
				rec.setB_date(rs.getString("B_DATE"));
				rec.setSeq_no(rs.getString("SEQ_NO"));
				rec.setB_count(rs.getInt("B_COUNT"));
				rec.setB_password(rs.getString("B_PASSWORD"));
				rec.setB_content(rs.getString("B_CONTENT"));
				rec.setM_no(rs.getInt("M_NO"));
				rec.setB_title(rs.getString("B_TITLE"));
				rec.setB_final_update(rs.getString("B_FINAL_UPDATE"));
				rec.setB_file1(rs.getString("B_FILE1"));
				rec.setB_file2(rs.getString("B_FILE2"));
				rec.setB_file3(rs.getString("B_FILE3"));
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
	public int insert(ReviewBean rec) throws Exception {
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		System.out.println(rec.getB_content());
		System.out.println(rec.getM_no());
		System.out.println(rec.getB_no());
		
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql="insert into board(b_no, b_r_k_no, group_no, b_date, seq_no,"
					+ " b_count, b_password, b_content, m_no, b_title, b_final_update,"
					+ " b_file1, b_file2, b_file3)"
					+ " values(seq_b_no.nextVal, ?,?, sysdate, ?, 0, ?, ?, ?, ?, sysdate,?,?,?)";
			ps = conn.prepareStatement(sql);
		
			ps.setInt(1, rec.getB_r_k_no());
			ps.setInt(2, rec.getGroup_no());
			ps.setString(3, rec.getSeq_no());
			ps.setString(4, rec.getB_password());
			ps.setString(5, rec.getB_content());
			ps.setInt(6, rec.getM_no());
			ps.setString(7, rec.getB_title());
			ps.setString(8, rec.getB_file1());
			ps.setString(9, rec.getB_file2());
			ps.setString(10, rec.getB_file3());
			
			
			int insertedCount = ps.executeUpdate();		
			
			if(insertedCount>0){
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select seq_b_no.currVal from dual");
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
	public boolean isnertComment(ReviewBean rec) throws Exception {
		PreparedStatement ps = null;

		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "insert into board(b_no, b_r_k_no, group_no, b_date, seq_no,"
					+ " b_count, b_password, b_content, m_no, b_title, b_final_update,"
					+ " b_file1, b_file2, b_file3)"
					+ " values(seq_b_no.nextVal, ?,?, sysdate, ?, 0, ?, ?, ?, ?, sysdate,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rec.getB_r_k_no());
			ps.setInt(2, rec.getGroup_no());
			ps.setString(3, rec.getSeq_no());
			ps.setString(4, rec.getB_password());
			ps.setString(5, rec.getB_content());
			ps.setInt(6, rec.getM_no());
			ps.setString(7, rec.getB_title());
			ps.setString(8, rec.getB_file1());
			ps.setString(9, rec.getB_file2());
			ps.setString(10, rec.getB_file3());

			int count = ps.executeUpdate();
			
			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			throw new Exception("댓글  DB에 입력시 오류  : " + ex.toString());
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			}
		}
	}
	
	public String selectLastSequenceNumber(String maxSeqNum, String minSeqNum) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;

		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select min(seq_no) as minseq from board where seq_no<? and seq_no>=?";
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
			
			String sql = "select * from board where b_r_k_no=1";
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
			String sql = "update board set b_count=b_count+1 where b_no=?";
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
	public int update(ReviewBean rec) throws Exception  {
		PreparedStatement ps = null;
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql="update board set b_content=?, ";
			ps = conn.prepareStatement(sql);
			
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
			String sql = "delete from board where b_no=? and b_password=?";
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
	public void insertReviewKindNo(int kinds, int b_no) throws Exception {
		PreparedStatement ps = null;
		
		try{
			System.out.println(kinds);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "insert into review(r_no, b_no, t_no, s_no, f_no)"
					+ " values(seq_r_no.nextVal, "+b_no+", ?,?,?)";
			
			ps = conn.prepareStatement(sql);
			switch(kinds){
				case 1: //여행지면
					ps.setInt(1, 0);
					ps.setInt(2, 0);
					ps.setInt(3, 0);
				break;
				case 2: //숙박지면
					ps.setInt(1, 0);
					ps.setInt(2, 0);
					ps.setInt(3, 0);
				break;
				case 3: //맛집이면
					ps.setInt(1, 0);
					ps.setInt(2, 0);
					ps.setInt(3, 0);
				break;				
			}
			
			ps.executeUpdate();
			
		}catch(Exception e){
			throw new Exception("리뷰 ) review 테이블 입력시 오류  : " + e.toString() );	
		}finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}	
		
	}
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
	public int getReplyCount(int group_no)throws Exception {
		PreparedStatement ps=null;
		ResultSet rs = null;
		String id = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select * from board where group_no="+group_no+"and b_r_k_no=2";
			ps = conn.prepareStatement(sql);
			int count=0;
			rs = ps.executeQuery();
			while(rs.next()){
				count++;
			}
			return count;
		}catch(Exception e){
			throw new Exception("리뷰 ) 리플 갯수 검색시 오류  : " + e.toString() );	
		}finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( conn  != null ) { try{ conn.close(); } catch(SQLException ex){} }
		}		
	}
	
}
