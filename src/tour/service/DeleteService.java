package tour.service;

import tour.model.tourDao;

public class DeleteService {
	private static DeleteService instance;
	
	private DeleteService(){}
	public static DeleteService getInstance() throws Exception{
		if(instance==null){
			instance = new DeleteService();
		}
		return instance;
	}
	public int delete(int t_no) throws Exception{//ªË¡¶
		tourDao dao= tourDao.getInstance();
		int delete = dao.tourDelete(t_no);
		return delete;
	}
}
