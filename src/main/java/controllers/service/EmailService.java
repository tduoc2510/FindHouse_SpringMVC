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
        helper.setFrom("kyumavn@gmail.com");

        String content = "<html>"
                + "<body style='font-family: Arial, sans-serif; background-color: #f6f6f6; padding: 20px;'>"
                + "<div style='max-width: 600px; margin: auto; background-color: white; border-radius: 8px; "
                + "box-shadow: 0 0 10px rgba(0,0,0,0.1); padding: 30px;'>"
                + "<div style='text-align: center; margin-bottom: 20px;'>"
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

        helper.setText(content, true);
        mailSender.send(message);
    }

    // Gửi email thông báo tạo OwnerProfile thành công và đang chờ xác nhận
    public void sendOwnerProfileCreatedEmail(String email, String fullName) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(email);
        helper.setSubject("Thông báo đăng ký hồ sơ chủ trọ thành công");
        helper.setFrom("kyumavn@gmail.com");

        String content = "<html>"
                + "<body style='font-family: Arial, sans-serif; background-color: #f6f6f6; padding: 20px;'>"
                + "<div style='max-width: 600px; margin: auto; background-color: white; border-radius: 8px; "
                + "box-shadow: 0 0 10px rgba(0,0,0,0.1); padding: 30px;'>"
                + "<div style='text-align: center; margin-bottom: 20px;'>"
                + "<h2 style='color: #2196F3;'>Hồ sơ chủ trọ của bạn đang chờ xác nhận</h2>"
                + "</div>"
                + "<p>Chào <strong>" + fullName + "</strong>,</p>"
                + "<p>Bạn đã đăng ký thành công hồ sơ <strong>chủ trọ</strong> trên Ứng dụng Thuê Trọ.</p>"
                + "<p>Hệ thống của chúng tôi đã tiếp nhận hồ sơ và sẽ tiến hành kiểm duyệt trong thời gian sớm nhất.</p>"
                + "<p>Sau khi được phê duyệt, bạn sẽ nhận được email thông báo và có thể bắt đầu đăng nhà trọ của mình lên nền tảng.</p>"
                + "<p>Xin cảm ơn bạn đã tin tưởng sử dụng ứng dụng của chúng tôi!</p>"
                + "<hr style='margin: 30px 0;'>"
                + "<p style='font-size: 13px; color: #888888; text-align: center;'>"
                + "© 2025 Ứng dụng Thuê Trọ. Mọi quyền được bảo lưu."
                + "</p>"
                + "</div>"
                + "</body>"
                + "</html>";

        helper.setText(content, true);
        mailSender.send(message);
    }

    public void sendOwnerProfileApprovalEmail(String toEmail, String fullName, String status, String reason) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(toEmail);
        helper.setFrom("kyumavn@gmail.com");
        helper.setSubject("Cập nhật trạng thái hồ sơ chủ trọ");

        StringBuilder content = new StringBuilder();
        content.append("<html><body style='font-family: Arial; padding:20px;'>");
        content.append("<h3 style='color:#007bff;'>Chào ").append(fullName).append(",</h3>");

        if ("APPROVED".equals(status)) {
            content.append("<p>Hồ sơ chủ trọ của bạn đã được <strong style='color:green;'>PHÊ DUYỆT</strong>.</p>");
            content.append("<p>Bạn đã có thể đăng nhà trọ trên hệ thống.</p>");
        } else if ("REJECTED".equals(status)) {
            content.append("<p>Hồ sơ của bạn đã bị <strong style='color:red;'>TỪ CHỐI</strong>.</p>");
            content.append("<p><strong>Lý do:</strong> ").append(reason).append("</p>");
            content.append("<p>Vui lòng chỉnh sửa và gửi lại hồ sơ nếu cần.</p>");
        }

        content.append("<hr><p style='font-size:12px; color:#888;'>© 2025 Ứng dụng Thuê Trọ.</p>");
        content.append("</body></html>");

        helper.setText(content.toString(), true);
        mailSender.send(message);
    }

}
