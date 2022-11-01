package tour.service;

import java.util.List;

import tour.model.TourBean;
import tour.model.tourDao;

public class TourListService {
	private static TourListService instance;
	
	private TourListService(){}
	public static TourListService getInstance() throws Exception{
		if(instance==null){
			instance = new TourListService();
		}
		return instance;
	}
	//유저
	public List<TourBean> selectAllTour() throws Exception{//전체 행 추출
		tourDao dao = tourDao.getInstance();
		List<TourBean> list = dao.selectTourList();
		return list;		
	}
}
