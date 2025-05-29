package controllers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    // Gửi email chứa mã xác thực
    public void sendVerificationEmail(String email, String verificationCode) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(email);
        helper.setSubject("Xác thực tài khoản - Ứng dụng Thuê Trọ");

        String content = "<html>"
                + "<body style='font-family: Arial, sans-serif; background-color: #f6f6f6; padding: 20px;'>"
                + "<div style='max-width: 600px; margin: auto; background-color: white; border-radius: 8px; "
                + "box-shadow: 0 0 10px rgba(0,0,0,0.1); padding: 30px;'>"
                + "<div style='text-align: center; margin-bottom: 20px;'>"
                + "<img src='${pageContext.request.contextPath}/assets/images/logo.png' alt='App Logo' height='60' />"
                + "<h2 style='color: #4CAF50;'>Xác thực tài khoản của bạn</h2>"
                + "</div>"
                + "<p>Chào bạn,</p>"
                + "<p>Cảm ơn bạn đã sử dụng <strong>Ứng dụng Thuê Trọ</strong>. Để hoàn tất việc đăng ký tài khoản, vui lòng sử dụng mã xác thực dưới đây:</p>"
                + "<div style='text-align: center; margin: 30px 0;'>"
                + "<span style='font-size: 28px; font-weight: bold; color: #ffffff; background-color: #4CAF50; "
                + "padding: 12px 24px; border-radius: 6px;'>" + verificationCode + "</span>"
                + "</div>"
                + "<p>Mã xác thực này có hiệu lực trong 5 phút.</p>"
                + "<p>Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.</p>"
                + "<hr style='margin: 30px 0;'>"
                + "<p style='font-size: 13px; color: #888888; text-align: center;'>"
                + "© 2025 Ứng dụng Thuê Trọ. Mọi quyền được bảo lưu."
                + "</p>"
                + "</div>"
                + "</body>"
                + "</html>";

        helper.setText(content, true); // Gửi HTML email

        mailSender.send(message);
    }

}
