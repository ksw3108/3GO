package meeting.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Random;

import meeting.model.MeetingBean;
import meeting.model.MeetingDao;


public class MeetingWriteService {
	private static MeetingWriteService instance;
	private static Random random = new Random();
	
	public static MeetingWriteService getInstance()  throws Exception{
		if( instance == null )
		{
			instance = new MeetingWriteService();
		}
		return instance;
	}
	public MeetingBean write( MeetingBean rec, String kind ) throws Exception{
		
		MeetingDao dao = MeetingDao.getInstance();

		// 그룹번호(group_id) 지정
		int groupId = dao.getGroupId();
		rec.setGroup_no(groupId);
		
		// 순서번호(sequence_no) 지정(답글관련 정보)
		DecimalFormat dformat = new DecimalFormat("0000000000");
		rec.setSeq_no( dformat.format(groupId) + "999999");
		
		// DB에 insert
		int m_board_no = dao.insert(rec);
		
		// 자동으로 지정된 게시글번호 얻어와서 BoardRec에 지정
		rec.setm_board_no(m_board_no);
		/*insertReviewKindNo(m_board_no);*/
		return rec;		
	}
	public int findMemberNo(String id) throws Exception{
		int m_no=0;
		
		MeetingDao dao = MeetingDao.getInstance();
		m_no=dao.findMemberNo(id);
		
		return m_no;
	}
/*	public void insertReviewKindNo(int b_no) throws Exception{
		
		ReviewDao dao = ReviewDao.getInstance();
		dao.insertReviewKindNo(b_no);
	}*/
	
	public static String save( String directory, InputStream is ) throws IOException
	{
		
		long currentTime = System.currentTimeMillis();
		int randomValue = random.nextInt(50);
		String fileName = Long.toString(currentTime) + "_" + Integer.toString(randomValue)+".jpg";
		File file = new File( directory, fileName );
		long fileSize = 0;
		boolean isZero=false;
		FileOutputStream os = null;
		try{			
			os = new FileOutputStream( file );
			byte[] data = new byte[8096];
			int len = -1;
			while( (len = is.read(data)) != -1 ){
				os.write(data, 0, len);				
			}
			
			if(file.exists()){
				fileSize = file.length();
				
			}
		} finally{
			if( os!= null ) try{ os.close(); } catch( IOException es ){}
		}
		if(fileSize==0){
			return "";
		}else{
			return "uploadImage/"+fileName;
		}
	}
	
}
