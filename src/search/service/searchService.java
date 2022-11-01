package search.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import search.beans.searchCook;
import search.beans.searchDao;
import search.beans.searchException;
import search.beans.searchStay;
import search.beans.searchTour;

public class searchService {
	private static searchService instance;
	
	public static searchService getInstance()  throws searchException{
		if( instance == null )
		{
			instance = new searchService();
		}
		return instance;
	}
	
	public List<Object> getSearchMain(String map, String tour, String cook, String stay) throws searchException, SQLException {
		
		List<Object> total = new ArrayList<>();
		
		if(Integer.parseInt(tour)!=0){
			List<searchTour> tList = searchDao.getInstance().searchTour(map, tour);
			total.add(tList);
		} else {
			total.add(0);
		}
		
		if(Integer.parseInt(cook)!=0) {
			List<searchCook> cList = searchDao.getInstance().searchCook(map, cook);
			total.add(cList);
		} else {
			total.add(0);
		}
		
		if(Integer.parseInt(stay)!=0) {
			List<searchStay> sList = searchDao.getInstance().searchStay(map, stay);
			total.add(sList);
		} else {
			total.add(0);
		}
	
		return total;
	}
	
	public List<searchTour> getSearchTourRank(int rank) throws searchException, SQLException {
		
		//List<Object> total = new ArrayList<>();
		
		if(rank != 0){
			
			return  searchDao.getInstance().searchTourRank(rank);
			//total.add(tList);
		}else{
		//return total;
			
			return searchDao.getInstance().searchTourRank(rank);
		}
	}
	
	public List<searchTour> getSearchTour(int num) throws searchException, SQLException {
		
		//List<Object> total = new ArrayList<>();
		
		if(num != 0){
			
			return  searchDao.getInstance().searchTour(num);
			//total.add(tList);
		}else{
		//return total;
			
			return searchDao.getInstance().searchTour(num);
		}
	}

	public List<searchCook> getSearchFoodRank(int rank) throws searchException, SQLException {
		
		if(rank != 0) {
			return searchDao.getInstance().searchFoodRank(rank);
		}else{
			return searchDao.getInstance().searchFoodRank(rank);
		}
	}
	
	public List<searchCook> getSearchFood(int num) throws searchException, SQLException {
		
		if(num != 0) {
			return searchDao.getInstance().searchFood(num);
		}else{
			return searchDao.getInstance().searchFood(num);
		}
	}
	
	public List<searchStay> getSearchStayRank(int rank) throws searchException, SQLException {
		
		if(rank != 0) {
			return searchDao.getInstance().searchStayRank(rank);
		}else{
			return searchDao.getInstance().searchStayRank(rank);
		}
	}
	
	public List<searchStay> getSearchStay(int num) throws searchException, SQLException {
		
		if(num != 0) {
			return searchDao.getInstance().searchStay(num);
		}else{
			return searchDao.getInstance().searchStay(num);
		}
	}
}
