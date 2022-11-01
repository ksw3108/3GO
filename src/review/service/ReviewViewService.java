package review.service;

import review.model.ReviewBean;
import review.model.ReviewDao;

public class ReviewViewService {
	private static ReviewViewService instance;
	public static ReviewViewService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new ReviewViewService();
		}
		return instance;
	}
	
	public ReviewBean getReviewById(String id, boolean isModify) throws Exception
	{
		int b_no = 0;
		if( id != null ) b_no = Integer.parseInt(id);
		ReviewDao dao = ReviewDao.getInstance();
		ReviewBean rec = dao.selectById(b_no);		
		
		if(!isModify){
			dao.increaseReadCount(b_no);
		}
		return rec;
	}
}
