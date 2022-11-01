package stay.service;

import java.util.List;

import stay.model.StayBean;
import stay.model.stayDao;

public class StayListService {
private static StayListService instance;
	
	private StayListService(){}
	public static StayListService getInstance() throws Exception{
		if(instance==null){
			instance = new StayListService();
		}
		return instance;
	}
	//����
	public List<StayBean> selectAllTour() throws Exception{//��ü �� ����
		stayDao dao = stayDao.getInstance();
		List<StayBean> list = dao.selectStayList();
		return list;		
	}
}
