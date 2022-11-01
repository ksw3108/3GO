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
	//유저
		public List<FoodBean> selectAllCook() throws Exception{//전체 행 추출
			foodDao dao = foodDao.getInstance();
			List<FoodBean> list = dao.selectCookList();
			return list;		
		}
}
