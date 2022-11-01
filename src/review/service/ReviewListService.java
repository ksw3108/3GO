package review.service;

import java.util.List;

import review.model.ReviewBean;
import review.model.ReviewDao;

public class ReviewListService {
	private static ReviewListService instance;
	public static ReviewListService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new ReviewListService();
		}
		return instance;
	}
	private int totalRecordCount;
	private int totalPageCount;
	private int recordPerPage=15;
	
	public List<ReviewBean> getReplyList(String group_no)throws Exception{
		List<ReviewBean> mList = ReviewDao.getInstance().reply(group_no);		
		return mList;
	}
	
	//원하는 페이지를 출력하는 메소드
	public List <ReviewBean> getReviewList(String pNum, int b_r_k_no, int t_no, int s_no, int c_no) throws Exception{
		int pageNum = 1;//항상 첫 페이지를 출력해야하니까
		if(pNum!=null){
			pageNum = Integer.parseInt(pNum);
		}
		
		int firstRow = (pageNum-1)*recordPerPage+1;
		int endRow = firstRow + recordPerPage-1;
		
		List<ReviewBean> mList = ReviewDao.getInstance().review(b_r_k_no, firstRow, endRow, t_no, s_no, c_no);		
		return mList;
	}
	//전체 페이지 수를 반환하는 페소드
	public int getTotalPage(int b_r_k_no, int t_no, int s_no, int c_no) throws Exception{
		//Db에서 전체 레코드 수를 검색
		totalRecordCount = ReviewDao.getInstance().totalRecordCount(b_r_k_no, t_no, s_no, c_no);
		totalPageCount = totalRecordCount/recordPerPage;
		
		if(totalRecordCount % recordPerPage>0){
			totalPageCount++;
		}
		return totalPageCount;
	}
	
	public String getReviewId(int m_no) throws Exception{
		String id = ReviewDao.getInstance().selectId(m_no);
		return id;
	}
}
