package food.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class foodDao {
	private static foodDao instance;
	private Connection conn;

	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@61.81.98.230:1521:sds3";
	private static final String dbUser = "project";
	private static final String dbPass = "pass";

	// 객체 생성 메소드
	public static foodDao getInstance() throws Exception {
		if (instance == null) {
			instance = new foodDao();
		}
		return instance;
	}

	private foodDao() throws Exception {
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			throw new Exception("DB연결시 오류 : " + e.toString());
		}
	}

	// 맛집 전체 추출
	public List<FoodBean> selectCookList() throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<FoodBean> cList = new ArrayList<FoodBean>();
		boolean isEmpty = true;

		try {
			String sql = "select * from cook";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				FoodBean temp = new FoodBean();

				temp.setC_no(rs.getInt("C_NO"));
				temp.setCr_no(rs.getInt("CR_NO"));
				temp.setC_name(rs.getString("C_NAME"));
				temp.setC_addr(rs.getString("C_ADDR"));
				temp.setC_tel(rs.getString("C_TEL"));
				temp.setC_parking(rs.getString("C_PARKING"));
				temp.setC_usetime(rs.getString("C_USETIME"));
				temp.setC_rank(rs.getString("C_RANK"));
				temp.setC_kind(rs.getString("C_KIND"));

				cList.add(temp);
				isEmpty = false;
			}
			if (isEmpty)
				return Collections.emptyList();
			return cList;
		} catch (Exception e) {
			throw new Exception("맛집 ) DB에 전체 목록 검색시 오류  : " + e.toString());
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

	// 관리자)맛집 입력
	public void cookInsert(FoodBean cook) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "inset into cook(c_no, cr_no, c_name, c_addr, c_tel, c_parking," + " c_usetime, c_rank, c_kind"
					+ " values(seq_c_no, ?,?,?,?,?,?,?))";
			ps = conn.prepareStatement(sql);

			ps.setInt(1, cook.getCr_no());
			ps.setString(2, cook.getC_name());
			ps.setString(3, cook.getC_addr());
			ps.setString(4, cook.getC_tel());
			ps.setString(5, cook.getC_parking());
			ps.setString(6, cook.getC_usetime());
			ps.setString(7, cook.getC_rank());
			ps.setString(8, cook.getC_kind());

			ps.executeUpdate();

		} catch (Exception e) {
			throw new Exception("맛집)DB에 입력시 오류 : " + e.toString());
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

	// 관리자)맛집 수정
	public int cookUpdate(FoodBean cook) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "update cook set cr_no=?, c_name=?, c_addr=?, c_tel=?, c_parking=?,"
					+ " c_usetime=?, c_rank=?, c_kind=?" + " where c_no=?";

			ps = conn.prepareStatement(sql);

			ps.setInt(1, cook.getCr_no());
			ps.setString(2, cook.getC_name());
			ps.setString(3, cook.getC_addr());
			ps.setString(4, cook.getC_tel());
			ps.setString(5, cook.getC_parking());
			ps.setString(6, cook.getC_usetime());
			ps.setString(7, cook.getC_rank());
			ps.setString(8, cook.getC_kind());
			ps.setInt(9, cook.getC_no());

			int cnt = ps.executeUpdate();
			return cnt;
		} catch (Exception e) {
			throw new Exception("맛집)DB에 수정시 오류 : " + e.toString());
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

	// 관리자)맛집 삭제
	public int cookDelete(int c_no) throws Exception {
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "delete cook where c_no=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, c_no);
			int cnt = ps.executeUpdate();
			return cnt;
		} catch (Exception e) {
			throw new Exception("맛집)DB에 삭제시 오류 : " + e.toString());
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
