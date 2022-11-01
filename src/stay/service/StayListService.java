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
	//유저
	public List<StayBean> selectAllTour() throws Exception{//전체 행 추출
		stayDao dao = stayDao.getInstance();
		List<StayBean> list = dao.selectStayList();
		return list;		
	}
}
