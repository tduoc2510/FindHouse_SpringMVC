/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

/**
 *
 * @author Thanh Duoc
 */
import com.google.gson.JsonObject;
import config.VnpayConfig;
import config.VnpayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpSession;
import model.entity.BoardingHouse;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class VnpayController {
    
    @GetMapping({"/createPayment"}) // Mapping cho trang chính
    public String home(Model model, HttpSession session) {
        
        return "test"; // Trả về trang index.jsp
    }
    
    @PostMapping("/payment")
    public String createPayment(HttpServletRequest req) throws Exception {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";

        // Lấy và xử lý dữ liệu từ form
        double amountDouble = Double.parseDouble(req.getParameter("amount"));
        long amount = (long) (amountDouble * 100); // VNPAY yêu cầu nhân 100

        String requestId = req.getParameter("requestId"); // từ <input hidden name="requestId">
        if (requestId == null || !requestId.matches("\\d+")) {
            throw new IllegalArgumentException("requestId không hợp lệ");
        }
        
        String bankCode = req.getParameter("bankCode");
        String language = Optional.ofNullable(req.getParameter("language")).orElse("vn");
        String orderInfo = Optional.ofNullable(req.getParameter("orderInfo"))
                .orElse("Thanh toán đơn hàng không rõ nội dung");
        
        String vnp_IpAddr = VnpayUtil.getIpAddress(req);

        // Chuẩn bị tham số gửi sang VNPAY
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", VnpayConfig.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        
        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        
        vnp_Params.put("vnp_TxnRef", requestId); // dùng booking.id làm mã giao dịch
        vnp_Params.put("vnp_OrderInfo", orderInfo);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", language);
        vnp_Params.put("vnp_ReturnUrl", VnpayConfig.getReturnUrl(req));
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        // Tạo thời gian giao dịch và hết hạn
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(calendar.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        
        calendar.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(calendar.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        // Tạo chuỗi hash
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        
        for (int i = 0; i < fieldNames.size(); i++) {
            String field = fieldNames.get(i);
            String value = vnp_Params.get(field);
            hashData.append(field).append('=').append(URLEncoder.encode(value, StandardCharsets.US_ASCII.toString()));
            query.append(URLEncoder.encode(field, StandardCharsets.US_ASCII.toString()))
                    .append('=')
                    .append(URLEncoder.encode(value, StandardCharsets.US_ASCII.toString()));
            if (i < fieldNames.size() - 1) {
                hashData.append('&');
                query.append('&');
            }
        }
        
        String vnp_SecureHash = VnpayUtil.hmacSHA512(VnpayConfig.secretKey, hashData.toString());
        query.append("&vnp_SecureHash=").append(vnp_SecureHash);
        
        String paymentUrl = VnpayConfig.vnp_PayUrl + "?" + query;
        
        return "redirect:" + paymentUrl;
    }
    
}
