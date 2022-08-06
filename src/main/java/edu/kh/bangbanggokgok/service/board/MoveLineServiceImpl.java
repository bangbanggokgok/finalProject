package edu.kh.bangbanggokgok.service.board;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bangbanggokgok.common.Util;
import edu.kh.bangbanggokgok.dao.board.MoveLineDAO;
import edu.kh.bangbanggokgok.exception.InsertFailException;
import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.LandMarkIMG;
import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.board.MoveLineList;
import edu.kh.bangbanggokgok.vo.board.Pagination;
import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;
import edu.kh.bangbanggokgok.vo.image.MoveLineImage;

@Service
public class MoveLineServiceImpl implements MoveLineService{


	@Autowired
	private MoveLineDAO dao;

	// 코스 메인 - 지역 구분 조회 서비스 구현
	@Override
	public List<Location> selectLocation() {
		return dao.selectLocation();
	}
	
	// 특정 지역 코스 목록 조회 서비스 구현
	@Override
	public Map<String, Object> selectLocationList(int cp, int locationNum) {
		
		// 특정 지역 코스 수 조회 DAO 및 페이지네이션 객체 생성
		int listCount = dao.locationListCount(locationNum);
		Pagination pagination = new Pagination(cp, listCount);
		
		// 특정 지역 코스 목록 조회
		List<MoveLineList> listBylocation = dao.selectLocationList(pagination, locationNum);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("movelineList", listBylocation);
		
		return map;
	
	}


	// 특정 해시태그 목록 조회 서비스
	@Override
	public Map<String, Object> selectHashTagList(Map<String, Object> paramMap) {
		
		// 특정 해시태그 코스 수 조회 DAO 및 페이지네이션 객체 생성
		int listCount = dao.hashTagListCount(paramMap);
		Pagination pagination = new Pagination((int)paramMap.get("cp"), listCount);
		
		// 특정 해시태그 목록 조회
		List<MoveLineList> listByHashTag = dao.selectHashTagList(paramMap, pagination);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("movelineList", listByHashTag);
		
		return map;
		
	}


	// 코스 메인 - 랜덤 해시태그 10개 조회 서비스
	@Override
	public List<MoveLineHashTag> selectMoveLineMain() {
		return dao.selectMoveLineMain();
	}

	
	// 코스 메인 - 최신 코스 3개 조회
	@Override
	public List<MoveLineDetail> selectMoveLineMain2() {
		return dao.selectMoveLineMain2();
	}


	// 코스 테마별 목록 조회
	@Override
	public Map<String, Object> selectMovelineTheme(Map<String, Object> paramMap) {
		
		int listCount = dao.themeListCount(paramMap);
		Pagination pagination = new Pagination((int)paramMap.get("cp"), listCount);
		
		List<MoveLineList> listByTheme = dao.selectMovelineTheme(paramMap, pagination);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("movelineList", listByTheme);
		
		return map;
	}


	// 코스 전체 목록 조회
	@Override
	public Map<String, Object> selectAll(Map<String, Object> paramMap) {
		
		int listCount = dao.allListCount(paramMap);
		
		Pagination pagination = new Pagination((int)paramMap.get("cp"), listCount);
		
		List<MoveLineList> listByAll = dao.selectMovelineTheme(paramMap, pagination);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("movelineList", listByAll);

		return map;
	}


	// 코스 상세 페이지 - 단건
	@Override
	public MoveLineDetail selectMovelineDetail(int movelineNo) {
		
		return dao.selectMovelineDetail(movelineNo);
	}
	
	// 코스 상세 페이지 - 랜드마크 상세
	@Override
	public List<LandMarkDetail> selectLandmarkDetail(int movelineNo) {
		return dao.selectLandmarkDetail(movelineNo);
	}

	// 코스 상세 페이지 - 랜드마크 이미지 리스트
	@Override
	public List<LandMarkIMG> selectLandmarkImage(int movelineNo) {
		return dao.selectLandmarkImage(movelineNo);
	}

	// 코스 상세 페이지 - 코스 이미지 리스트
	@Override
	public List<MoveLineImage> selectMovelineImage(int movelineNo) {
		return dao.selectMovelineImage(movelineNo);
	}

	// 코스 상세 페이지 - 코스 해시태그 리스트
	@Override
	public List<MoveLineHashTag> selectMovelineHashtag(int movelineNo) {
		return dao.selectMovelineHashtag(movelineNo);
	}

	// 클릭된 랜드마크 이름 세팅
	@Override
	public String setLandmarkName(int landmarkNo) {
		return dao.setLandmarkName(landmarkNo);
	}

	// 특정 지역에 따른 랜드마크 조회
	@Override
	public List<LandMark> connectLocation(String locationName) {
		return dao.connectLocation(locationName);
	}


	// 게시글 삭제 서비스 구현
	@Override
	public int deleteMoveline(int movelineNo) {
		return dao.deleteMoveline(movelineNo);
	}

	// 특정 랜드마크 이미지 세팅 목록 조회 구현
	@Override
	public List<LandMarkDetail> setLandmarkImages(int landMarkNo) {
		return dao.setLandmarkImages(landMarkNo);
	}

	// 특정 랜드마크 내용 세팅 목록 조회 서비스
	@Override
	public String setLandmarkContent(int landmarkNo) {
		return dao.setLandmarkContent(landmarkNo);
	}

	
	// 코스 즐겨찾기 조회
	@Override
	public int movelineBookmark(String loginNo, String movelineNo) {
		Map<String, String> infoB = new HashMap<String, String>();
		infoB.put("loginNo", loginNo);
		infoB.put("movelineNo", movelineNo);
		return dao.movelineBookmark(infoB);
	}

	// 코스 즐겨찾기 추가
	@Override
	public int movelineBookmarkInsert(String loginNo, String movelineNo) {
		Map<String, String> infoB = new HashMap<String, String>();
		infoB.put("loginNo", loginNo);
		infoB.put("movelineNo", movelineNo);
		return dao.movelineBookmarkInsert(infoB);
	}

	// 코스 즐겨찾기 삭제
	@Override
	public int movelineBookmarkDelete(String loginNo, String movelineNo) {
		Map<String, String> infoA = new HashMap<String, String>();
		infoA.put("loginNo", loginNo);
		infoA.put("movelineNo", movelineNo);
		return dao.movelineBookmarkDelete(infoA);
	}


	@Override
	public int insertIndex(int[] indexArray, int movelineNumber) {
		Map<String, Integer> indexParam = new HashMap<String, Integer>();
		indexParam.put("movelineNo", movelineNumber);
		int result = 0;
		for(int i=0;i<indexArray.length;i++) {
			indexParam.put("landmarkNo",indexArray[i]);
			indexParam.put("indexNo", i);
			result += dao.insertIndex(indexParam);
		}	
		return result;
	}

	
	@Override
	public int insertMoveline(Map<String, String> param,
							  List<MultipartFile> imageList,
							  String hashList,
							  int userNo, String webPath,
							  String folderPath) throws IOException{
		
		param.put("userNo", Integer.toString(userNo));
		
		int movelineNumber = dao.insertMoveline(param);
		
		if (movelineNumber > 0) {
			
			List<MoveLineImage> MoveLineImageList = new ArrayList<MoveLineImage>();
			List<String> reNameList = new ArrayList<String>();

			for (int i = 0; i < imageList.size(); i++) {

				if (imageList.get(i).getSize() > 0) {

					// 변경된 파일명 저장
					String reName = Util.fileRename(imageList.get(i).getOriginalFilename());
					reNameList.add(reName);

					MoveLineImage img = new MoveLineImage();
					img.setMovelineNo(movelineNumber); // 게시글 번호
					img.setMovelineLevel(i); // 이미지 순서(파일 레벨)
					img.setMovelineRename(webPath + reName); // 웹 접근 경로 + 변경된 파일명

					MoveLineImageList.add(img);
				}
			}
			
			if(!MoveLineImageList.isEmpty()) {
				
				int result = dao.insertMoveLineImageList(MoveLineImageList);
						
				if(result == MoveLineImageList.size()) {
					
					// 서버저장
					
					for(int i = 0; i < MoveLineImageList.size(); i++) {
						
						int index = MoveLineImageList.get(i).getMovelineLevel();
					
						imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
				
					}
					
				} else { // 이미지 삽입 실패
	
					throw new InsertFailException();
				}
			}
			
			String[] hashArr = hashList.split("#");
			
			for (int i = 1; i < hashArr.length; i++) {
				Map<String, Object> hash = new HashMap<String, Object>();
				hash.put("MLHashTag", hashArr[i]);
				hash.put("movelineNo", movelineNumber);
				
				int result = dao.insertHashTag(hash);
			}
		}
	
		return movelineNumber;
	}




}
