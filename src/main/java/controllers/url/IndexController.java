package controllers.url;

import controllers.service.BoardingHouseService;
import controllers.service.ReviewService;
import controllers.service.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.entity.BoardingHouse;
import model.entity.OwnerProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @Autowired
    private BoardingHouseService boardingHouseService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private UserService userService;

    @GetMapping({"/home", "/"})
    public String home(Model model, HttpSession session) {
        // Danh sách nhà trọ được duyệt
        List<BoardingHouse> houses = boardingHouseService.getApprovedBoardingHouses();
        model.addAttribute("houses", houses);

        // Thống kê số lượng nhà trọ
        long totalHouses = boardingHouseService.countApprovedBoardingHouses();
        model.addAttribute("totalHouses", totalHouses);

        // Đếm số lượng user theo vai trò
        long totalOwners = userService.countByRole("owner");
        long totalTenants = userService.countByRole("tenant");
        model.addAttribute("totalOwners", totalOwners);
        model.addAttribute("totalTenants", totalTenants);

        // Trung bình đánh giá sao
        double averageRating = reviewService.getAverageRating(); // Tính từ bảng Reviews
        model.addAttribute("averageRating", averageRating);
        int totalReviews = reviewService.getTotalReviews();
        model.addAttribute("totalReviews", totalReviews);

        return "index"; // index.jsp
    }

}
