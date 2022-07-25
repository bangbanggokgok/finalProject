package edu.kh.bangbanggokgok.service.reply;

import java.util.List;

import edu.kh.bangbanggokgok.vo.reply.Reply;

public interface ReplyService {

	/** 댓글 목록 조회 Service
	 * @param boardNo
	 * @return rList
	 */
	List<Reply> selectReplyList(int boardNo);

	/** 댓글 등록 Service
	 * @param reply
	 * @return result
	 */
	int insertReply(Reply reply);

	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return result
	 */
	int deleteReply(int replyNo);

	/** 댓글 수정 Service
	 * @param replyNo
	 * @param replyContent
	 * @return result
	 */
	int updateReply(Reply reply);
}
