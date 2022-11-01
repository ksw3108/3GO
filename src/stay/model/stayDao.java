package stay.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class stayDao {
	private static stayDao instance;
	private Connection conn;

	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@61.81.98.230:1521:sds3";
	private static final String dbUser = "project";
	private static final String dbPass = "pass";

	// 객체 생성 메소드
	public static stayDao getInstance() throws Exception {
		if (instance == null) {
			instance = new stayDao();
		}
		return instance;
	}

	private stayDao() throws Exception {
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			throw new Exception("DB연결시 오류 : " + e.toString());
		}
	}

	// 숙박지 전체 추출
	public List<StayBean> selectStayList() throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<StayBean> sList = new ArrayList<StayBean>();
		boolean isEmpty = true;

		try {
			String sql = "select * from stay";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				StayBean temp = new StayBean();

				temp.setS_no(rs.getInt("S_NO"));
				temp.setAr_no(rs.getInt("AR_NO"));
				temp.setS_name(rs.getString("S_NAME"));
				temp.setS_addr(rs.getString("S_ADDR"));
				temp.setS_tel(rs.getString("S_TEL"));
				temp.setS_usetime(rs.getString("S_USETIME"));
				temp.setS_holliday(rs.getString("T_HOLLIDAY"));
				temp.setS_leadtime(rs.getString("T_LEADTIME"));
				temp.setS_outline(rs.getString("T_OUTLINE"));
				temp.setS_price(rs.getInt("S_PRICE"));
				temp.setS_parking(rs.getString("T_PARKING"));
				temp.setS_rank(rs.getString("S_RANK"));
				temp.setBoard_kind(rs.getString("BOARD_KIND"));
				temp.setSite_addr(rs.getString("SITE_ADDR"));

				sList.add(temp);
				isEmpty = false;
			}

			if (isEmpty)
				return Collections.emptyList();
			return sList;
		} catch (Exception e) {
			throw new Exception("숙박지 ) DB에 전체 목록 검색시 오류  : " + e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
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

	// 관리자)숙박지 입력
	public void stayInsert(StayBean stay) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "insert into stay(s_no, ar_no, s_name, s_addr, s_tel, s_usetime, s_holliday, s_leadtime,"
					+ " s_outline, s_price, s_parking, s_rank, s_mainmenu, board_kind, site_addr) "
					+ " values(seq_s_no.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);

			ps.setInt(1, stay.getAr_no());
			ps.setString(2, stay.getS_name());
			ps.setString(3, stay.getS_addr());
			ps.setString(4, stay.getS_tel());
			ps.setString(5, stay.getS_usetime());
			ps.setString(6, stay.getS_holliday());
			ps.setString(7, stay.getS_leadtime());
			ps.setString(8, stay.getS_outline());
			ps.setInt(9, stay.getS_price());
			ps.setString(10, stay.getS_parking());
			ps.setString(11, stay.getS_rank());
			ps.setString(12, stay.getS_mainmenu());
			ps.setString(13, stay.getBoard_kind());
			ps.setString(14, stay.getSite_addr());

			ps.executeUpdate();

		} catch (Exception e) {
			throw new Exception("여행지)DB에 입력시 오류 : " + e.toString());
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

	// 관리자)숙박지 수정
	public int stayUpdate(StayBean stay) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "update stay set ar_no=?, s_name=?, s_addr=?, s_tel=?, "
					+ "s_usetime=?, s_holliday=?, s_leadtime=?, s_outline=?, s_price=?,"
					+ "s_parking=?, s_rank=?, s_mainmenu=?, board_kind=?, site_addr=?" + " where s_no=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, stay.getAr_no());
			ps.setString(2, stay.getS_name());
			ps.setString(3, stay.getS_addr());
			ps.setString(4, stay.getS_tel());
			ps.setString(5, stay.getS_usetime());
			ps.setString(6, stay.getS_holliday());
			ps.setString(7, stay.getS_leadtime());
			ps.setString(8, stay.getS_outline());
			ps.setInt(9, stay.getS_price());
			ps.setString(10, stay.getS_parking());
			ps.setString(11, stay.getS_rank());
			ps.setString(12, stay.getS_mainmenu());
			ps.setString(13, stay.getBoard_kind());
			ps.setString(14, stay.getSite_addr());
			ps.setInt(15, stay.getS_no());

			int cnt = ps.executeUpdate();
			return cnt;
		} catch (Exception e) {
			throw new Exception("숙박지)DB에 수정시 오류 : " + e.toString());
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

	// 관리자)숙박지 삭제
	public int stayDelete(int s_no) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "delete stay where s_no=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, s_no);
			int cnt = ps.executeUpdate();
			return cnt;
		} catch (Exception e) {
			throw new Exception("숙박지)DB에 삭제시 오류 : " + e.toString());
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
}
