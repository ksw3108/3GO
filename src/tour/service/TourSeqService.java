package tour.service;

import java.util.List;

import tour.model.TourBean;
import tour.model.tourDao;

public class TourSeqService {
	private static TourSeqService instance;
		private TourSeqService(){}
	
	public static TourSeqService getInstance() throws Exception{
		if(instance==null){
			instance = new TourSeqService();
		}
		return instance;		
	}
	
	public List<TourBean> selectTourList(String num)throws Exception{
		tourDao dao = tourDao.getInstance();
		List<TourBean> list = dao.selectTourList(Integer.parseInt(num));
		
		return list;
	}
}
