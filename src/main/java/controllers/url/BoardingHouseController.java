/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

import controllers.repository.OwnerProfileRepository;
import controllers.service.BoardingHouseService;
import controllers.service.EmailService;
import controllers.service.FileStorageService;
import controllers.service.OwnerProfileService;
import controllers.service.PostService;
import controllers.service.RoomImageService;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.entity.BoardingHouse;
import model.entity.OwnerProfile;
import model.entity.Post;
import model.entity.Review;
import model.entity.Room;
import model.entity.RoomImage;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Thanh Duoc
 */
@Controller
@RequestMapping("/boarding-house")
public class BoardingHouseController {

    @Autowired
    private BoardingHouseService boardingHouseService;
    @Autowired
    private RoomImageService roomImageService;
    @Autowired
    private OwnerProfileService ownerProfileService;
    @Autowired
    private FileStorageService fileStorageService;
    @Autowired
    private ServletContext context;
    @Autowired
    private EmailService emailService;
    @Autowired
    private OwnerProfileRepository ownerProfileRepository;
    @Autowired
    private PostService postService;

    @GetMapping("/houseList")
    public String getAllBoardingHouses(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "6") int size, // mỗi trang 6 nhà trọ
            Model model
    ) {
        Pageable pageable = PageRequest.of(page, size);
        Page<BoardingHouse> housePage = boardingHouseService.getApprovedBoardingHouses(pageable);
        List<BoardingHouse> houses = housePage.getContent();

        Map<Integer, Map<String, Object>> houseRatings = new HashMap<>();
        Map<Integer, List<RoomImage>> houseImages = new HashMap<>();

        for (BoardingHouse house : houses) {
            Map<String, Object> stats = boardingHouseService.getRatingStatsByHouseId(house.getId());
            Map<String, Object> ratingInfo = new HashMap<>();
            ratingInfo.put("average", stats.get("averageRating"));
            ratingInfo.put("total", stats.get("totalReviews"));
            houseRatings.put(house.getId(), ratingInfo);

            List<RoomImage> images = roomImageService.getAllImagesFromBoardingHouse(house.getId());
            houseImages.put(house.getId(), images);
        }

        model.addAttribute("houses", houses);
        model.addAttribute("houseRatings", houseRatings);
        model.addAttribute("houseImages", houseImages);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", housePage.getTotalPages());

        return "house/list";
    }

    @GetMapping("/posts")
    public String listAllPosts(Model model) {
        List<Post> posts = postService.getAll(); // Mỗi Post đã có BoardingHouse

        // Map houseId → List<RoomImage>
        Map<Integer, List<RoomImage>> houseImages = new HashMap<>();

        for (Post post : posts) {
            BoardingHouse house = post.getHouse();
            if (house != null && !houseImages.containsKey(house.getId())) {
                List<RoomImage> images = roomImageService.getAllImagesFromBoardingHouse(house.getId());

                System.out.println("🏠 House ID: " + house.getId() + " - Images count: " + images.size());
                for (RoomImage img : images) {
                    System.out.println("🖼️  Image URL: " + img.getImageUrl());
                }

                houseImages.put(house.getId(), images);
            }
        }

        model.addAttribute("posts", posts);
        model.addAttribute("houseImages", houseImages); // Gửi ảnh xuống view
        return "post/list_all";
    }

    @GetMapping("/{id}")
    public String getBoardingHouseById(@PathVariable("id") Integer id, Model model) {
        Optional<BoardingHouse> houseOpt = boardingHouseService.getBoardingHouseById(id);

        if (!houseOpt.isPresent()) {
            return "redirect:/home"; // Nếu không tìm thấy, chuyển hướng về trang chủ
        }

        BoardingHouse house = houseOpt.get();
        List<Room> rooms = boardingHouseService.getRoomsByHouseId(id);
        List<Review> reviews = boardingHouseService.getReviewsByHouseId(id);
        int totalReviews = boardingHouseService.getTotalReviewsByHouseId(id);
        double averageRating = boardingHouseService.getAverageRatingByHouseId(id);
        List<RoomImage> allRoomImages = roomImageService.getAllImagesFromBoardingHouse(id);

        // Thêm danh sách ảnh của từng phòng
        Map<Integer, List<RoomImage>> roomImagesMap = new HashMap<>();
        for (Room room : rooms) {
            List<RoomImage> images = boardingHouseService.getImageByRoomId(room.getId());
            roomImagesMap.put(room.getId(), images);
        }

        model.addAttribute("house", house);
        model.addAttribute("rooms", rooms);
        model.addAttribute("roomImagesMap", roomImagesMap); // Truyền danh sách ảnh vào model
        model.addAttribute("reviews", reviews);
        model.addAttribute("totalReviews", totalReviews);
        model.addAttribute("averageRating", averageRating);
        model.addAttribute("allRoomImages", allRoomImages);

        return "house/detail"; // Trả về view hiển thị chi tiết căn hộ
    }

    @GetMapping("/searchHouse")
    public String searchBoardingHouses(@RequestParam(required = false) String name,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) Double minRating,
            Model model) {
        List<BoardingHouse> results = boardingHouseService.searchBoardingHouses(name, address, minPrice, maxPrice, minRating);
        Map<Integer, Map<String, Object>> houseRatings = new HashMap<>();

        for (BoardingHouse house : results) {
            Map<String, Object> stats = boardingHouseService.getRatingStatsByHouseId(house.getId());

            Map<String, Object> ratingInfo = new HashMap<>();
            ratingInfo.put("average", stats.get("averageRating"));
            ratingInfo.put("total", stats.get("totalReviews"));

            houseRatings.put(house.getId(), ratingInfo);
        }

        model.addAttribute("houseRatings", houseRatings);
        // Lưu các giá trị filter vào model để hiển thị lại trên giao diện
        model.addAttribute("name", name);
        model.addAttribute("address", address);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        model.addAttribute("minRating", minRating);
        model.addAttribute("housesResult", results);

        return "house/searchResult";
    }

    @PostMapping("/register")
    public String registerOwnerWithBoardingHouse(
            @RequestParam("landCertificate") MultipartFile landCertificate,
            @RequestParam("ownershipContract") MultipartFile ownershipContract,
            @RequestParam("house_name") String houseName,
            @RequestParam("max_room_count") int maxRoomCount,
            @RequestParam("house_address") String houseAddress,
            @RequestParam("house_description") String houseDescription,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        try {
            // 1. Kiểm tra người dùng đăng nhập
            User user = (User) session.getAttribute("USER");
            if (user == null) {
                redirectAttributes.addFlashAttribute("error", "Bạn cần đăng nhập.");
                return "redirect:/login";
            }

            // 2. Tạo thư mục uploads/docs nếu chưa tồn tại
            String pdfUploadDir = context.getRealPath("/uploads/docs/");
            File uploadDirFile = new File(pdfUploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            // 3. Lưu file PDF (landCertificate)
            String landCertFileName = System.currentTimeMillis() + "_" + landCertificate.getOriginalFilename();
            File landCertFile = new File(uploadDirFile, landCertFileName);
            landCertificate.transferTo(landCertFile);
            String landCertPath = "/uploads/docs/" + landCertFileName;

            // 4. Lưu file PDF (ownershipContract)
            String ownershipFileName = System.currentTimeMillis() + "_" + ownershipContract.getOriginalFilename();
            File ownershipFile = new File(uploadDirFile, ownershipFileName);
            ownershipContract.transferTo(ownershipFile);
            String ownershipPath = "/uploads/docs/" + ownershipFileName;

            // 5. Gọi service để lưu dữ liệu
            ownerProfileService.register(
                    user.getId(),
                    landCertPath,
                    ownershipPath,
                    houseName,
                    maxRoomCount,
                    houseAddress,
                    houseDescription
            );

            redirectAttributes.addFlashAttribute("success", "Đăng ký nhà trọ thành công!");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Lỗi khi đăng ký: " + e.getMessage());
        }

        return "redirect:/user/ownerListing";
    }

    @PostMapping("/updateApproval")
    public String updateApproval(
            @RequestParam("profileId") int profileId,
            @RequestParam("status") String status,
            @RequestParam(value = "reason", required = false) String reason,
            RedirectAttributes redirectAttributes
    ) {
        try {
            // Cập nhật DB
            ownerProfileService.updateApproval(profileId, status, reason);

            // Lấy thông tin user để gửi email
            OwnerProfile profile = ownerProfileRepository.findById(profileId)
                    .orElseThrow(() -> new RuntimeException("Không tìm thấy hồ sơ"));

            User user = profile.getOwner(); // đảm bảo OwnerProfile có mapping với User

            // Gửi email
            emailService.sendOwnerProfileApprovalEmail(user.getEmail(), user.getFullName(), status, reason);

            redirectAttributes.addFlashAttribute("success",
                    "APPROVED".equals(status) ? "Đã duyệt hồ sơ." : "Đã từ chối hồ sơ và gửi email.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Lỗi: " + e.getMessage());
        }

        return "redirect:/user/ownerProfile/listing";
    }

}
