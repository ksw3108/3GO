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
	//����
	public List<TourBean> selectAllTour() throws Exception{//��ü �� ����
		tourDao dao = tourDao.getInstance();
		List<TourBean> list = dao.selectTourList();
		return list;		
	}
}
