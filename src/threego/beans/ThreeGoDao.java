package threego.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ThreeGoDao {
	// Single Pattern
	private static ThreeGoDao instance;

	// DB 연결시 관한 변수
	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@61.81.98.221:1521:sds3";
	private static final String dbUser = "banana";
	private static final String dbPass = "pass";

	private Connection con;

	// --------------------------------------------
	// ##### 객체 생성하는 메소드
	public static ThreeGoDao getInstance() throws ThreeGoException {
		if (instance == null) {
			instance = new ThreeGoDao();
		}
		return instance;
	}

	private ThreeGoDao() throws ThreeGoException {

		try {

			/********************************************
			 * 1. 오라클 드라이버를 로딩 ( DBCP 연결하면 삭제할 부분 )
			 */
			Class.forName(dbDriver);
		} catch (Exception ex) {
			throw new ThreeGoException("DB 연결시 오류  : " + ex.toString());
		}

	}

	/* 입력 */
/*
	public int insert(ExBeen rec) throws ThreeGoException {

		*//************************************************
		*//*
		ResultSet rs = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "insert into ExProject values(?, ?, ?)";
			ps = con.prepareStatement(sql);

			ps.setString(1, rec.getNum());
			ps.setString(2, rec.getName());
			ps.setString(3, rec.getText());

			ps.executeUpdate();

			return 0;

		} catch (Exception ex) {
			throw new ThreeGoException("게시판 ) DB에 입력시 오류  : " + ex.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException ex) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}

	}
*/
	/* 체크박스 검색 */
	/*Food*/
	public List<TourRec> selectSearch_Tour(String num, String[] name) throws ThreeGoException {

		PreparedStatement ps = null;
		ResultSet rs = null;
		List<TourRec> mList = new ArrayList<TourRec>();
		boolean isEmpty = true;

		try {
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

			if (Integer.parseInt(num) != 0 && !(name[0].equals("0"))) {
				
				for (int i = 0; i < name.length; i++) {
					String sql = "select t.t_name tname, tr.tr_group tkind, t.image img, "
									+"t.t_no tno, t.t_addr tadd, t.t_tel ttel, t.t_usetime tut, t.t_holliday thol, t.t_leadtime tlead, t.t_outline tout, "
									+ "t.t_price tpr, t.t_parking tpar, t.t_rank tra, t.site_addr tsite, t.likes tlike "
									+ "from tour t, tour_kind tk, tour_report tr, area a "
									+ "where a.ar_no = t.tar_no and t.t_no = tk.t_no and tr.tr_no = tk.tr_no and tr.tr_no = " + name[i] + " and t.tar_no = " + num;
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						TourRec rec = new TourRec();
						/*rec.setBoard_kind(rs.getString("tkind"));
						rec.setT_name(rs.getString("tname"));
						rec.setImage(rs.getString("img"));*/
						rec.setT_no(rs.getInt("tno"));
						rec.setT_name(rs.getString("tname"));
						rec.setT_addr(rs.getString("tadd"));
						rec.setT_tel(rs.getString("ttel"));
						rec.setT_usetime(rs.getString("tut"));
						rec.setT_holiday(rs.getString("thol"));
						rec.setT_leadtime(rs.getString("tlead"));
						rec.setT_outline(rs.getString("tout"));
						rec.setT_price(rs.getInt("tpr"));
						rec.setT_parking(rs.getString("tpar"));
						rec.setT_rank(rs.getInt("tra"));
						rec.setBoard_kind(rs.getString("tkind"));
						rec.setSite_addr(rs.getString("tsite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("tlike"));
						

						mList.add(rec);
						
					}
				}
				
				

			} else if (Integer.parseInt(num) != 0 && name[0].equals("0")) {

				for (int i = 0; i < name.length; i++) {

					String sql = "select t.t_name tname, tr.tr_group tkind, t.image img, "
									+"t.t_no tno, t.t_addr tadd, t.t_tel ttel, t.t_usetime tut, t.t_holliday thol, t.t_leadtime tlead, t.t_outline tout, "
									+ "t.t_price tpr, t.t_parking tpar, t.t_rank tra, t.site_addr tsite, t.likes tlike "
									+ "from tour t, tour_kind tk, tour_report tr, area a "
									+ "where a.ar_no = t.tar_no and t.t_no = tk.t_no and tr.tr_no = tk.tr_no and tr.tr_no = " + name[i];
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						TourRec rec = new TourRec();
						/*rec.setBoard_kind(rs.getString("tkind"));
						rec.setT_name(rs.getString("tname"));
						rec.setImage(rs.getString("img"));*/
						rec.setT_no(rs.getInt("tno"));
						rec.setT_name(rs.getString("tname"));
						rec.setT_addr(rs.getString("tadd"));
						rec.setT_tel(rs.getString("ttel"));
						rec.setT_usetime(rs.getString("tut"));
						rec.setT_holiday(rs.getString("thol"));
						rec.setT_leadtime(rs.getString("tlead"));
						rec.setT_outline(rs.getString("tout"));
						rec.setT_price(rs.getInt("tpr"));
						rec.setT_parking(rs.getString("tpar"));
						rec.setT_rank(rs.getInt("tra"));
						rec.setBoard_kind(rs.getString("tkind"));
						rec.setSite_addr(rs.getString("tsite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("tlike"));

						mList.add(rec);

					}
				}
			} else if (Integer.parseInt(num) == 0 && !(name[0].equals("0"))) {

				for (int i = 0; i < name.length; i++) {

					String sql = "select t.t_name tname, tr.tr_group tkind, t.image img, "
									+"t.t_no tno, t.t_addr tadd, t.t_tel ttel, t.t_usetime tut, t.t_holliday thol, t.t_leadtime tlead, t.t_outline tout, "
									+ "t.t_price tpr, t.t_parking tpar, t.t_rank tra, t.site_addr tsite, t.likes tlike "
									+ "from tour t, tour_kind tk, tour_report tr, area a "
									+ "where a.ar_no = t.tar_no and t.t_no = tk.t_no and tr.tr_no = tk.tr_no and t.tar_no = " + num;
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						TourRec rec = new TourRec();
						/*rec.setBoard_kind(rs.getString("tkind"));
						rec.setT_name(rs.getString("tname"));
						rec.setImage(rs.getString("img"));*/
						rec.setT_no(rs.getInt("tno"));
						rec.setT_name(rs.getString("tname"));
						rec.setT_addr(rs.getString("tadd"));
						rec.setT_tel(rs.getString("ttel"));
						rec.setT_usetime(rs.getString("tut"));
						rec.setT_holiday(rs.getString("thol"));
						rec.setT_leadtime(rs.getString("tlead"));
						rec.setT_outline(rs.getString("tout"));
						rec.setT_price(rs.getInt("tpr"));
						rec.setT_parking(rs.getString("tpar"));
						rec.setT_rank(rs.getInt("tra"));
						rec.setBoard_kind(rs.getString("tkind"));
						rec.setSite_addr(rs.getString("tsite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("tlike"));

						mList.add(rec);

					}
				}
			} else if (Integer.parseInt(num) == 0 && name[0].equals("0")) {

				for (int i = 0; i < name.length; i++) {
					String sql = "select t.t_name tname, tr.tr_group tkind, t.image img, "
									+"t.t_no tno, t.t_addr tadd, t.t_tel ttel, t.t_usetime tut, t.t_holliday thol, t.t_leadtime tlead, t.t_outline tout, "
									+ "t.t_price tpr, t.t_parking tpar, t.t_rank tra, t.site_addr tsite, t.likes tlike "
									+ "from tour t, tour_kind tk, tour_report tr, area a "
									+ "where a.ar_no = t.tar_no and t.t_no = tk.t_no and tr.tr_no = tk.tr_no";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						TourRec rec = new TourRec();
						/*rec.setBoard_kind(rs.getString("tkind"));
						rec.setT_name(rs.getString("tname"));
						rec.setImage(rs.getString("img"));*/
						rec.setT_no(rs.getInt("tno"));
						rec.setT_name(rs.getString("tname"));
						rec.setT_addr(rs.getString("tadd"));
						rec.setT_tel(rs.getString("ttel"));
						rec.setT_usetime(rs.getString("tut"));
						rec.setT_holiday(rs.getString("thol"));
						rec.setT_leadtime(rs.getString("tlead"));
						rec.setT_outline(rs.getString("tout"));
						rec.setT_price(rs.getInt("tpr"));
						rec.setT_parking(rs.getString("tpar"));
						rec.setT_rank(rs.getInt("tra"));
						rec.setBoard_kind(rs.getString("tkind"));
						rec.setSite_addr(rs.getString("tsite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("tlike"));

						mList.add(rec);

					}
				}

			}

			if (isEmpty)
				return Collections.emptyList();

			return mList;

		} catch (Exception ex) {
			throw new ThreeGoException("목록 ) TOUR 목록 검색시 오류  : " + ex.toString());
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
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}
	
	/*Food*/
	public List<FoodRec> selectSearch_Food(String num, String[] name) throws ThreeGoException {

		PreparedStatement ps = null;
		ResultSet rs = null;
		List<FoodRec> mList = new ArrayList<FoodRec>();
		boolean isEmpty = true;

		try {

			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

			if (Integer.parseInt(num) != 0 && !(name[0].equals("0"))) {

				for (int i = 0; i < name.length; i++) {
					String sql = "select f.f_name fname, f.f_no fno, f.f_addr faddr, f.f_tel ftel, "
									+ "f.f_parking fpa, f.F_USETIME fut, f.f_rank fra, fr.fr_group fkind, f.image img, f.likes flike "
									+ "from food f, food_kind fk, food_report fr, area a "
									+ "where a.ar_no = f.far_no and f.f_no = fk.f_no and fr.fr_no = fk.fr_no and fr.fr_no = " + name[i] + " and f.far_no = " + num;
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						FoodRec rec = new FoodRec();
						/*rec.setC_kind(rs.getString("fkind"));
						rec.setC_name(rs.getString("fname"));
						rec.setImage(rs.getString("img"));*/
						rec.setF_no(rs.getInt("fno"));
						rec.setC_name(rs.getString("fname"));
						rec.setC_addr(rs.getString("faddr"));
						rec.setC_tel(rs.getString("ftel"));
						rec.setC_parking(rs.getString("fpa"));
						rec.setC_usetime(rs.getString("fut"));
						rec.setC_rank(rs.getInt("fra"));
						rec.setC_kind(rs.getString("fkind"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("flike"));

		
						

						mList.add(rec);

					}
				}

			} else if (Integer.parseInt(num) == 0 && !(name[0].equals("0"))) {

				for (int i = 0; i < name.length; i++) {

					String sql = "select f.f_name fname, f.f_no fno, f.f_addr faddr, f.f_tel ftel, "
									+ "f.f_parking fpa, f.F_USETIME fut, f.f_rank fra, fr.fr_group fkind, f.image img, f.likes flike "
									+ "from food f, food_kind fk, food_report fr, area a "
									+ "where a.ar_no = f.far_no and f.f_no = fk.f_no and fr.fr_no = fk.fr_no and fr.fr_no = " + name[i];
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						FoodRec rec = new FoodRec();
						/*rec.setC_kind(rs.getString("fkind"));
						rec.setC_name(rs.getString("fname"));
						rec.setImage(rs.getString("img"));*/
						rec.setF_no(rs.getInt("fno"));
						rec.setC_name(rs.getString("fname"));
						rec.setC_addr(rs.getString("faddr"));
						rec.setC_tel(rs.getString("ftel"));
						rec.setC_parking(rs.getString("fpa"));
						rec.setC_usetime(rs.getString("fut"));
						rec.setC_rank(rs.getInt("fra"));
						rec.setC_kind(rs.getString("fkind"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("flike"));

						mList.add(rec);

					}
				}
			} else if (Integer.parseInt(num) != 0 && name[0].equals("0")) {

				for (int i = 0; i < name.length; i++) {

					String sql = "select f.f_name fname, f.f_no fno, f.f_addr faddr, f.f_tel ftel, "
									+ "f.f_parking fpa, f.F_USETIME fut,  f.f_rank fra, fr.fr_group fkind, f.image img, f.likes flike "
									+ "from food f, food_kind fk, food_report fr, area a "
									+ "where a.ar_no = f.far_no and f.f_no = fk.f_no and fr.fr_no = fk.fr_no and f.far_no = " + num;
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						FoodRec rec = new FoodRec();
						/*rec.setC_kind(rs.getString("fkind"));
						rec.setC_name(rs.getString("fname"));
						rec.setImage(rs.getString("img"));*/
						rec.setF_no(rs.getInt("fno"));
						rec.setC_name(rs.getString("fname"));
						rec.setC_addr(rs.getString("faddr"));
						rec.setC_tel(rs.getString("ftel"));
						rec.setC_parking(rs.getString("fpa"));
						rec.setC_usetime(rs.getString("fut"));
						rec.setC_rank(rs.getInt("fra"));
						rec.setC_kind(rs.getString("fkind"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("flike"));	
						
						mList.add(rec);

					}
				}
			} else if (Integer.parseInt(num) == 0 && name[0].equals("0")) {

				for (int i = 0; i < name.length; i++) {
					String sql = "select f.f_name fname, f.f_no fno, f.f_addr faddr, f.f_tel ftel, "
									+ "f.f_parking fpa, f.F_USETIME fut, f.f_rank fra, fr.fr_group fkind, f.image img, f.likes flike "
									+ "from food f, food_kind fk, food_report fr, area a "
									+ "where a.ar_no = f.far_no and f.f_no = fk.f_no and fr.fr_no = fk.fr_no";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();


					while (rs.next()) {

						isEmpty = false;

						FoodRec rec = new FoodRec();
						/*rec.setC_kind(rs.getString("fkind"));
						rec.setC_name(rs.getString("fname"));
						rec.setImage(rs.getString("img"));*/
						rec.setF_no(rs.getInt("fno"));
						rec.setC_name(rs.getString("fname"));
						rec.setC_addr(rs.getString("faddr"));
						rec.setC_tel(rs.getString("ftel"));
						rec.setC_parking(rs.getString("fpa"));
						rec.setC_usetime(rs.getString("fut"));
						rec.setC_rank(rs.getInt("fra"));
						rec.setC_kind(rs.getString("fkind"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("flike"));
				
						mList.add(rec);

					}
				}

			}

			if (isEmpty)
				return Collections.emptyList();

			return mList;

		} catch (Exception ex) {
			throw new ThreeGoException("목록 ) Food에 목록 검색시 오류  : " + ex.toString());
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
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}
	
	/*Stay*/
	public List<StayRec> selectSearch_Stay(String num, String[] name) throws ThreeGoException {

		PreparedStatement ps = null;
		ResultSet rs = null;
		List<StayRec> mList = new ArrayList<StayRec>();
		boolean isEmpty = true;

		try {

			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

			if (Integer.parseInt(num) != 0 && !(name[0].equals("0"))) {

				for (int i = 0; i < name.length; i++) {
					String sql = "select s.s_name sname, sr.sr_group skind, s.image img, "
									+ "s.s_no sno, s.s_addr sadd, s.s_tel stel, s.s_usetime sut, s.s_holliday shol, "
									+ "s.s_price spri, s.s_parking spar, s.s_rank sran, s.site_addr ssite, s.likes slike "
									+ "from stay s, stay_kind sk, stay_report sr, area a "
									+ "where a.ar_no = s.sar_no and s.s_no = sk.s_no and sr.sr_no = sk.sr_no and sr.sr_no = " + name[i] + " and s.sar_no = " + num;
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						StayRec rec = new StayRec();
						/*rec.setBoard_kind(rs.getString("skind"));
						rec.setS_name(rs.getString("sname"));
						rec.setImage(rs.getString("img"));*/
						rec.setS_no(rs.getInt("sno"));
						rec.setS_name(rs.getString("sname"));
						rec.setS_addr(rs.getString("sadd"));
						rec.setS_tel(rs.getString("stel"));
						rec.setS_usetime(rs.getString("sut"));
						rec.setS_holiday(rs.getString("shol"));
						rec.setS_price(rs.getInt("spri"));
						rec.setS_parking(rs.getString("spar"));
						rec.setS_rank(rs.getInt("sran"));
						rec.setBoard_kind(rs.getString("skind"));
						rec.setSite_addr(rs.getString("ssite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("slike"));

						mList.add(rec);

					}
				}

			} else if (Integer.parseInt(num) != 0 && name[0].equals("0")) {

				for (int i = 0; i < name.length; i++) {

					String sql = "select s.s_name sname, sr.sr_group skind, s.image img, "
									+ "s.s_no sno, s.s_addr sadd, s.s_tel stel, s.s_usetime sut, s.s_holliday shol, "
									+ "s.s_price spri, s.s_parking spar, s.s_rank sran, s.site_addr ssite, s.likes slike "
									+ "from stay s, stay_kind sk, stay_report sr, area a "
									+ "where a.ar_no = s.sar_no and s.s_no = sk.s_no and sr.sr_no = sk.sr_no and sr.sr_no = " + name[i];
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						StayRec rec = new StayRec();
						/*rec.setBoard_kind(rs.getString("skind"));
						rec.setS_name(rs.getString("sname"));
						rec.setImage(rs.getString("img"));*/
						rec.setS_no(rs.getInt("sno"));
						rec.setS_name(rs.getString("sname"));
						rec.setS_addr(rs.getString("sadd"));
						rec.setS_tel(rs.getString("stel"));
						rec.setS_usetime(rs.getString("sut"));
						rec.setS_holiday(rs.getString("shol"));
						rec.setS_price(rs.getInt("spri"));
						rec.setS_parking(rs.getString("spar"));
						rec.setS_rank(rs.getInt("sran"));
						rec.setBoard_kind(rs.getString("skind"));
						rec.setSite_addr(rs.getString("ssite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("slike"));

						mList.add(rec);

					}
				}
			} else if (Integer.parseInt(num) == 0 && !(name[0].equals("0"))) {

				for (int i = 0; i < name.length; i++) {

					String sql = "select s.s_name sname, sr.sr_group skind, s.image img, "
									+ "s.s_no sno, s.s_addr sadd, s.s_tel stel, s.s_usetime sut, s.s_holliday shol, "
									+ "s.s_price spri, s.s_parking spar, s.s_rank sran, s.site_addr ssite, s.likes slike "
									+ "from stay s, stay_kind sk, stay_report sr, area a "
									+ "where a.ar_no = s.sar_no and s.s_no = sk.s_no and sr.sr_no = sk.sr_no and s.sar_no = " + num;
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						StayRec rec = new StayRec();
						/*rec.setBoard_kind(rs.getString("skind"));
						rec.setS_name(rs.getString("sname"));
						rec.setImage(rs.getString("img"));*/
						rec.setS_no(rs.getInt("sno"));
						rec.setS_name(rs.getString("sname"));
						rec.setS_addr(rs.getString("sadd"));
						rec.setS_tel(rs.getString("stel"));
						rec.setS_usetime(rs.getString("sut"));
						rec.setS_holiday(rs.getString("shol"));
						rec.setS_price(rs.getInt("spri"));
						rec.setS_parking(rs.getString("spar"));
						rec.setS_rank(rs.getInt("sran"));
						rec.setBoard_kind(rs.getString("skind"));
						rec.setSite_addr(rs.getString("ssite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("slike"));

						mList.add(rec);

					}
				}
			} else if (Integer.parseInt(num) == 0 && name[0].equals("0")) {

				for (int i = 0; i < name.length; i++) {
					String sql = "select s.s_name sname, sr.sr_group skind, s.image img, "
									+ "s.s_no sno, s.s_addr sadd, s.s_tel stel, s.s_usetime sut, s.s_holliday shol, "
									+ "s.s_price spri, s.s_parking spar, s.s_rank sran, s.site_addr ssite, s.likes slike "
									+ "from stay s, stay_kind sk, stay_report sr, area a "
									+ "where a.ar_no = s.sar_no and s.s_no = sk.s_no and sr.sr_no = sk.sr_no";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();

					while (rs.next()) {

						isEmpty = false;

						StayRec rec = new StayRec();
						/*rec.setBoard_kind(rs.getString("skind"));
						rec.setS_name(rs.getString("sname"));
						rec.setImage(rs.getString("img"));*/
						rec.setS_no(rs.getInt("sno"));
						rec.setS_name(rs.getString("sname"));
						rec.setS_addr(rs.getString("sadd"));
						rec.setS_tel(rs.getString("stel"));
						rec.setS_usetime(rs.getString("sut"));
						rec.setS_holiday(rs.getString("shol"));
						rec.setS_price(rs.getInt("spri"));
						rec.setS_parking(rs.getString("spar"));
						rec.setS_rank(rs.getInt("sran"));
						rec.setBoard_kind(rs.getString("skind"));
						rec.setSite_addr(rs.getString("ssite"));
						rec.setImage(rs.getString("img"));
						rec.setLikes(rs.getInt("slike"));

						mList.add(rec);

					}
				}

			}

			if (isEmpty)
				return Collections.emptyList();

			return mList;

		} catch (Exception ex) {
			throw new ThreeGoException("목록 ) Stay에 목록 검색시 오류  : " + ex.toString());
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
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
	}
	
	
	/*      객체 정보 페이지    */
	
	public List<TourRec> searchTour(int num) throws ThreeGoException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<TourRec> tList = new ArrayList<TourRec>();
		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		System.out.println(rank);
		try {
			
			String sql = "select * from tour where t_no = " + num;
//			String sql = "select * from tour";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				TourRec reg = new TourRec();
				
				reg.setT_no(rs.getInt("T_NO"));
				reg.setT_name(rs.getString("T_NAME"));
				reg.setT_addr(rs.getString("T_ADDR"));
				reg.setT_tel(rs.getString("T_TEL"));
				reg.setT_usetime(rs.getString("T_USETIME"));
				reg.setT_holiday(rs.getString("T_HOLLIDAY"));
				reg.setT_leadtime(rs.getString("T_LEADTIME"));
				reg.setT_outline(rs.getString("T_OUTLINE"));
				reg.setT_price(rs.getInt("T_PRICE"));
				reg.setT_parking(rs.getString("T_PARKING"));
				reg.setT_rank(rs.getInt("T_RANK"));
				reg.setBoard_kind(rs.getString("BOARD_KIND"));
				reg.setSite_addr(rs.getString("SITE_ADDR"));
				reg.setImage(rs.getString("IMAGE"));
				reg.setLikes(rs.getInt("LIKES"));
				
				tList.add(reg);
			}
			
//			System.out.println(tList.get(0).getT_name());
			
			rs.close();
			stmt.close();
			
			return tList;
			
		} catch (Exception e) {
			throw new ThreeGoException(" 여행랭킹목록불러오기오류2 : " + e.toString() );
		}
		
	}
	
	public List<FoodRec> searchFood(int num) throws ThreeGoException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<FoodRec> cList = new ArrayList<FoodRec>();
		

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try { 

			String sql = "select * from food where F_NO = " + num;
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				FoodRec reg = new FoodRec();
				
				reg.setF_no(rs.getInt("F_NO"));
				reg.setC_name(rs.getString("F_NAME"));
				reg.setC_addr(rs.getString("F_ADDR"));
				reg.setC_tel(rs.getString("F_TEL"));
				reg.setC_parking(rs.getString("F_PARKING"));
				reg.setC_usetime(rs.getString("F_USETIME"));
				reg.setC_rank(rs.getInt("F_RANK"));
				reg.setC_kind(rs.getString("F_KIND"));
				reg.setImage(rs.getString("IMAGE"));
				reg.setLikes(rs.getInt("LIKES"));
				reg.setTimestamp(rs.getLong("timestamp"));
				reg.setKey(rs.getString("key"));
				
				cList.add(reg);
			}
			
			rs.close();
			stmt.close();
			
			return cList;
			
		} catch (Exception e) {
			throw new ThreeGoException(" 맛집랭킹목록불러오기오류2 : " + e.toString() );
		}
		
	}
	
	public List<StayRec> searchStay(int num) throws ThreeGoException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<StayRec> sList = new ArrayList<StayRec>();

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select * from stay where s_no = " + num;
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				StayRec reg = new StayRec();
				
				reg.setS_no(rs.getInt("S_NO"));
				reg.setS_name(rs.getString("S_NAME"));
				reg.setS_addr(rs.getString("S_ADDR"));
				reg.setS_tel(rs.getString("S_TEL"));
				reg.setS_usetime(rs.getString("S_USETIME"));
				reg.setS_holiday(rs.getString("S_HOLLIDAY"));
				reg.setS_price(rs.getInt("S_PRICE"));
				reg.setS_parking(rs.getString("S_PARKING"));
				reg.setS_rank(rs.getInt("S_RANK"));
				reg.setBoard_kind(rs.getString("BOARD_KIND"));
				reg.setSite_addr(rs.getString("SITE_ADDR"));
				reg.setImage(rs.getString("IMAGE"));
				reg.setLikes(rs.getInt("LIKES"));
				
				sList.add(reg);
			}
			
			rs.close();
			stmt.close();
			
			return sList;
			
		} catch (Exception e) {
			throw new ThreeGoException(" 숙박지랭킹목록불러오기오류2 : " + e.toString() );
		}
		
	}
	
}
