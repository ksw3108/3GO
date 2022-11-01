package review2.service;

import review2.model.ReviewBean;
import review2.model.ReviewDao;

public class ReviewModifyService {
	private static ReviewModifyService instance;
	public static ReviewModifyService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new ReviewModifyService();
		}
		return instance;
	}
	
	public int update( ReviewBean rec ) throws Exception{
		
		// DB¿¡ update
		int result = ReviewDao.getInstance().update(rec);
	
		return result;
		
	}
}
