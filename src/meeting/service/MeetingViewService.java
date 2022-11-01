package meeting.service;

import meeting.model.MeetingBean;
import meeting.model.MeetingDao;

public class MeetingViewService {
	private static MeetingViewService instance;
	public static MeetingViewService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new MeetingViewService();
		}
		return instance;
	}
	
	public MeetingBean getMeetingById(String id, boolean isModify) throws Exception
	{
		int b_no = 0;
		if( id != null ) b_no = Integer.parseInt(id);
		MeetingDao dao = MeetingDao.getInstance();
		MeetingBean rec = dao.selectById(b_no);		
		
		if(!isModify){
			dao.increaseReadCount(b_no);
		}
		return rec;
	}
}
