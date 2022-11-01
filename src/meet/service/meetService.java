package meet.service;

import java.sql.SQLException;
import java.util.*;
import meet.beans.*;

public class meetService {
	private static meetService instance;
	
	public static meetService getInstance() throws meetException {
		if( instance == null) {
			instance = new meetService();			
		}
		return instance;
	}
	
	public List<meet> getMeetSearch() throws meetException, SQLException {
		/*if( num != 0 ) {
			return meetDao.getInstance().meet(num);
		} else {
			return meetDao.getInstance().meet(num);
		}*/
		List<meet> tList = meetDao.getInstance().meet();
		return tList;
	}
}
