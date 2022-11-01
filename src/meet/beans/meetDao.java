package meet.beans;

import java.sql.*;
import java.util.*;

import meet.beans.*;

public class meetDao {
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@61.81.98.221:1521:sds3";
	private static final String		dbUser		=	"banana";
	private static final String		dbPass		=	"pass";
	
	private Connection con;
	
	private static meetDao Dao;
	
	public static meetDao getInstance() throws meetException
	{
		if( Dao == null )
		{
			Dao =  new meetDao();
		}
		return Dao;
	}

	private meetDao() throws meetException
	{	
		try{
			Class.forName( dbDriver );	
			
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );	
		}catch( Exception ex ){
			throw new meetException("DB 접속오류: " + ex.toString() );	
		}
	}

	public List<meet> meet() throws meetException, SQLException {
		// 모임 목록 불러오기
		Statement stmt = null;
		ResultSet rs = null;
		List<meet> tList = new ArrayList<meet>();
		
		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		try {
			String sql = "select * from meet";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				meet met = new meet();
				
				met.setM_date(rs.getString("m_date"));
				met.setM_place(rs.getString("m_place"));
				met.setM_people(rs.getInt("m_people"));
				met.setM_max(rs.getInt("m_max"));
				met.setImage(rs.getString("image"));
				
				tList.add(met);
			}
			
			rs.close();
			stmt.close();
			
			return tList;
		} catch (Exception e) {
			throw new meetException("모임 목록 불러오기 오류 : " + e.toString() );
		}
	}
}
