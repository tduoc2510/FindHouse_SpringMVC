/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

/**
 *
 * @author Thanh Duoc
 */
import controllers.repository.RoomRepository;
import controllers.service.BookingRequestService;
import controllers.service.TenantService;
import controllers.util.SessionUtil;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.entity.BookingRequest;
import model.entity.Room;
import model.entity.Tenant;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/booking")
public class BookingRequestController {

    @Autowired
    private BookingRequestService bookingRequestService;
    @Autowired
    private TenantService tenantService;
    @Autowired
    private RoomRepository roomRepository;

    @GetMapping("/payment_return")
    public String handleVnpayReturn(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String responseCode = request.getParameter("vnp_ResponseCode");
        String transactionStatus = request.getParameter("vnp_TransactionStatus");
        String requestId = request.getParameter("vnp_TxnRef");

        boolean success = "00".equals(responseCode) && "00".equals(transactionStatus);

        if (success) {
            int bookingId = Integer.parseInt(requestId);

            // 1. Cập nhật trạng thái booking
            bookingRequestService.updateBookingStatus(bookingId, "confirm3", "Thanh toán thành công qua VNPAY");

            // 2. Lấy thông tin booking
            BookingRequest booking = bookingRequestService.getBookingById(bookingId);
            if (booking != null) {
                // 3. Tạo đối tượng Tenant
                Tenant tenant = new Tenant();
                tenant.setUser(booking.getUser());
                tenant.setRoom(booking.getRoom());

                // Ngày bắt đầu thuê là ngày thanh toán + 3 ngày
                tenant.setRentStart(LocalDate.now().plusDays(3));

                // Bạn có thể thêm logic tính rentEnd nếu cần
                // 4. Lưu vào database
                tenantService.saveTenant(tenant);
            }

            redirectAttributes.addFlashAttribute("successMessage", "Thanh toán thành công!");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Thanh toán thất bại hoặc bị huỷ.");
        }

        return "redirect:/user/booking";
    }

    @PostMapping("/update-status")
    @ResponseBody
    public ResponseEntity<String> updateStatus(
            @RequestParam("requestId") Integer requestId,
            @RequestParam("status") String status,
            @RequestParam(value = "reason", required = false) String reason) {

        try {
            bookingRequestService.updateBookingStatus(requestId, status, reason);
            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi cập nhật trạng thái.");
        }
    }

    @PostMapping("/createBooking")
    public String bookRoom(
            @RequestParam("roomId") Integer roomId,
            @RequestParam("viewingDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime viewingDate,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        SessionUtil.clearMessages(session); // Xoá trước khi xử lý mới

        User user = (User) session.getAttribute("USER");
        if (user == null) {
            redirectAttributes.addFlashAttribute("message", "Bạn cần đăng nhập để đặt lịch.");
            redirectAttributes.addFlashAttribute("messageType", "error");
            return "redirect:/login";
        }

        Room room = roomRepository.findById(roomId).orElse(null);
        if (room == null) {
            redirectAttributes.addFlashAttribute("message", "Phòng không tồn tại.");
            redirectAttributes.addFlashAttribute("messageType", "error");
            return "redirect:/";
        }

        bookingRequestService.createBooking(user, room, viewingDate.atZone(ZoneId.systemDefault()).toInstant());
        redirectAttributes.addFlashAttribute("message", "Đặt lịch xem trọ thành công!");
        redirectAttributes.addFlashAttribute("messageType", "success");
        return "redirect:/";
    }

    @GetMapping("/requests/pending")
    public String showPendingRequests(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("USER");
        if (currentUser == null) {
            return "redirect:/login";
        }

        List<BookingRequest> pendingRequests = bookingRequestService.getPendingRequests();
        model.addAttribute("requests", pendingRequests);
        return "user/pendingBookingRequests"; // File JSP cần tạo
    }

}
