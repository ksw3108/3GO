package meeting.service;

import meeting.model.MeetingBean;
import meeting.model.MeetingDao;

public class MeetingModifyService {
	private static MeetingModifyService instance;
	public static MeetingModifyService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new MeetingModifyService();
		}
		return instance;
	}
	
	public int update( MeetingBean rec ) throws Exception{
		
		// DB¿¡ update
		int result = MeetingDao.getInstance().update(rec);
	
		return result;
		
	}
}
