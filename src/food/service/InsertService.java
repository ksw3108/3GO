package food.service;

import java.util.List;

import bean.*;
import food.model.FoodBean;
import food.model.foodDao;

public class InsertService {
	private static InsertService instance;
	
	private InsertService(){}
	public static InsertService getInstance() throws Exception{
		if(instance==null){
			instance = new InsertService();
		}
		return instance;
	}
	//관리자
	public void insert(FoodBean cook) throws Exception{//삽입
		
		foodDao dao= foodDao.getInstance();
		dao.cookInsert(cook);
	}
	
}
