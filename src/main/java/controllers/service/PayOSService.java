/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Thanh Duoc
 */
@Service
public class PayOSService {

    @Value("${payos.clientId}")
    private String clientId;

    @Value("${payos.apiKey}")
    private String apiKey;

    @Value("${payos.endpoint}")
    private String endpoint;

    @Value("${payos.returnUrl}")
    private String returnUrl;

    @Value("${payos.webhookUrl}")
    private String webhookUrl;

    private final RestTemplate restTemplate = new RestTemplate();

    public String createPaymentURL(Long bookingId, Long amount, String orderInfo) {
        Map<String, Object> payload = new HashMap<>();
        payload.put("orderCode", bookingId);
        payload.put("amount", amount);
        payload.put("description", orderInfo);
        payload.put("returnUrl", returnUrl + "?bookingId=" + bookingId);
        payload.put("cancelUrl", returnUrl + "?bookingId=" + bookingId + "&cancel=true");
        payload.put("webhookUrl", webhookUrl);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("x-client-id", clientId);
        headers.set("x-api-key", apiKey);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(payload, headers);
        ResponseEntity<Map> response = restTemplate.postForEntity(endpoint + "/v1/payments", request, Map.class);

        return (String) ((Map) response.getBody().get("data")).get("checkoutUrl");
    }
}

