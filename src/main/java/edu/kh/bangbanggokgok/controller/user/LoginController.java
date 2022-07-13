package edu.kh.bangbanggokgok.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.service.user.UserService;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("user/*")
@SessionAttributes({ "loginUser" })
public class LoginController {

	@Autowired
	private UserService service;

	@GetMapping("login-page")
	public String login() {
		return "user/loginPage/loginPage";
	}

	@PostMapping("login")
	public String login(@RequestParam(value = "email") String email,
						@RequestParam(value = "password") String password,
						RedirectAttributes ra, Model model) {

		User result = service.login(email, password);
		String path = "";
		if (result != null) {
			model.addAttribute("loginUser", result);
			ra.addFlashAttribute("message", "로그인 성공");
			path = "redirect:/";
		} else {
			ra.addFlashAttribute("message", "실패");
			path = "redirect:/user/login-page";
		}
		return path;
	}

	@ResponseBody
	@PostMapping("find-email")
	public String findAccount(User findInfo) {
		User findEmail = service.findAccount(findInfo);
		Map<String, String> map = new HashMap<String, String>();
		if (findEmail != null) {
			map.put("userEmail", findEmail.getUserEmail());
			map.put("userName", findEmail.getUserName());
		}
		return new Gson().toJson(map);
	}

	@PostMapping("reset-password")
	public String resetPassword(@RequestParam("RPEmail")String email,
								@RequestParam("RPUserName") String name,
								HttpServletResponse resp, RedirectAttributes ra) {
		String path = "";
		User resetAccount = new User();
		resetAccount.setUserEmail(email);
		resetAccount.setUserName(name);
		int result = service.resetPassword(resetAccount,resp);
		if(result>0) {
			path = "패스워드 바꿧다고 페이지 넣어야함";
		} else {
			ra.addFlashAttribute("message","해당 회원은 존재하지 않습니다.");
			path = "redirect:/uesr/login-page";
		}
		return path;
	}

}
