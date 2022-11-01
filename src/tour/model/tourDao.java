package tour.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class tourDao {
	private static tourDao instance;
	private Connection conn;

	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@61.81.98.230:1521:sds3";
	private static final String dbUser = "project";
	private static final String dbPass = "pass";

	// 객체 생성 메소드
	public static tourDao getInstance() throws Exception {
		if (instance == null) {
			instance = new tourDao();
		}
		return instance;
	}

	private tourDao() throws Exception {
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			throw new Exception("DB연결시 오류 : " + e.toString());
		}
	}
	
	
	
	//여행지 원하는 1행만 추출
	public TourBean selectTour(int t_no) throws Exception{
		PreparedStatement ps = null;
		ResultSet rs = null;		
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select * from tour where t_no="+t_no;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			TourBean temp = new TourBean();
			while (rs.next()) {
				temp.setT_no(rs.getInt("T_NO"));
				temp.setT_name(rs.getString("T_NAME"));
				temp.setT_addr(rs.getString("T_ADDR"));
				temp.setT_tel(rs.getString("T_TEL"));
				temp.setT_usetime(rs.getString("T_USETIME"));
				temp.setT_holliday(rs.getString("T_HOLLIDAY"));
				temp.setT_leadtime(rs.getString("T_LEADTIME"));
				temp.setT_outline(rs.getString("T_OUTLINE"));
				temp.setT_price(rs.getInt("T_PRICE"));
				temp.setT_parking(rs.getString("T_PARKING"));
				temp.setT_rank(rs.getString("T_RANK"));
				temp.setBoard_kind(rs.getString("BOARD_KIND"));
				temp.setSite_addr(rs.getString("SITE_ADDR"));
			}
			
			return temp;

		} catch (Exception e) {
			throw new Exception("여행지 ) DB서 목록 검색시 오류  : " + e.toString());
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
	

	// 여행지 전체 추출
	public List<TourBean> selectTourList() throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<TourBean> tList = new ArrayList<TourBean>();
		boolean isEmpty = true;

		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "select * from tour";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				TourBean temp = new TourBean();

				temp.setT_no(rs.getInt("T_NO"));
				temp.setT_name(rs.getString("T_NAME"));
				temp.setT_addr(rs.getString("T_ADDR"));
				temp.setT_tel(rs.getString("T_TEL"));
				temp.setT_usetime(rs.getString("T_USETIME"));
				temp.setT_holliday(rs.getString("T_HOLLIDAY"));
				temp.setT_leadtime(rs.getString("T_LEADTIME"));
				temp.setT_outline(rs.getString("T_OUTLINE"));
				temp.setT_price(rs.getInt("T_PRICE"));
				temp.setT_parking(rs.getString("T_PARKING"));
				temp.setT_rank(rs.getString("T_RANK"));
				temp.setBoard_kind(rs.getString("BOARD_KIND"));
				temp.setSite_addr(rs.getString("SITE_ADDR"));

				tList.add(temp);
				isEmpty = false;
			}
			if (isEmpty)
				return Collections.emptyList();
			return tList;

		} catch (Exception e) {
			throw new Exception("여행지 ) DB에 전체 목록 검색시 오류  : " + e.toString());
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
	
	//여행지 순차 정렬 =>오버라이딩
	public List<TourBean> selectTourList(int num) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		List<TourBean> tList = new ArrayList<TourBean>();
		boolean isEmpty = true;

		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			if(num==1){ //1이면 조회수순 정렬			
				sql = "select * from tour"
					+ " order by t_rank desc";
			}else if(num==2){//2면 최신순 정렬
				sql = "select * from tour "
					+ " order by t_update_date";
			}
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				TourBean temp = new TourBean();

				temp.setT_no(rs.getInt("T_NO"));
				temp.setT_name(rs.getString("T_NAME"));
				temp.setT_addr(rs.getString("T_ADDR"));
				temp.setT_tel(rs.getString("T_TEL"));
				temp.setT_usetime(rs.getString("T_USETIME"));
				temp.setT_holliday(rs.getString("T_HOLLIDAY"));
				temp.setT_leadtime(rs.getString("T_LEADTIME"));
				temp.setT_outline(rs.getString("T_OUTLINE"));
				temp.setT_price(rs.getInt("T_PRICE"));
				temp.setT_parking(rs.getString("T_PARKING"));
				temp.setT_rank(rs.getString("T_RANK"));
				temp.setBoard_kind(rs.getString("BOARD_KIND"));
				temp.setSite_addr(rs.getString("SITE_ADDR"));

				tList.add(temp);
				isEmpty = false;
			}
			if (isEmpty)
				return Collections.emptyList();
			return tList;

		} catch (Exception e) {
			throw new Exception("여행지 ) DB에 순차 목록 검색시 오류  : " + e.toString());
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

	// 관리자)여행지 입력
	public void tourInsert(TourBean tour) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "insert into tour(t_no, tc_no, t_name, t_addr, t_tel, "
					+ "t_usetime, t_holliday, t_leadtime, t_outline, t_price,"
					+ "t_parking, t_rank, board_kind, site_addr)"
					+ " values(seq_t_no.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, tour.getTc_no());
			ps.setString(2, tour.getT_name());
			ps.setString(3, tour.getT_addr());
			ps.setString(4, tour.getT_tel());
			ps.setString(5, tour.getT_usetime());
			ps.setString(6, tour.getT_holliday());
			ps.setString(7, tour.getT_leadtime());
			ps.setString(8, tour.getT_outline());
			ps.setInt(9, tour.getT_price());
			ps.setString(10, tour.getT_parking());
			ps.setString(11, tour.getT_rank());
			ps.setString(12, tour.getBoard_kind());
			ps.setString(13, tour.getSite_addr());

			ps.executeUpdate();

		} catch (Exception e) {
			throw new Exception("여행지)DB에 입력시 오류 : " + e.toString());
		} finally {
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

	// 관리자)여행지 수정
	public int tourUpdate(TourBean tour) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "update tour set tc_no=?, t_name=?, t_addr=?, t_tel=?, "
					+ "t_usetime=?, t_holliday=?, t_leadtime=?, t_outline=?, t_price=?,"
					+ "t_parking=?, t_rank=?, board_kind=?, site_addr=?" + " where t_no=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, tour.getTc_no());
			ps.setString(2, tour.getT_name());
			ps.setString(3, tour.getT_addr());
			ps.setString(4, tour.getT_tel());
			ps.setString(5, tour.getT_usetime());
			ps.setString(6, tour.getT_holliday());
			ps.setString(7, tour.getT_leadtime());
			ps.setString(8, tour.getT_outline());
			ps.setInt(9, tour.getT_price());
			ps.setString(10, tour.getT_parking());
			ps.setString(11, tour.getT_rank());
			ps.setString(12, tour.getBoard_kind());
			ps.setString(13, tour.getSite_addr());
			ps.setInt(14, tour.getT_no());

			int cnt = ps.executeUpdate();
			return cnt;
		} catch (Exception e) {
			throw new Exception("여행지)DB에 수정시 오류 : " + e.toString());
		} finally {
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

	// 관리자)여행지 삭제
	public int tourDelete(int t_no) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "delete tour where t_no=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, t_no);
			int cnt = ps.executeUpdate();
			return cnt;
		} catch (Exception e) {
			throw new Exception("여행지)DB에 삭제시 오류 : " + e.toString());
		} finally {
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
}
