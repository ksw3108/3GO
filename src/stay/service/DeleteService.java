package stay.service;

import stay.model.stayDao;

public class DeleteService {
	private static DeleteService instance;
	
	private DeleteService(){}
	public static DeleteService getInstance() throws Exception{
		if(instance==null){
			instance = new DeleteService();
		}
		return instance;
	}
	public int delete(int s_no) throws Exception{//ªË¡¶
		stayDao dao= stayDao.getInstance();
		int delete = dao.stayDelete(s_no);
		return delete;
	}
}

