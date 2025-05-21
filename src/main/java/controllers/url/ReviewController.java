/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;


import controllers.service.UserService;
import model.entity.Review;
import model.entity.Room;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Thanh Duoc
 */
@Controller
@RequestMapping("/reviews")
public class ReviewController {

//    @Autowired
//    private RoomService roomService;
//
//    @Autowired
//    private UserService userService;
//
//    @PostMapping("/add")
//    public String addReview(@RequestParam Integer roomId,
//            @RequestParam int rating,
//            @RequestParam(required = false) String comment,
//            @RequestParam Integer userId,
//            Model model) {
//        Room room = roomService.getRoomById(roomId);
//        User user = userService.getUserById(userId);
//        if (room == null) {
//            model.addAttribute("error", "Phòng không tồn tại!");
//            return "error";  // Chuyển hướng đến trang lỗi
//        }
//
//        Review review = new Review();
//        review.setRoom(room);
//        review.setUser(user);
//        review.setRating(rating);
//        review.setUser(user);
//
//        review.setComment(comment != null ? comment : "");
//
//        reviewService.addReview(review);
//
//        model.addAttribute("message", "Đánh giá đã được thêm thành công!");
//        model.addAttribute("room", room);
//        model.addAttribute("reviews", reviewService.getReviewsByRoomId(roomId));
//
//        return "redirect:/apts/" + roomId;
//    }
}
