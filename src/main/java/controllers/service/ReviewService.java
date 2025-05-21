/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import controllers.repository.ReviewRepository;
import model.entity.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    // Lấy tất cả đánh giá
    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }

    // Lấy danh sách đánh giá theo roomId
    public List<Review> getReviewsByRoomId(Integer roomId) {
        return reviewRepository.findByRoomId(roomId);
    }

    // Lấy đánh giá theo ID
    public Review getReviewById(Integer id) {
        Optional<Review> review = reviewRepository.findById(id);
        return review.orElse(null);
    }

    // Thêm/Sửa đánh giá
    public Review saveReview(Review review) {
        return reviewRepository.save(review);
    }

    // Xóa đánh giá theo ID
    public void deleteReview(Integer id) {
        reviewRepository.deleteById(id);
    }

    // Đếm số lượng đánh giá theo roomId
    public int countReviewsByRoomId(Integer roomId) {
        return reviewRepository.countByRoomId(roomId);
    }
}
