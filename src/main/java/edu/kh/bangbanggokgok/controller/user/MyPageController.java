package edu.kh.bangbanggokgok.controller.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.service.user.MyPageService;
import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("/myPage")
@SessionAttributes({ "loginUser" })
public class MyPageController {

	@Autowired
	private MyPageService service;

	@GetMapping("/info")
	public String info() {
		return "myPage/myPage-favorite";
	}

	@GetMapping("/profile")
	public String profile() {
		return "myPage/myPage-favorite";
	}

	@GetMapping("/changeInfo")
	public String changeInfo() {
		return "myPage/myPage-changeInfo";
	}

	@GetMapping("/changePw")
	public String changePw() {
		return "myPage/myPage-changePw";
	}

	@GetMapping("/secession")
	public String secession() {
		return "myPage/myPage-secession";
	}

	@GetMapping("/course")
	public String course() {
		return "myPage/myPage-course";
	}

	@GetMapping("/reply")
	public String reply() {
		return "myPage/myPage-reply";
	}

	@GetMapping("/inquiry")
	public String inquiry() {
		return "myPage/myPage-inquiry";
	}

	// 프로필 이미지 변경
	@PostMapping("/profile")
	public String updateProfile(@ModelAttribute("loginUser") User loginUser,
			@RequestParam("uploadImage") MultipartFile uploadImage, @RequestParam Map<String, Object> map,
			HttpServletRequest req, RedirectAttributes ra) throws IOException {

		String webPath = "/resources/images/userProfile/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImage", uploadImage);
		map.put("userNo", loginUser.getUserNo());

		int result = service.updateProfile(map);
		String message = null;

		if (result > 0) {
			message = "프로필 이미지가 변경되었습니다.";

			loginUser.setProfileImage((String) map.get("profileImage"));
		} else {
			message = "프로필 이미지 변경 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:/myPage/info";
	}

	// 회원정보 수정
	@PostMapping("/changeInfo")
	public String updateInfo(@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> map,
			String updateAddress, RedirectAttributes ra) {

		String userAddress = String.join(",,", updateAddress);

		map.put("userNo", loginUser.getUserNo());
		map.put("userAddress", userAddress);

		int result = service.updateInfo(map);

		String message = null;
		if (result > 0) {
			message = "회원정보가 수정되었습니다.";

			loginUser.setUserName((String) map.get("updateName"));
			loginUser.setUserTel((String) map.get("updateTel"));
			loginUser.setUserAddress((String) map.get("userAddress"));
		} else {
			message = "회원정보 수정 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:changeInfo";
	}

	// 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> map,
			RedirectAttributes ra) {

		map.put("userNo", loginUser.getUserNo());

		int result = service.changePw(map);

		String message = null;

		if (result > 0) {
			message = "비밀번호가 수정되었습니다.";
		} else {
			message = "현재 비밀번호가 일치하지 않습니다.";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:changePw";
	}

	// 회원 탈퇴
	@PostMapping("/secession")
	public String secession(@ModelAttribute("loginUser") User loginUser, @RequestParam Map<String, Object> map,
			SessionStatus status, HttpServletRequest req, RedirectAttributes ra) {

		map.put("userNo", loginUser.getUserNo());

		int result = service.secession(map);

		String message = null;
		String path = null;

		if (result > 0) {
			message = "회원 탈퇴되었습니다.";
			path = "/";

			status.setComplete();
		} else {
			message = "현재 비밀번호가 일치하지 않습니다.";
			path = "secession";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}

	@ResponseBody
	@GetMapping("/my-favorite")
	public String favoriteList(@ModelAttribute("loginUser") User loginUser, @RequestParam("indexFlag") int flag) {
//												0 landMark | 1 moveLine indexFlag
		List<LandMark> landMarkList = null;
		List<MoveLine> moveLineList = null;
		
		if (flag == 0) {
			landMarkList = service.favoriteLandmark(loginUser.getUserNo());
			return new Gson().toJson(landMarkList);
		} else {
			moveLineList = service.favoriteMoveline(loginUser.getUserNo());
			return new Gson().toJson(moveLineList);
		}
	}

}
