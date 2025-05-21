/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

import controllers.service.BoardingHouseService;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import model.entity.BoardingHouse;
import model.entity.Review;
import model.entity.Room;
import model.entity.RoomImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Thanh Duoc
 */
@Controller
@RequestMapping("/boarding-house")
public class BoardingHouseController {

    @Autowired
    private BoardingHouseService boardingHouseService;

    @GetMapping("/houseList")
    public String getAllBoardingHouses(Model model) {
        List<BoardingHouse> houses = boardingHouseService.getAllBoardingHouses();
        Map<Integer, Double> houseRatings = new HashMap<>();

        for (BoardingHouse house : houses) {
            double averageRating = boardingHouseService.getAverageRatingByHouseId(house.getId());
            houseRatings.put(house.getId(), averageRating);
        }

        model.addAttribute("houses", houses);
        model.addAttribute("houseRatings", houseRatings);
        return "house/list"; // Trả về view hiển thị danh sách nhà trọ
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
        Map<Integer, Double> houseRatings = new HashMap<>();

        for (BoardingHouse house : results) {
            double averageRating = boardingHouseService.getAverageRatingByHouseId(house.getId());
            houseRatings.put(house.getId(), averageRating);
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

}
