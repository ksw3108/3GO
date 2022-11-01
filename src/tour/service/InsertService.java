package tour.service;

import java.util.List;

import tour.model.TourBean;
import tour.model.tourDao;

public class InsertService {
	
	private static InsertService instance;
	
	private InsertService(){}
	public static InsertService getInstance() throws Exception{
		if(instance==null){
			instance = new InsertService();
		}
		return instance;
	}
	//������
	public void insert(TourBean tour) throws Exception{//����
		
		tourDao dao= tourDao.getInstance();
		dao.tourInsert(tour);
	}
}
