/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

import controllers.service.UserService;
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

    @GetMapping("/signup")
    public String signup(Model model) {
        return "authenticate/signUp";
    }

    @PostMapping("/signup")
    public String registerUser(
            @RequestParam("email") String email,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            Model model) {

        // Kiểm tra mật khẩu xác nhận
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu xác nhận không khớp!");
            return "authenticate/signUp"; // Quay lại trang đăng ký nếu có lỗi
        }

        // Gọi service để lưu user vào database
        boolean success = userService.registerUser(email, username, password);

        if (!success) {
            model.addAttribute("error", "Đăng ký thất bại, email hoặc username đã tồn tại!");
            return "authenticate/signUp";
        }

        return "redirect:/login"; // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
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

        User user = userService.validateUser(email, password);

        if (user != null) {
            session.setAttribute("USER", user);
            return "redirect:/home"; // Chuyển hướng sau khi đăng nhập thành công
        } else {
            model.addAttribute("error", "Email hoặc mật khẩu không chính xác!");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Hủy toàn bộ session
        return "redirect:/login"; // Chuyển hướng về trang đăng nhập
    }
}
