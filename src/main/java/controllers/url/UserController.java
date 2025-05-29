/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

import controllers.service.BoardingHouseService;
import controllers.service.BookingRequestService;
import controllers.service.ReviewService;
import controllers.service.RoomService;
import controllers.service.UserService;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import model.entity.BoardingHouse;
import model.entity.BookingRequest;
import model.entity.Review;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Thanh Duoc
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BookingRequestService bookingRequestService;

    @Autowired
    private BoardingHouseService boardingHouseService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/profile")
    public String home(Model model, HttpSession session) {
        User user = (User) session.getAttribute("USER");
        if (user == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển hướng về trang login
        }

        // Lấy role từ User
        String role = user.getRole();

        if ("tenant".equals(role)) {

            return "user/userProfile";
        } else if ("owner".equals(role)) {
            List<BookingRequest> ownerRequests = bookingRequestService.getRequestsByOwnerId(user.getId());
            model.addAttribute("bookingRequests", ownerRequests);
            return "user/ownerProfile";
        } else if ("admin".equals(role)) {
            int countUser = userService.countUsers();
            int contHouse = boardingHouseService.countBoardingHouses();
            int countRoom = roomService.countRooms();
            List<Review> reviewList = reviewService.getAllReviews();
            reviewList = reviewList.stream()
                    .filter(r -> r.getCreatedAt() != null) // Lọc bỏ những review không có createdAt
                    .sorted(Comparator.comparing(Review::getCreatedAt).reversed()) // Sắp xếp giảm dần
                    .collect(Collectors.toList());

            Map<BoardingHouse, Double> top4BoardingHouseList = boardingHouseService.getTop4BoardingHousesByRating();

            model.addAttribute("countUser", countUser);
            model.addAttribute("contHouse", contHouse);
            model.addAttribute("countRoom", countRoom);
            model.addAttribute("reviewList", reviewList);
            model.addAttribute("top4BoardingHouseList", top4BoardingHouseList);
            return "user/staffProfile";
        } else {
            return "redirect:/"; // Nếu role không hợp lệ, quay về trang chủ
        }
    }

    @GetMapping("/user")
    public String getBookingRequestsByUser(HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER");
        if (user == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển hướng về login
        }

        List<BookingRequest> bookingRequests = bookingRequestService.getBookingRequestsByUserId(user.getId());
        model.addAttribute("bookingRequests", bookingRequests);
        return "user/bookingRequests"; // Trả về giao diện JSP
    }

    @GetMapping("/booking")
    public String booking(Model model, HttpSession session) {
        User user = (User) session.getAttribute("USER");
        if (user == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển hướng về trang login
        }
        List<BookingRequest> tenantRequests = bookingRequestService.getBookingRequestsByUserId(user.getId());
        model.addAttribute("bookingRequests", tenantRequests);
        return "user/userBooking"; // Nếu đã đăng nhập, hiển thị trang profile
    }

    @PostMapping("/profile/update")
    public String updateProfile(
            @RequestParam("id") Integer id,
            @RequestParam("fullName") String fullName,
            @RequestParam("phoneNumber") String phoneNumber,
            HttpSession session) {

        // Lấy thông tin người dùng hiện tại từ DB
        User user = userService.getUserById(id);
        if (user == null) {
            return "redirect:/login"; // Nếu không tìm thấy user, chuyển về login
        }

        // Cập nhật thông tin
        user.setFullName(fullName);
        user.setPhoneNumber(phoneNumber);
        userService.saveUser(user); // Gọi service để cập nhật trong DB

        // Cập nhật lại session USER
        session.setAttribute("USER", userService.getUserById(id));

        return "redirect:/user/profile"; // Quay lại trang profile sau khi cập nhật
    }

}
