package food.service;

import food.model.FoodBean;
import food.model.foodDao;

public class ModifyService {
	private static ModifyService instance;
	
	private ModifyService(){}
	public static ModifyService getInstance() throws Exception{
		if(instance==null){
			instance = new ModifyService();
		}
		return instance;
	}
	public int update(FoodBean cook) throws Exception{//¼öÁ¤
		foodDao dao= foodDao.getInstance();
		int update = dao.cookUpdate(cook);
		return update;
	}
}
