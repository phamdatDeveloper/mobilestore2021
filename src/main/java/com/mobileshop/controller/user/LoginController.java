package com.mobileshop.controller.user;

import java.security.Principal;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mobileshop.dto.UserDTO;
import com.mobileshop.service.UserService;
import com.mobileshop.service.impl.EmailService;

@Controller
public class LoginController {
	@Autowired
	private	PasswordEncoder passwordEncoder;
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;

	@RequestMapping(value = { "/login" })
	public String login(@RequestParam(value = "error", required = false) final String error, final Model model,
			HttpServletRequest request) {
		//doan nay de lay sesson ra de xu ly
		Object object = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		HttpSession session = request.getSession(true);
		System.out.println(session.getAttribute("SPRING_SECURITY_CONTEXT"));
		
		if (error != null) {
			model.addAttribute("message", "Tên tài khoản hoặc mật khẩu không chính xác, vui lòng đăng nhập lại!");
		}
		return "user/login";
	}

	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Logged out!");
		return "redirect:/";
	}

	@RequestMapping("/403")
	public String accesssDenied(Model model, Principal user) {
		if (user != null) {
			model.addAttribute("msg", "Hi " + user.getName() + ", you do not have permission to access this page!");
		} else {
			model.addAttribute("msg", "You do not have permission to access this page!");
		}

		return "redirect:/error";
	}

	@RequestMapping("/error")
	public String error() {
		return "user/403";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerPage(Model model) {
		model.addAttribute("registerForm", new UserDTO());
		return "user/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView processRegistration(@ModelAttribute("registerForm") @Valid UserDTO user,
			BindingResult bindingResult,ModelAndView mv) {

		UserDTO userExist = userService.findOneByUsernameOrEmail(user.getUsername(), user.getEmail());
		System.out.println(userExist);

		if (userExist != null) {
			mv.addObject("alreadyRegistered", "Tài khoản đã được đăng ký");
			mv.setViewName("user/register");
			bindingResult.reject("username");
			bindingResult.reject("email");
		}

		if (bindingResult.hasErrors()) {
			mv.setViewName("user/register");
			
		} else {
			user.setConfirmToken(UUID.randomUUID().toString());
//			user.setExpiryDate(30);
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			user.setActive(0);
			userService.save(user);

//			 send mail
			SimpleMailMessage registrationEmail = new SimpleMailMessage();
			registrationEmail.setTo(user.getEmail());
			registrationEmail.setSubject("Xác nhận Email");
			registrationEmail.setText("Để xác nhận email, xin vui lòng click: " + "http://localhost:8080/confirm?token="
					+ user.getConfirmToken());
			registrationEmail.setFrom("noreplymobileshop@gmail.com");
			emailService.sendEmail(registrationEmail);
			mv.setViewName("redirect:/");

		}
		return mv;
	}

	@RequestMapping(value = "/confirm", method = { RequestMethod.GET, RequestMethod.POST })
	public String confirmUserAccount(@RequestParam("token") String confirmationToken, Model model) {
		UserDTO token = userService.findByConfirmToken(confirmationToken);
		String url = "";
		if (token != null) {
			UserDTO user = userService.findByConfirmToken(confirmationToken);
			user.setConfirmToken(null);
			user.setActive(1);
			userService.save(user);
			model.addAttribute("message", "đã xác thực");
			url = "redirect:/login";
		} else {
			model.addAttribute("message", "Đường dẫn không tồn tại!");
			url = "redirect:/403";
		}

		return url;
	}

	//Quen mat khau
	@RequestMapping(value = "/forgot", method = RequestMethod.GET)
	public ModelAndView resetPasswordPage(ModelAndView mav) {
		mav.setViewName("user/forgot");
		return mav;
	}

	@RequestMapping(value = "/forgot", method = RequestMethod.POST)
	public ModelAndView processResetPassword(ModelAndView mav, @RequestParam("email") String email,
			BindingResult bindingResult) {

		UserDTO userExist = userService.findByEmail(email);
		System.out.println(userExist);

		if (userExist == null) {
			mav.addObject("cannotFindEmail", "Tài khoản chưa được đăng ký");
			mav.setViewName("forgotPassword");
			bindingResult.reject("email");
		}

		else if (bindingResult.hasErrors()) {
			mav.setViewName("user/forgot");
		} else {
//			UserDTO user = userService.findByEmail(email);
			userExist.setConfirmToken(UUID.randomUUID().toString());
//			user.setExpiryDate(30);
			userService.save(userExist);

			// send mail
			SimpleMailMessage registrationEmail = new SimpleMailMessage();
			registrationEmail.setTo(userExist.getEmail());
			registrationEmail.setSubject("Lấy lại mật khẩu");
			registrationEmail.setText("Để lấy lại mật khẩu, xin vui lòng click: "
					+ "http://localhost:8080/reset?confirmtoken=" + userExist.getConfirmToken());
			registrationEmail.setFrom("noreplymobileshop@gmail.com");
			emailService.sendEmail(registrationEmail);

			mav.addObject("message", "Một đường dẫn đã gửi đến Email của bạn, vui lòng xác nhận.");
			mav.setViewName("user/forgot");
		}
		return mav;
	}
//
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public ModelAndView displayResetPassword(ModelAndView mav, @RequestParam("confirmtoken") String confirmToken) {
		UserDTO userToken = userService.findByConfirmToken(confirmToken);

		if (userToken != null) {
			mav.addObject("confirmtoken", confirmToken);
		} else {
			mav.addObject("error", "Cannot reset password");
		}
		mav.setViewName("user/resetpassword");
		return mav;
	}
//
	@RequestMapping(value = "/reset", method = { RequestMethod.POST })
	public ModelAndView setNewPassword(ModelAndView mav, @RequestParam("confirmtoken") String confirmtoken,@RequestParam("password") String password
			) {
		UserDTO userExist = userService.findByConfirmToken(confirmtoken);
		System.out.println(userExist);

		if (userExist == null) {
			mav.addObject("cannotFindEmail", "Tài khoản chưa được đăng ký");
			mav.setViewName("user/forgot");
		}

		 else {
			UserDTO user = userService.findByConfirmToken(confirmtoken);
			user.setConfirmToken(null);
			user.setPassword(passwordEncoder.encode(password));
			userService.save(user);

			mav.addObject("message", "reset password success.");
			mav.setViewName("redirect:/login");
		}
		return mav;
	}
//
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		if (authentication != null) {
//			new SecurityContextLogoutHandler().logout(request, response, authentication);
//		}
//		return new ModelAndView("redirect:/home");
//	}
//
//	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
//	public ModelAndView accessDenied() {
//		return new ModelAndView("redirect:/login?incorrectAccount");
//	}
}
