package edu.kh.bangbanggokgok.service.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.Pagination2;


public interface LandMarkService {
	
	
	
	/** 랜드마크 특정 지역 목록 조회 서비스
	 * @param locationType
	 * @return map
	 */
	List<LandMark> selectLandMarkList(int locationType, int pageNo);

	/** 랜드마크 전체 목록 조회 서비스
	 * @param num 
	 * @return
	 */
	Map<String, Object> selectAllLandMarkList(int num);
	
	
	/** 랜드마크 상세조회 서비스
	 * @param landMakrNo
	 * @return
	 */
	LandMarkDetail selectLandmarkDetail(int landMarkNo);
	
	
	/** 랜드마크 삽입 서비스
	 * @param detail
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return landMarkNo
	 */
	int insertLandMark(LandMarkDetail detail, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException;

	/** 랜드마크 수정 서비스
	 * @param detail
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @param deleteList
	 * @return result
	 * @throws IOException
	 */
	int updateLandMark(LandMarkDetail detail, List<MultipartFile> imageList, String webPath, String folderPath,
			String deleteList) throws IOException;


	int landmarkBookmarkInsert(String loginNo, String landmarkNo);

	int landmarkBookmarkDelete(String loginNo, String landmarkNo);

	int landmarkBookmark(String loginNo, String landmarkNo);

	double rankLandmark(int landmarkNo);

	double insertRankPoint(String rankPoint, String userNo, int landmarNo);

	double deleteRankPoint(String userNo, int landmarNo);

	int addPointCheck(int landmarkNo, int userNo);

//	int getListCount(int locationType);

	List<LandMark> rankLandMarkList(int locationType);

	int selectLandmarkCount(int locationType);
	
	/** 랜드마크 삭제
	 * @param landmarkNo
	 * @return
	 */
	int deleteLandmark(int landmarkNo);
	
}
