package member.service;

import java.util.List;

import member.beans.Register;
import member.beans.RegisterDao;
import member.beans.RegisterException;

public class RegisterService {
	private static RegisterService instance;
	
	public static RegisterService getInstance()  throws RegisterException{
		if( instance == null )
		{
			instance = new RegisterService();
		}
		return instance;
	}
	
	public List<Register> selectInfo(String id) throws Exception{
		List<Register> tList = RegisterDao.getInstance().idCheck(id);
		return tList;
	}
}
