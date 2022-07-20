package edu.kh.bangbanggokgok.dao.question;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.Pagination;
import edu.kh.bangbanggokgok.vo.question.Question;
import edu.kh.bangbanggokgok.vo.question.QuestionDetail;
import edu.kh.bangbanggokgok.vo.user.User;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 문의 게시판 게시글 수 조회
	 * @param loginUser 
	 * @return listCount
	 */
	public int getListCount(User loginUser) {
		return sqlSession.selectOne("questionMapper.getListCount", loginUser);
	}

	
	/** 문의 게시판 목록 조회
	 * @param pagination
	 * @param loginUser 
	 * @return qList
	 */
	public List<Question> selectQuestionList(Pagination pagination, User loginUser) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("questionMapper.selectQuestionList", loginUser, rowBounds);
	}


	/** 문의 게시글 상세 조회
	 * @param questionNo
	 * @return questionDetail
	 */
	public QuestionDetail selectQuestionDetail(int questionNo) {
		return sqlSession.selectOne("questionMapper.selectQuestionDetail", questionNo);
	}


	/** 문의 게시글 작성
	 * @param detail
	 * @return questionNo
	 */
	public int insertQuestion(QuestionDetail detail) {
		int result = sqlSession.insert("questionMapper.insertQuestion", detail);
		
		if(result>0) result = detail.getQuestionNo();
		
		return result;
	}


	
	
	
}
