package search.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import member.beans.RegisterException;

public class searchDao {
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@61.81.98.221:1521:sds3";
	private static final String		dbUser		=	"banana";
	private static final String		dbPass		=	"pass";
	
	private Connection con;
	
	private static searchDao memberDao;
	
	public static searchDao getInstance() throws searchException
	{
		if( memberDao == null )
		{
			memberDao =  new searchDao();
		}
		return memberDao;
	}

	private searchDao() throws searchException
	{	
		try{
			Class.forName( dbDriver );	
			
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );	
		}catch( Exception ex ){
			throw new searchException("DB 접속오류: " + ex.toString() );	
		}
	}
	
	public List<searchTour> searchTour(String map, String tour) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchTour> tList = new ArrayList<searchTour>();

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select t.t_no tno, t.tar_no tarno, t.t_name tname, t.t_addr taddr, t.t_tel ttel, t.t_usetime tusetime, t.t_holliday tholiday, t.t_leadtime tleadtime, t.t_outline toutline, t.t_price tprice, t.t_parking tparking, t.t_rank trank, t.board_kind tboardkind, t.site_addr tsiteaddr, t.image timage, t.timestamp stamp"
					+ " from tour t, tour_kind tk, tour_report tr, area a"
					+ " where t.t_no = tk.t_no and tk.tr_no = tr.tr_no and tr.tr_no = '" + tour + "' and a.ar_no = t.tar_no and a.ar_no = '" + map + "'";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchTour reg = new searchTour();
				
				reg.setT_name(rs.getString("tname"));
				reg.setT_addr(rs.getString("taddr"));
				reg.setT_tel(rs.getString("ttel"));
				reg.setT_usetime(rs.getString("tusetime"));
				reg.setT_holiday(rs.getString("tholiday"));
				reg.setT_leadtime(rs.getString("tleadtime"));
				reg.setT_outline(rs.getString("toutline"));
				reg.setT_price(rs.getInt("tprice"));
				reg.setT_parking(rs.getString("tparking"));
				reg.setT_rank(rs.getInt("trank"));
				reg.setBoard_kind(rs.getString("tboardkind"));
				reg.setSite_addr(rs.getString("tsiteaddr"));
				reg.setImage(rs.getString("timage"));
				reg.setT_no(rs.getInt("tno"));
				reg.setTimestamp(rs.getLong("stamp"));
				
				tList.add(reg);
			}
			
			rs.close();
			stmt.close();
			
			return tList;
			
		} catch (Exception e) {
			throw new searchException(" 여행목록불러오기오류 : " + e.toString() );
		}
		
	}
	
	public List<searchStay> searchStay(String map, String stay) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchStay> sList = new ArrayList<searchStay>();

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select s.s_no sno, s.sar_no sarno, s.s_name sname, s.s_addr saddr, s.s_tel stel, s.s_usetime susetime, s.s_holliday sholiday, s.s_price sprice, s.s_parking sparking, s.s_rank srank, s.board_kind sboardkind, s.site_addr ssiteaddr, s.image simage, s.timestamp stamp"
					+ " from stay s, stay_kind sk, stay_report sr, area a"
					+ " where s.s_no=sk.s_no and sk.sr_no=sr.sr_no and sr.sr_no = '" + stay + "' and a.ar_no = s.sar_no and a.ar_no = '" + map + "'";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchStay reg = new searchStay();
				
				reg.setS_name(rs.getString("sname"));
				reg.setS_addr(rs.getString("saddr"));
				reg.setS_tel(rs.getString("stel"));
				reg.setS_usetime(rs.getString("susetime"));
				reg.setS_holiday(rs.getString("sholiday"));
				reg.setS_price(rs.getInt("sprice"));
				reg.setS_parking(rs.getString("sparking"));
				reg.setS_rank(rs.getInt("srank"));
				reg.setBoard_kind(rs.getString("sboardkind"));
				reg.setSite_addr(rs.getString("ssiteaddr"));
				reg.setImage(rs.getString("simage"));
				reg.setS_no(rs.getInt("sno"));
				reg.setTimestamp(rs.getLong("stamp"));
				
				sList.add(reg);
			}
			
			rs.close();
			stmt.close();
			
			return sList;
			
		} catch (Exception e) {
			throw new searchException(" 숙박지목록불러오기오류 : " + e.toString() );
		}
		
	}

	public List<searchCook> searchCook(String map, String cook) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchCook> cList = new ArrayList<searchCook>();
		
		
		try {
			con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
			String sql = "select f.f_no fno, f.far_no farno, f.f_name fname, f.f_addr faddr, "
					+ "f.f_tel ftel, f.f_parking fparking, f.f_usetime fusetime, f.f_rank frank, f.f_kind fkind, f.image fimage, f.timestamp stamp"
					+ " from food f, food_kind fk, food_report fr, area a"
					+ " where f.f_no = fk.f_no and fk.fr_no = fr.fr_no and fr.fr_no = '" + cook + "' and a.ar_no = f.far_no and a.ar_no = '" + map + "'";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			boolean isEmpty = true;
			
			while(rs.next()) {
				searchCook reg = new searchCook();
				
				reg.setF_name(rs.getString("FNAME"));
				reg.setF_addr(rs.getString("FADDR"));
				reg.setF_tel(rs.getString("FTEL"));
				reg.setF_parking(rs.getString("FPARKING"));
				reg.setF_usetime(rs.getString("FUSETIME"));
				reg.setF_rank(rs.getInt("FRANK"));
				reg.setF_kind(rs.getString("FKIND"));
				reg.setImage(rs.getString("fimage"));
				reg.setF_no(rs.getInt("fno"));
				reg.setTimestamp(rs.getLong("stamp"));
				
				cList.add(reg);
				isEmpty=false;
			}
			
			if(isEmpty){
				return Collections.emptyList();
			}

			rs.close();
			stmt.close();
			
			return cList;
			
		} catch (Exception e) {
			throw new searchException(" 맛집목록불러오기오류 : " + e.toString() );
		}
		
	}
	
	public List<searchTour> searchTourRank(int rank) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchTour> tList = new ArrayList<searchTour>();
//		System.out.println(rank);
		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			String sql = "select t.t_name tname, tr.tr_group tkind, t.image img, "
					+"t.t_no tno, t.t_addr tadd, t.t_tel ttel, t.t_usetime tut, t.t_holliday thol, t.t_leadtime tlead, t.t_outline tout, "
					+ "t.t_price tpr, t.t_parking tpar, t.t_rank tra, t.site_addr tsite, t.timestamp stamp "
					+ "from tour t, tour_kind tk, tour_report tr, area a "
					+ "where a.ar_no = t.tar_no and t.t_no = tk.t_no and tr.tr_no = tk.tr_no order by t.t_rank desc";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchTour rec = new searchTour();
				
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
				rec.setTimestamp(rs.getLong("stamp"));
				
				tList.add(rec);
			}
			
//			System.out.println(tList.get(0).getT_name());
			
			rs.close();
			stmt.close();
			
			return tList;
			
		} catch (Exception e) {
			throw new searchException(" 여행랭킹목록불러오기오류1 : " + e.toString() );
		}
		
	}
	
	public List<searchTour> searchTour(int num) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchTour> tList = new ArrayList<searchTour>();
//		System.out.println(rank);
		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select * from tour where t_no = " + num;
//			String sql = "select * from tour";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchTour reg = new searchTour();
				
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
				reg.setImage(rs.getString("image"));
				reg.setLikes(rs.getInt("likes"));
				reg.setTimestamp(rs.getLong("TIMESTAMP"));
				
				tList.add(reg);
			}
			
//			System.out.println(tList.get(0).getT_name());
			
			rs.close();
			stmt.close();
			
			return tList;
			
		} catch (Exception e) {
			throw new searchException(" 여행랭킹목록불러오기오류2 : " + e.toString() );
		}
		
	}
	
	public List<searchStay> searchStayRank(int rank) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchStay> sList = new ArrayList<searchStay>();

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select s.s_name sname, sr.sr_group skind, s.image img, "
					+ "s.s_no sno, s.s_addr sadd, s.s_tel stel, s.s_usetime sut, s.s_holliday shol, "
					+ "s.s_price spri, s.s_parking spar, s.s_rank sran, s.site_addr ssite, s.timestamp stamp "
					+ "from stay s, stay_kind sk, stay_report sr, area a "
					+ "where a.ar_no = s.sar_no and s.s_no = sk.s_no and sr.sr_no = sk.sr_no order by s.s_rank desc";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchStay rec = new searchStay();
				
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
				rec.setTimestamp(rs.getLong("stamp"));
				
				sList.add(rec);
			}
			
			rs.close();
			stmt.close();
			
			return sList;
			
		} catch (Exception e) {
			throw new searchException(" 숙박지랭킹목록불러오기오류1 : " + e.toString() );
		}
		
	}
	
	public List<searchStay> searchStay(int num) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchStay> sList = new ArrayList<searchStay>();

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select * from stay where s_no = " + num;
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchStay reg = new searchStay();
				
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
				reg.setLikes(rs.getInt("likes"));
				reg.setTimestamp(rs.getLong("TIMESTAMP"));
				
				sList.add(reg);
			}
			
			rs.close();
			stmt.close();
			
			return sList;
			
		} catch (Exception e) {
			throw new searchException(" 숙박지랭킹목록불러오기오류2 : " + e.toString() );
		}
		
	}

	public List<searchCook> searchFoodRank(int rank) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchCook> cList = new ArrayList<searchCook>();

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select f.f_name fname, f.f_no fno, f.f_addr faddr, f.f_tel ftel, "
					+ "f.f_parking fpa, f.F_USETIME fut, f.f_rank fra, fr.fr_group fkind, f.image img, f.timestamp stamp "
					+ "from food f, food_kind fk, food_report fr, area a "
					+ "where a.ar_no = f.far_no and f.f_no = fk.f_no and fr.fr_no = fk.fr_no order by f.f_rank desc";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchCook rec = new searchCook();
				
				rec.setF_no(rs.getInt("fno"));
				rec.setF_name(rs.getString("fname"));
				rec.setF_addr(rs.getString("faddr"));
				rec.setF_tel(rs.getString("ftel"));
				rec.setF_parking(rs.getString("fpa"));
				rec.setF_usetime(rs.getString("fut"));
				rec.setF_rank(rs.getInt("fra"));
				rec.setF_kind(rs.getString("fkind"));
				rec.setImage(rs.getString("img"));
				rec.setTimestamp(rs.getLong("stamp"));
				
				cList.add(rec);
			}
			
			rs.close();
			stmt.close();
			
			return cList;
			
		} catch (Exception e) {
			throw new searchException(" 맛집랭킹목록불러오기오류1 : " + e.toString() );
		}
		
	}
	
	public List<searchCook> searchFood(int num) throws searchException, SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		List<searchCook> cList = new ArrayList<searchCook>();

		con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		try {
			
			String sql = "select * from food where f_no = " + num;
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchCook reg = new searchCook();
				
				reg.setF_no(rs.getInt("F_NO"));
				reg.setF_name(rs.getString("F_NAME"));
				reg.setF_addr(rs.getString("F_ADDR"));
				reg.setF_tel(rs.getString("F_TEL"));
				reg.setF_parking(rs.getString("F_PARKING"));
				reg.setF_usetime(rs.getString("F_USETIME"));
				reg.setF_rank(rs.getInt("F_RANK"));
				reg.setF_kind(rs.getString("F_KIND"));
				reg.setImage(rs.getString("IMAGE"));
				reg.setLikes(rs.getInt("likes"));
				reg.setTimestamp(rs.getLong("TIMESTAMP"));
				
				cList.add(reg);
			}
			
			rs.close();
			stmt.close();
			
			return cList;
			
		} catch (Exception e) {
			throw new searchException(" 맛집랭킹목록불러오기오류2 : " + e.toString() );
		}
		
	}
	
	// 여행누적조회수 저장
		public void increaseTlikeCount(int like, int tno) throws searchException, SQLException {
			PreparedStatement ps = null;
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			try{
				String sql = "update tour set likes = ? where t_no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, like);
				ps.setInt(2, tno);
				ps.executeUpdate();
			
			}catch( Exception ex ){
				throw new searchException("좋아용 오류  : " + ex.toString() );	
			} finally{
				if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
				if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
			}
		}
		
		// 숙박누적조회수 저장
		public void increaseSlikeCount(int like, int sno) throws searchException, SQLException {
			PreparedStatement ps = null;
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			try{
				String sql = "update stay set likes = ? where s_no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, like);
				ps.setInt(2, sno);
				ps.executeUpdate();
			
			}catch( Exception ex ){
				throw new searchException("좋아용 오류  : " + ex.toString() );	
			} finally{
				if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
				if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
			}
		}
		
		// 맛집누적조회수 저장
		public void increaseFlikeCount(int like, int fno) throws searchException, SQLException {
			PreparedStatement ps = null;
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			try{
				String sql = "update food set likes = ? where f_no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, like);
				ps.setInt(2, fno);
				ps.executeUpdate();
			
			}catch( Exception ex ){
				throw new searchException("맛집좋아용 오류  : " + ex.toString() );	
			} finally{
				if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
				if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
			}
		}
}
