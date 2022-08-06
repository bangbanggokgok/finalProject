package edu.kh.bangbanggokgok.controller.reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.service.reply.ReplyService;
import edu.kh.bangbanggokgok.vo.reply.Reply;


@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	// 댓글 목록 조회
	@GetMapping("/selectReplyList")
	public String selectReplyList(int movelineNo) {
		
		List<Reply> rList = service.selectReplyList(movelineNo);
		
//		for(int i = 0; i< rList.size(); i++) {
//			String fstName = rList.get(i).getUserName().substring(0,1);
//			String midName = rList.get(i).getUserName().substring(1, rList.get(i).getUserName().length()-1);
//			String maskingName = "";
//			
//			for(int j=0; j < midName.length(); j++) {
//				maskingName += "*";
//			}
//			
//			String lastName = rList.get(i).getUserName().substring(rList.get(i).getUserName().length()-1, rList.get(i).getUserName().length());
//			String userName = fstName + maskingName + lastName;
//			rList.set(i).getUserName(rList.get(i).getUserName());
//			rList.set(i, rList.get(i).getUserName());
//			rList.setUserName(rList.get(i).getUserName());
//		}
		
		return new Gson().toJson(rList);
	}
	
	
	// 댓글 등록
	@PostMapping("/insert")
	public int insertReply(Reply reply) {
		return service.insertReply(reply);
	}
	
	
	// 댓글 삭제
	@GetMapping("/delete")
	public int deleteReply(int replyNo) {
		return service.deleteReply(replyNo);
	}
	
	
	// 댓글 수정
	@PostMapping("/update")
	public int updateReply(Reply reply) {
		return service.updateReply(reply);
	}
	
	
	
	
}
