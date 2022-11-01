package stay.service;

import stay.model.StayBean;
import stay.model.stayDao;

public class ModifyService {
	private static ModifyService instance;
	
	private ModifyService(){}
	public static ModifyService getInstance() throws Exception{
		if(instance==null){
			instance = new ModifyService();
		}
		return instance;
	}
	public int update(StayBean stay) throws Exception{//¼öÁ¤
		stayDao dao= stayDao.getInstance();
		int update = dao.stayUpdate(stay);
		return update;
	}
}
