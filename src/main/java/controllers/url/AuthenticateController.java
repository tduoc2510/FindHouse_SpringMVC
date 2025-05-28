/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

import controllers.service.AuthenticateService;
import controllers.service.UserService;
import controllers.util.SessionUtil;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Thanh Duoc
 */
@Controller
public class AuthenticateController {

    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticateService authenticateService;

    @GetMapping("/signup")
    public String signup(Model model) {
        return "authenticate/signUp";
    }

    @GetMapping("/verifycodesignup")
    public String verifycodesignupget(Model model) {
        return "authenticate/verifycodesignup";
    }

    @PostMapping("/verifycodesignup")
    public String verifycodesignup(@RequestParam String email,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            @RequestParam String role,
            @RequestParam(required = false) String fullName,
            @RequestParam(required = false) String phoneNumber,
            @RequestParam(required = false) String cccd,
            Model model,
            HttpSession session) throws MessagingException {
        SessionUtil.clearMessages(session); // Xoá trước khi xử lý mới

        if (!password.equals(confirmPassword)) {
            session.setAttribute("message", "Mật khẩu không khớp!");
            session.setAttribute("messageType", "error");
            return "redirect:/signup";
        }

        User existing = userService.findByEmail(email);
        if (existing != null) {
            session.setAttribute("message", "Email đã tồn tại trong hệ thống!");
            session.setAttribute("messageType", "error");
            return "redirect:/signup";
        }

        // Gửi mã xác minh OTP
        String verificationCode = authenticateService.sendVerificationCodeSignup(email);

        // Lưu thông tin vào session
        session.setAttribute("email", email);
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("role", role);
        session.setAttribute("fullName", fullName);
        session.setAttribute("phoneNumber", phoneNumber);
        session.setAttribute("cccd", cccd);
        session.setAttribute("verificationCode", verificationCode);

        return "redirect:/verifycodesignup";
    }

    @PostMapping("/signup")
    public String confirmSignup(@RequestParam String verificationCode, HttpSession session) {
        String sessionCode = (String) session.getAttribute("verificationCode");
        SessionUtil.clearMessages(session); // Xoá trước khi xử lý mới

        // Kiểm tra mã xác thực
        if (sessionCode == null || !sessionCode.equals(verificationCode)) {
            session.setAttribute("message", "Mã xác thực không đúng!");
            session.setAttribute("messageType", "error");
            return "redirect:/verifycodesignup";
        }

        // Lấy dữ liệu người dùng từ session
        String email = (String) session.getAttribute("email");
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String role = (String) session.getAttribute("role");
        String fullName = (String) session.getAttribute("fullName");
        String phoneNumber = (String) session.getAttribute("phoneNumber");
        String cccd = (String) session.getAttribute("cccd");

        // Đăng ký người dùng
        userService.registerUser(email, username, password, role, fullName, phoneNumber, cccd);

        // Xóa session tạm
        session.removeAttribute("verificationCode");
        session.removeAttribute("email");
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.removeAttribute("role");
        session.removeAttribute("fullName");
        session.removeAttribute("phoneNumber");
        session.removeAttribute("cccd");

        session.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
        session.setAttribute("messageType", "success");
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model) {
        return "authenticate/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {
        SessionUtil.clearMessages(session); // Xoá trước khi xử lý mới

        User user = authenticateService.login(email, password);

        if (user != null) {

            session.setAttribute("USER", user);
            return "redirect:/home";
        } else {
            session.setAttribute("message", "Email hoặc mật khẩu không chính xác!");
            session.setAttribute("messageType", "error");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Hủy toàn bộ session
        return "redirect:/login"; // Chuyển hướng về trang đăng nhập
    }
}
