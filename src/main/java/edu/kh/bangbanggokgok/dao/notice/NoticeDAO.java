package edu.kh.bangbanggokgok.dao.notice;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.notice.Notice;
import edu.kh.bangbanggokgok.vo.notice.Pagination;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}


	/** 공지사항 목록 조회 DAO
	 * @param pagination
	 * @return NoticeList
	 */
	public List<Notice> selectNoticeList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("noticeMapper.selectNoticeList", rowBounds);
	}
	
	
	
	
	
}
