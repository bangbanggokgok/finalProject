//package edu.kh.bangbanggokgok.dao.board;
//
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.RowBounds;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import edu.kh.bangbanggokgok.service.board.MoveLineType;
//import edu.kh.bangbanggokgok.vo.board.MoveLine;
//
//public class MoveLineDAO {
//
//	@Autowired 
//	private SqlSessionTemplate sqlSession;
//	
//	
//	
//	/** 코스별 목록 조회 DAO
//	 * @param pagination
//	 * @param boardCode
//	 * @return boardList
//	 */
//	public List<MoveLine> selectMoveLineList(pagination, locationType) {
//		
//		// RowBounds 객체(마이바티스)
//		// - 전체 조회 결과에서
//		//   몇 개의 행을 건너 뛰고(offset)
//		//   그 다음 몇 개의 행만(limit) 조회할 것인지 지정
//		
//		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();
//		
//		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
//		
//		return sqlSession.selectList("movelineMapper.selectMoveLineList", boardCode, rowBounds);
//	}
//
//	
//	/** 지역별 코스 전체 게시글 수 조회 DAO
//	 * @param locationType
//	 * @return listCount
//	 */
//	public int getListCount(int locationType) {
//
//		return sqlSession.selectOne("moveLineMapper.getListCount", locationType);
//	}
//
//
//	/** 지역 타입,이름 조회 DAO
//	 * @return moveLineList
//	 */
//	public List<Locations> selectMLTypeList() {
//		return sqlSession.selectList("MoveLineMapper.selectMLTypeList");
//	}
//
////	/** 검색 조건에 맞는 게시글 목록의 전체 개수 조회 DAO
////	 * @param paramMap
////	 * @return listCount
////	 */ 
////	public int searchListCount(Map<String, Object> paramMap) {
////		return sqlSession.selectOne("moveLineMapper.searchListCount", paramMap);
////	}
//
//	
//
//}