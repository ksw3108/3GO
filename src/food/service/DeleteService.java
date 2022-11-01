package food.service;

import food.model.foodDao;

public class DeleteService {
	private static DeleteService instance;
	
	private DeleteService(){}
	public static DeleteService getInstance() throws Exception{
		if(instance==null){
			instance = new DeleteService();
		}
		return instance;
	}
	public int delete(int c_no) throws Exception{//ªË¡¶
		foodDao dao= foodDao.getInstance();
		int delete = dao.cookDelete(c_no);
		return delete;
	}
	
}
