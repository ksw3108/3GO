package review.service;

import java.sql.DriverManager;
import java.text.DecimalFormat;
import java.util.Date;

import review.model.ReviewBean;
import review.model.ReviewDao;


public class ReviewReplyService {
	private static ReviewReplyService instance;
	public static ReviewReplyService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new ReviewReplyService();
		}
		return instance;
	}
	public ReviewBean reply( String pId,  ReviewBean rec ) throws Exception{
		
		// �Ѱܹ��� �θ�Խñ��� int������ ��ȯ
		int parentId = 0;
		if( pId != null ) parentId = Integer.parseInt( pId );

		ReviewDao dao = ReviewDao.getInstance();
		// �θ�Խñ��� ���ڵ带 ����
		ReviewBean parent = dao.selectById(parentId);
		
		// �θ�Խñ��� üũ
		checkParent(parent, parentId);
		
		// �亯�ۿ� ������ȣ ���ϱ�**** 1.�θ� �۹�ȣ �˱�. 2. �� �ڽĵ��� ���� ���� �� �ޱ� 
		String maxSeqNum = parent.getSeq_no();
		String minSeqNum = getSearchMinSeqNum( parent );
		
		String lastChildSeq = dao.selectLastSequenceNumber( maxSeqNum, minSeqNum );
		
		String sequenceNumber = getSequenceNumber( parent,lastChildSeq);//���� ������ ��ȣ ã�ƿ��� �Լ�
		
		
		rec.setGroup_no(parent.getGroup_no()); // �θ��� �׷��ȣ�� �����ϰ� ����
		rec.setSeq_no(sequenceNumber);	 // ������ ���� �亯���� ������ȣ ����
		rec.setB_date( (new Date()).toString());	 // �����
		
		boolean b_no = dao.isnertComment(rec);
		rec.setB_no(b_no);
		
		return rec;
		
	}
	
	public int getReplyCount(int group_no) throws Exception{
		int count=ReviewDao.getInstance().getReplyCount(group_no);
		return count;
	}
	
	/*
	 * �θ���� �����ϴ��� �θ���� ������ 3�ܰ����� Ȯ���ϴ� �Լ�
	 */
	private void checkParent( ReviewBean parent, int pId ) throws Exception
	{
		
		if( parent == null ) throw new Exception("�θ���� �������� ���� : " + pId );
		
		int parentLevel = parent.getLevel();
		if( parentLevel == 3 ) throw new Exception("3�ܰ� ������ ���� �ۿ��� �亯�� �� �� �����ϴ�.");	
	}
	
	
	private String getSearchMinSeqNum( ReviewBean parent )
	{
		String parentSeqNum = parent.getSeq_no();
		DecimalFormat dFormat = new DecimalFormat("0000000000000000");
		long parentSeqLongValue = Long.parseLong(parentSeqNum);
		long searchMinLongValue = 0;
		
		switch( parent.getLevel())
		{
		case 0 : searchMinLongValue = parentSeqLongValue / 1000000L * 1000000L; break;
		case 1 : searchMinLongValue = parentSeqLongValue / 10000L * 10000L; break;
		case 2 : searchMinLongValue = parentSeqLongValue / 100L * 100L; break;
		}
		return dFormat.format(searchMinLongValue);
	}
	
	
	private String getSequenceNumber( ReviewBean parent, String lastChildSeq ) throws Exception
	{
		long parentSeqLong	= Long.parseLong( parent.getSeq_no());
		int  parentLevel	= parent.getLevel();
		
		long decUnit = 0;
		if		( parentLevel == 0 ){	decUnit = 10000L;	}
		else if	( parentLevel == 1 ){	decUnit = 100L;		}
		else if ( parentLevel == 2 ){	decUnit = 1L;		}
		
		String sequenceNumber = null;
		
		DecimalFormat dFormat = new DecimalFormat("0000000000000000");
		if( lastChildSeq == null ){			// �亯���� ���ٸ�
			sequenceNumber = dFormat.format(parentSeqLong-decUnit);
		} else {							// �亯���� �ִٸ�, ������ �亯������ Ȯ��
			String orderOfLastChildSeq = null;
			if( parentLevel == 0 ){
				orderOfLastChildSeq = lastChildSeq.substring(10,12);
				sequenceNumber = lastChildSeq.substring(0, 12) + "9999";
			}else if( parentLevel == 1 ){
				orderOfLastChildSeq = lastChildSeq.substring(12,14);
				sequenceNumber = lastChildSeq.substring(0, 14) + "99";				
			}else if( parentLevel == 2 ){
				orderOfLastChildSeq = lastChildSeq.substring(14,16);
				sequenceNumber = lastChildSeq;			
			}
			
			if( orderOfLastChildSeq.equals("00")){
				throw new Exception("������ �ڽ� ���� �̹� �����մϴ�.");
			}
			
			long seq = Long.parseLong(sequenceNumber) - decUnit;
			sequenceNumber = dFormat.format(seq);
			
			return sequenceNumber; 
		}
		return sequenceNumber;
		
	}
}
