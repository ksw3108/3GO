package tour.service;
import tour.model.TourBean;
import tour.model.tourDao;

public class TourViewService {
	private static TourViewService instance;
	
	private TourViewService(){}
	public static TourViewService getInstance() throws Exception{
		if(instance==null){
			instance = new TourViewService();
		}
		return instance;
	}
	public TourBean selectTour(String t_no) throws Exception{
		
		tourDao dao = tourDao.getInstance();
		TourBean tour = dao.selectTour(Integer.parseInt(t_no));
		return tour;
	}
}
