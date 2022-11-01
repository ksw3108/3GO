package meeting.service;

import meeting.model.MeetingDao;

public class MeetingDeleteService {
	private static MeetingDeleteService instance;
	public static MeetingDeleteService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new MeetingDeleteService();
		}
		return instance;
	}
	
	public int delete( String id, String password ) throws Exception{
		
		// DB¿¡ delete
		int b_no = 0;
		if( id!=null ) b_no = Integer.parseInt( id );
		int result = MeetingDao.getInstance().delete(b_no, password);
	
		return result;
		
	}
}
