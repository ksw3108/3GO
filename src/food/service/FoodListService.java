package food.service;

import java.util.List;

import food.model.FoodBean;
import food.model.foodDao;

public class FoodListService {
	private static FoodListService instance;
	
	private FoodListService(){}
	public static FoodListService getInstance() throws Exception{
		if(instance==null){
			instance = new FoodListService();
		}
		return instance;
	}
	//����
		public List<FoodBean> selectAllCook() throws Exception{//��ü �� ����
			foodDao dao = foodDao.getInstance();
			List<FoodBean> list = dao.selectCookList();
			return list;		
		}
}
