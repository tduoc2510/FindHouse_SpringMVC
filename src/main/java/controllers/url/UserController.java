/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

import controllers.service.BoardingHouseService;
import controllers.service.BookingRequestService;
import controllers.service.EmailService;
import controllers.service.OwnerProfileService;
import controllers.service.ReportService;
import controllers.service.ReviewService;
import controllers.service.RoomImageService;
import controllers.service.RoomService;
import controllers.service.TenantService;
import controllers.service.UserService;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import model.entity.BoardingHouse;
import model.entity.BookingRequest;
import model.entity.OwnerProfile;
import model.entity.Report;
import model.entity.Review;
import model.entity.RoomImage;
import model.entity.Tenant;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    private TenantService tenantService;

    @Autowired
    private BookingRequestService bookingRequestService;

    @Autowired
    private BoardingHouseService boardingHouseService;
    
    @Autowired
    private ReportService reportService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private OwnerProfileService ownerProfileService;
    @Autowired
    private RoomImageService roomImageService;
    @Autowired
    private EmailService emailService;

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

    @GetMapping("/ownerListing")
    public String getOwnerListing(HttpSession session, Model model) throws MessagingException {
        User user = (User) session.getAttribute("USER");
        if (user == null) {
            return "redirect:/login";
        }

        // Lấy toàn bộ OwnerProfile
        List<OwnerProfile> profiles = ownerProfileService.getProfilesByOwnerId(user.getId());
        model.addAttribute("profile", profiles);

        // Lấy danh sách BoardingHouse từ các OwnerProfile
        List<BoardingHouse> boardingHouses = new ArrayList<>();
        for (OwnerProfile profile : profiles) {
            List<BoardingHouse> houses = boardingHouseService.getBoardingHousesByProfileId(profile.getId());
            boardingHouses.addAll(houses);
        }
        model.addAttribute("boardingHouses", boardingHouses);

        // Lấy tất cả RoomImage từ các BoardingHouse và lưu theo từng houseId
        Map<Integer, List<RoomImage>> imagesByHouse = new HashMap<>();
        for (BoardingHouse house : boardingHouses) {
            List<RoomImage> houseImages = roomImageService.getAllImagesFromBoardingHouse(house.getId());
            imagesByHouse.put(house.getId(), houseImages);
        }
        model.addAttribute("imagesByHouse", imagesByHouse);

        // Lấy các yêu cầu booking của user hiện tại
        List<BookingRequest> bookingRequests = bookingRequestService.getBookingRequestsByUserId(user.getId());
        model.addAttribute("bookingRequests", bookingRequests);
        emailService.sendOwnerProfileCreatedEmail(user.getEmail(), user.getFullName());

        return "user/ownerListing";
    }

    @GetMapping("/ownerProfile/listing")
    public String listProfiles(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "12") int size,
            Model model,
            HttpSession session
    ) {
        User currentUser = (User) session.getAttribute("USER");
        if (currentUser == null || !"admin".equals(currentUser.getRole())) {
            return "redirect:/login";
        }

        Pageable pageable = PageRequest.of(page - 1, size); // page - 1 vì Spring page 0-based
        Page<OwnerProfile> profilePage = ownerProfileService.getPendingProfiles(pageable);

        model.addAttribute("ownerProfiles", profilePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", profilePage.getTotalPages());
        model.addAttribute("totalElements", profilePage.getTotalElements());
        model.addAttribute("pageSize", size);

        return "user/staffListing";
    }

    @GetMapping("/tenant")
    public String getMyTenants(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("USER");

        if (currentUser == null) {
            return "redirect:/login";
        }

        List<Tenant> myTenants = tenantService.getTenantsByUserId(currentUser.getId());

        model.addAttribute("tenants", myTenants);
        return "user/myTenants"; // Tạo trang JSP để hiển thị danh sách thuê trọ
    }

    @GetMapping("/reports")
    public String viewOwnerReports(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("USER");
        if (currentUser == null) {
            return "redirect:/login";
        }

        List<Report> ownerReports = reportService.getReportsByOwner(currentUser);
        model.addAttribute("reports", ownerReports);
        return "user/reports"; // Tạo file JSP tương ứng
    }

}
