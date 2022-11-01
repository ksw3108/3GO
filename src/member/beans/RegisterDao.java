package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RegisterDao {
	
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@61.81.98.221:1521:sds3";
	private static final String		dbUser		=	"banana";
	private static final String		dbPass		=	"pass";
	
	private Connection con;
	
	private static RegisterDao memberDao;
	
	public static RegisterDao getInstance() throws RegisterException
	{
		if( memberDao == null )
		{
			memberDao =  new RegisterDao();
		}
		return memberDao;
	}

	private RegisterDao() throws RegisterException
	{	
		try{
			Class.forName( dbDriver );	
			
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );	
		}catch( Exception ex ){
			throw new RegisterException("DB 접속오류: " + ex.toString() );	
		}
	}
	public void insertMember( Register rec ) throws RegisterException
	{
		try {
			String insertSql = "INSERT INTO member VALUES(seq_m_no.nextval,?,?,?,?,?,?,(select g_no from grade where g_min = 0))";
			PreparedStatement insertPrep = con.prepareStatement(insertSql);
			insertPrep.setString(1, rec.getM_name());
			insertPrep.setString(2, rec.getM_id());
			insertPrep.setString(3, rec.getM_pass());
			insertPrep.setString(4, rec.getM_email());
			insertPrep.setString(5, rec.getM_phone());
			insertPrep.setString(6, rec.getM_addr());
			
			insertPrep.executeUpdate();
			
			insertPrep.close();
		} catch ( Exception ex ){
			throw new RegisterException(" 회원가입DB접속오류 : " + ex.toString() );			
		}			
	}
	
	public List<Register> idCheck(String id) throws Exception {
		Statement stmt = null;
		String m_id = null;
		String m_pw = null;
 		List<Register> rList = new ArrayList<Register>();
		
		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		
		String sql = "select * from member where m_id = '" + id + "'";
		stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			Register reg = new Register();
			
			reg.setM_id(rs.getString(3));
			reg.setM_pass(rs.getString(4));
			
			rList.add(reg);
		}
		rs.close();
		stmt.close();
		
		return rList;
	}
}