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
	//������
	public void insert(FoodBean cook) throws Exception{//����
		
		foodDao dao= foodDao.getInstance();
		dao.cookInsert(cook);
	}
	
}
