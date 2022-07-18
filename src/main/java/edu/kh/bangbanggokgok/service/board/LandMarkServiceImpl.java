package edu.kh.bangbanggokgok.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.bangbanggokgok.common.Util;
import edu.kh.bangbanggokgok.dao.board.LandMarkDAO;
import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.LandMarkIMG;
import edu.kh.bangbanggokgok.vo.board.Location;

@Service
public class LandMarkServiceImpl implements LandMarkService{
	
	@Autowired
	private LandMarkDAO dao;
	
	// 랜드마크 특정 지역 목록 조회
	@Override
	public Map<String, Object> selectLandMarkList(int locationType) {
		
//		int ListCount = dao.getListCount(locationType);
		
		List<LandMark> landMarkList = dao.selectLandMarkList(locationType);
		
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("ListCount",ListCount);
		map.put("landMarkList",landMarkList);
		
		return map;
	}
	
	// 랜드마크 전체 목록 조회
	@Override
	public Map<String, Object> selectAllLandMarkList() {
		
		
//		int ListCount = dao.getListCount();
		
		List<LandMarkIMG> landMakrImage = dao.selectLandMakrIMG();
		
//		List<LandMark> landMarkList = dao.selectAllLandMarkList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
//		map.put("ListCount", ListCount);
		map.put("landMakrImage", landMakrImage);
//		map.put("landMarkList", landMarkList);
		
		
		return map;
	}
	
	
	//랜드마크 상세 조회
	@Override
	public LandMarkDetail selectLandMakrDetail(int landMakrNo) {
		return dao.selectLandMakrDetail(landMakrNo);
	}

	// 게시글,이미지 삽입
	@Override
	public int insertLandMark(LandMarkDetail detail, List<MultipartFile> imageList, String webPath, String folderPath) {
		
		
		// XSS 방지
		detail.setLandMarkName( Util.XSSHandling(detail.getLandMarkName()) );
		detail.setLandMarkContent( Util.XSSHandling(detail.getLandMarkContent()) );
		detail.setLandMarkContent( Util.newLineHandling(detail.getLandMarkContent()) );
		
		int landMarkNo = dao.insetLandMark(detail);
		
		if(landMarkNo > 0) {
			
			
		}
		
		
		return 0;
	}




}
