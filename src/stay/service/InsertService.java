package stay.service;

import java.util.List;

import bean.*;
import stay.model.StayBean;
import stay.model.stayDao;

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
	public void insert(StayBean stay) throws Exception{//����
		
		stayDao dao= stayDao.getInstance();
		dao.stayInsert(stay);
	}
	
}
