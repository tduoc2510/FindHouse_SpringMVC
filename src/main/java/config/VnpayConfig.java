/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

/**
 *
 * @author Thanh Duoc
 */
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;

public class VnpayConfig {

    public static final String vnp_TmnCode = "YDONUK8R";
    public static final String secretKey = "129WAECNIUJ3NSDMXS2DPYXX6VHYSBU4";
    public static final String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";

    public static String getReturnUrl(HttpServletRequest request) {
        String baseUrl = request.getScheme() + "://" + request.getServerName()
                + ":" + request.getServerPort() + request.getContextPath();
        return baseUrl + "/booking/payment_return";
    }
}

