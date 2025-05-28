/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

/**
 *
 * @author Thanh Duoc
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import controllers.util.VerificationCodeGenerator;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.mail.MessagingException;

import model.entity.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.time.LocalDateTime;
import javax.mail.MessagingException;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthenticateService {

    @Autowired
    private UserService uService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private VerificationCodeGenerator codeGenerator;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    // Xác thực người dùng
    public User login(String email, String password) {
        // Tìm kiếm người dùng dựa trên email
        User user = uService.findByEmail(email);

        // Kiểm tra nếu user tồn tại và mật khẩu hợp lệ
        if (user != null) {
            String storedPassword = user.getPassword();
            // Kiểm tra nếu mật khẩu trong DB đã được mã hóa bằng BCrypt
            if (storedPassword != null
                    && (storedPassword.startsWith("$2a$") || storedPassword.startsWith("$2b$") || storedPassword.startsWith("$2y$"))) {
                // So sánh mật khẩu được mã hóa
                if (passwordEncoder.matches(password, storedPassword)) {
                    return user; // Mật khẩu hợp lệ, trả về người dùng
                }
            } else if (storedPassword != null && storedPassword.equals(password)) {
                // Trường hợp mật khẩu không mã hóa, kiểm tra trực tiếp
                return user; // Mật khẩu hợp lệ, trả về người dùng
            }
        }

        // Trả về null nếu xác thực không thành công
        return null;
    }

    // Xử lý quên mật khẩu và gửi mã xác nhận
    public String sendVerificationCode(String email) throws MessagingException {
        User user = uService.findByEmail(email);

        if (user == null) {
            return "Email không tồn tại trong hệ thống!";
        }

        String verificationCode = codeGenerator.generateVerificationCode();
        emailService.sendVerificationEmail(email, verificationCode);
        return verificationCode;
    }

    // Xử lý quên mật khẩu và gửi mã xác nhận
    public String sendVerificationCodeSignup(String email) throws MessagingException {
        String verificationCode = codeGenerator.generateVerificationCode();
        emailService.sendVerificationEmail(email, verificationCode);
        return verificationCode;
    }
}
