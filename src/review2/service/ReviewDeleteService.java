package review2.service;

import review.model.ReviewDao;

public class ReviewDeleteService {
	private static ReviewDeleteService instance;
	public static ReviewDeleteService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new ReviewDeleteService();
		}
		return instance;
	}
	
	public int delete( String id, String password ) throws Exception{
		
		// DB¿¡ delete
		int b_no = 0;
		if( id!=null ) b_no = Integer.parseInt( id );
		int result = ReviewDao.getInstance().delete(b_no, password);
	
		return result;
		
	}
}
