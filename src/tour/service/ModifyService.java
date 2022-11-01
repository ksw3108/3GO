package tour.service;

import tour.model.TourBean;
import tour.model.tourDao;

public class ModifyService {
	private static ModifyService instance;
	
	private ModifyService(){}
	public static ModifyService getInstance() throws Exception{
		if(instance==null){
			instance = new ModifyService();
		}
		return instance;
	}
	public int update(TourBean tour) throws Exception{//¼öÁ¤
		tourDao dao= tourDao.getInstance();
		int update = dao.tourUpdate(tour);
		return update;
	}
	
}
