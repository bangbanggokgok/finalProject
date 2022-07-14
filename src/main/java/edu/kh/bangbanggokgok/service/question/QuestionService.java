package edu.kh.bangbanggokgok.service.question;

import java.util.Map;

import edu.kh.bangbanggokgok.vo.question.QuestionDetail;
import edu.kh.bangbanggokgok.vo.user.User;

public interface QuestionService {

	/** 문의 게시판 목록 조회
	 * @param cp
	 * @param loginUser 
	 * @return map
	 */
	Map<String, Object> selectQuestionList(int cp, User loginUser);

	/** 문의 게시글 상세 조회
	 * @param questionNo
	 * @return questionDetail
	 */
	QuestionDetail selectQuestionDetail(int questionNo);

}
