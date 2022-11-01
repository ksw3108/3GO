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
	//관리자
	public void insert(StayBean stay) throws Exception{//삽입
		
		stayDao dao= stayDao.getInstance();
		dao.stayInsert(stay);
	}
	
}
