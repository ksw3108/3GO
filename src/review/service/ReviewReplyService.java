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
		
		// 넘겨받은 부모게시글을 int형으로 변환
		int parentId = 0;
		if( pId != null ) parentId = Integer.parseInt( pId );

		ReviewDao dao = ReviewDao.getInstance();
		// 부모게시글의 레코드를 얻어옴
		ReviewBean parent = dao.selectById(parentId);
		
		// 부모게시글을 체크
		checkParent(parent, parentId);
		
		// 답변글에 순서번호 구하기**** 1.부모 글번호 알기. 2. 그 자식들중 가장 작은 값 받기 
		String maxSeqNum = parent.getSeq_no();
		String minSeqNum = getSearchMinSeqNum( parent );
		
		String lastChildSeq = dao.selectLastSequenceNumber( maxSeqNum, minSeqNum );
		
		String sequenceNumber = getSequenceNumber( parent,lastChildSeq);//최종 시퀀스 번호 찾아오는 함수
		
		
		rec.setGroup_no(parent.getGroup_no()); // 부모의 그룹번호와 동일하게 지정
		rec.setSeq_no(sequenceNumber);	 // 위에서 구한 답변글의 순서번호 지정
		rec.setB_date( (new Date()).toString());	 // 등록일
		
		boolean b_no = dao.isnertComment(rec);
		rec.setB_no(b_no);
		
		return rec;
		
	}
	
	public int getReplyCount(int group_no) throws Exception{
		int count=ReviewDao.getInstance().getReplyCount(group_no);
		return count;
	}
	
	/*
	 * 부모글이 존재하는지 부모글이 마지막 3단계인지 확인하는 함수
	 */
	private void checkParent( ReviewBean parent, int pId ) throws Exception
	{
		
		if( parent == null ) throw new Exception("부모글이 존재하지 않음 : " + pId );
		
		int parentLevel = parent.getLevel();
		if( parentLevel == 3 ) throw new Exception("3단계 마지막 레벨 글에는 답변을 달 수 없습니다.");	
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
		if( lastChildSeq == null ){			// 답변글이 없다면
			sequenceNumber = dFormat.format(parentSeqLong-decUnit);
		} else {							// 답변글이 있다면, 마지막 답변글인지 확인
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
				throw new Exception("마지막 자식 글이 이미 존재합니다.");
			}
			
			long seq = Long.parseLong(sequenceNumber) - decUnit;
			sequenceNumber = dFormat.format(seq);
			
			return sequenceNumber; 
		}
		return sequenceNumber;
		
	}
}
