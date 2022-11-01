package review2.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Random;

import review2.model.ReviewBean;
import review2.model.ReviewDao;

public class ReviewWriteService {
	private static ReviewWriteService instance;
	private static Random random = new Random();

	public static ReviewWriteService getInstance() throws Exception {
		if (instance == null) {
			instance = new ReviewWriteService();
		}
		return instance;
	}

	public ReviewBean write(ReviewBean rec, String kind) throws Exception {

		ReviewDao dao = ReviewDao.getInstance();

		// �׷��ȣ(group_id) ����
		int groupId = dao.getGroupId();
		rec.setGroup_no(groupId);

		// ������ȣ(sequence_no) ����(��۰��� ����)
		DecimalFormat dformat = new DecimalFormat("0000000000");
		rec.setSeq_no(dformat.format(groupId) + "999999");

		// DB�� insert
		int m_board_no = dao.insert(rec);

		// �ڵ����� ������ �Խñ۹�ȣ ���ͼ� BoardRec�� ����
		rec.setm_board_no(m_board_no);
		/* insertReviewKindNo(m_board_no); */
		return rec;
	}

	public int findMemberNo(String id) throws Exception {
		int m_no = 0;

		ReviewDao dao = ReviewDao.getInstance();
		m_no = dao.findMemberNo(id);

		return m_no;
	}
	/*
	 * public void insertReviewKindNo(int b_no) throws Exception{
	 * 
	 * ReviewDao dao = ReviewDao.getInstance(); dao.insertReviewKindNo(b_no); }
	 */

	public static String save(String directory, InputStream is) throws IOException {

		long currentTime = System.currentTimeMillis();
		int randomValue = random.nextInt(50);
		String fileName = Long.toString(currentTime) + "_" + Integer.toString(randomValue) + ".jpg";
		File file = new File(directory, fileName);
		long fileSize = 0;
		boolean isZero = false;
		FileOutputStream os = null;
		try {
			os = new FileOutputStream(file);
			byte[] data = new byte[8096];
			int len = -1;
			while ((len = is.read(data)) != -1) {
				os.write(data, 0, len);
			}

			if (file.exists()) {
				fileSize = file.length();

			}
		} finally {
			if (os != null)
				try {
					os.close();
				} catch (IOException es) {
				}
		}
		if (fileSize == 0) {
			return "";
		} else {
			return "uploadImage/" + fileName;
		}
	}

	public boolean isnertComment(ReviewBean rec) throws Exception {
		return ReviewDao.getInstance().isnertComment(rec);
	}

}