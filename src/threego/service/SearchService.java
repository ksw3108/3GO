package threego.service;

import java.sql.SQLException;
import java.util.List;

import threego.beans.FoodRec;
import threego.beans.StayRec;
import threego.beans.ThreeGoDao;
import threego.beans.ThreeGoException;
import threego.beans.TourRec;

public class SearchService {
	private static SearchService instance;
	public static SearchService getInstance()  throws ThreeGoException{
		if( instance == null )
		{
			instance = new SearchService();
		}
		return instance;
	}
	
	
	
	/*Tour*/
	public List <TourRec> getArticleList_Tour(String num, String[] name) throws ThreeGoException
	{
		// ��ü ���ڵ带 �˻��� �´ٸ�
		
		 List <TourRec> mList = ThreeGoDao.getInstance().selectSearch_Tour(num, name); 
		 
		
		 return mList;
	}
	
	/*Food*/
	public List <FoodRec> getArticleList_Food(String num, String[] name) throws ThreeGoException
	{
		// ��ü ���ڵ带 �˻��� �´ٸ�
		
		 List <FoodRec> mList = ThreeGoDao.getInstance().selectSearch_Food(num, name); 
		 
		
		 return mList;
	}

	
	/*Stay*/
	public List <StayRec> getArticleList_Stay(String num, String[] name) throws ThreeGoException
	{
		// ��ü ���ڵ带 �˻��� �´ٸ�
		
		 List <StayRec> mList = ThreeGoDao.getInstance().selectSearch_Stay(num, name); 
		 
		
		 return mList; 
	}
	
	/*     ��ü ���� ������      */
public List<TourRec> getSearchTour(int num) throws ThreeGoException, SQLException{
		
		//List<Object> total = new ArrayList<>();
		
		if(num != 0){
			
			return  ThreeGoDao.getInstance().searchTour(num);
			//total.add(tList);
		}else{
		//return total;
			
			return ThreeGoDao.getInstance().searchTour(num);
		}
	}

public List<FoodRec> getSearchFood(int num) throws ThreeGoException, SQLException {
	
	if(num != 0) {
		return ThreeGoDao.getInstance().searchFood(num);
	}else{
		return ThreeGoDao.getInstance().searchFood(num);
	}
}

public List<StayRec> getSearchStay(int num) throws ThreeGoException, SQLException {
	
	if(num != 0) {
		return ThreeGoDao.getInstance().searchStay(num);
	}else{
		return ThreeGoDao.getInstance().searchStay(num);
	}
}
	
	
}
