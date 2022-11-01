package meeting.service;

import java.util.List;

import meeting.model.MeetingBean;
import meeting.model.MeetingDao;

public class MeetingListService {
	private static MeetingListService instance;
	public static MeetingListService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new MeetingListService();
		}
		return instance;
	}
	private int totalRecordCount;
	private int totalPageCount;
	private int recordPerPage=15;
	
	public List<MeetingBean> getReplyList(String group_no)throws Exception{
		List<MeetingBean> mList = MeetingDao.getInstance().reply(group_no);		
		return mList;
	}
	
	//���ϴ� �������� ����ϴ� �޼ҵ�
	public List <MeetingBean> getMeetingList(String pNum, int b_r_k_no, int t_no, int s_no, int c_no) throws Exception{
		int pageNum = 1;//�׻� ù �������� ����ؾ��ϴϱ�
		if(pNum!=null){
			pageNum = Integer.parseInt(pNum);
		}
		
		int firstRow = (pageNum-1)*recordPerPage+1;
		int endRow = firstRow + recordPerPage-1;
		
		List<MeetingBean> mList = MeetingDao.getInstance().review(b_r_k_no, firstRow, endRow, t_no, s_no, c_no);		
		return mList;
	}
	//��ü ������ ���� ��ȯ�ϴ� ��ҵ�
	public int getTotalPage(int b_r_k_no, int t_no, int s_no, int c_no) throws Exception{
		//Db���� ��ü ���ڵ� ���� �˻�
		totalRecordCount = MeetingDao.getInstance().totalRecordCount(b_r_k_no, t_no, s_no, c_no);
		totalPageCount = totalRecordCount/recordPerPage;
		
		if(totalRecordCount % recordPerPage>0){
			totalPageCount++;
		}
		return totalPageCount;
	}
	
	public String getMeetingId(int m_no) throws Exception{
		String id = MeetingDao.getInstance().selectId(m_no);
		return id;
	}
}
