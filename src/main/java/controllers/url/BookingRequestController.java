/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

/**
 *
 * @author Thanh Duoc
 */
import controllers.service.BookingRequestService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/booking")
public class BookingRequestController {

    @Autowired
    private BookingRequestService bookingRequestService;

    @GetMapping("/payment_return")
    public String handleVnpayReturn(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String responseCode = request.getParameter("vnp_ResponseCode");
        String transactionStatus = request.getParameter("vnp_TransactionStatus");
        String requestId = request.getParameter("vnp_TxnRef");

        boolean success = "00".equals(responseCode) && "00".equals(transactionStatus);

        if (success) {
            int bookingId = Integer.parseInt(requestId);
            bookingRequestService.updateBookingStatus(bookingId, "confirm3", "Thanh toán thành công qua VNPAY");
            redirectAttributes.addFlashAttribute("successMessage", "Thanh toán thành công!");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Thanh toán thất bại hoặc bị huỷ.");
        }

        // Trả người dùng về trang danh sách đặt phòng
        return "redirect:/user/booking";
    }

}
