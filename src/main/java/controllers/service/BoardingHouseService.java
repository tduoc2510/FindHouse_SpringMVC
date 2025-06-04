/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

/**
 *
 * @author Thanh Duoc
 */
import controllers.repository.BoardingHouseRepository;
import controllers.repository.ReviewRepository;
import controllers.repository.RoomImageRepository;
import controllers.repository.RoomRepository;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import model.entity.BoardingHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import model.entity.Review;
import model.entity.Room;
import model.entity.RoomImage;

@Service
public class BoardingHouseService {

    @Autowired
    private BoardingHouseRepository boardingHouseRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private RoomImageRepository roomImageRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    public List<RoomImage> getImageByRoomId(int roomId) {
        return roomImageRepository.findByRoom_Id(roomId);
    }

    public List<BoardingHouse> getAllBoardingHouses() {
        return boardingHouseRepository.findAll();
    }

    public Optional<BoardingHouse> getBoardingHouseById(Integer id) {
        return boardingHouseRepository.findById(id);
    }

    public BoardingHouse saveBoardingHouse(BoardingHouse boardingHouse) {
        return boardingHouseRepository.save(boardingHouse);
    }

    public void deleteBoardingHouse(Integer id) {
        boardingHouseRepository.deleteById(id);
    }

    public List<Room> getRoomsByHouseId(Integer houseId) {
        return roomRepository.findByHouse_Id(houseId);
    }

    public List<Review> getReviewsByHouseId(Integer houseId) {
        List<Room> rooms = getRoomsByHouseId(houseId);
        List<Review> allReviews = new ArrayList<>();

        for (Room room : rooms) {
            List<Review> reviews = reviewRepository.findByRoomId(room.getId());
            allReviews.addAll(reviews);
        }
        return allReviews;
    }

    // Lấy tổng số đánh giá của một căn hộ
    public int getTotalReviewsByHouseId(Integer houseId) {
        List<Room> rooms = roomRepository.findByHouse_Id(houseId);
        int totalReviews = 0;

        for (Room room : rooms) {
            totalReviews += reviewRepository.countByRoomId(room.getId());
        }

        return totalReviews;
    }

    // Lấy điểm đánh giá trung bình của một căn hộ
    public double getAverageRatingByHouseId(Integer houseId) {
        List<Room> rooms = roomRepository.findByHouse_Id(houseId);
        int totalReviews = 0;
        double sumRatings = 0.0;

        for (Room room : rooms) {
            List<Review> reviews = reviewRepository.findByRoomId(room.getId());
            for (Review review : reviews) {
                sumRatings += review.getRating();
                totalReviews++;
            }
        }

        return totalReviews > 0 ? sumRatings / totalReviews : 0.0;
    }

    public Map<String, Object> getRatingStatsByHouseId(Integer houseId) {
        List<Room> rooms = roomRepository.findByHouse_Id(houseId);
        int totalReviews = 0;
        double sumRatings = 0.0;

        for (Room room : rooms) {
            List<Review> reviews = reviewRepository.findByRoomId(room.getId());
            for (Review review : reviews) {
                sumRatings += review.getRating();
                totalReviews++;
            }
        }

        double averageRating = totalReviews > 0 ? sumRatings / totalReviews : 0.0;

        Map<String, Object> result = new HashMap<>();
        result.put("averageRating", averageRating);
        result.put("totalReviews", totalReviews);
        return result;
    }

    public List<BoardingHouse> searchBoardingHouses(String name, String address, BigDecimal minPrice, BigDecimal maxPrice, Double minRating) {
        List<BoardingHouse> houses = boardingHouseRepository.searchBoardingHouses(name, address, minPrice, maxPrice);

        if (minRating != null) {
            houses = houses.stream()
                    .filter(house -> {
                        double avgRating = getAverageRatingByHouseId(house.getId());
                        return avgRating >= minRating && avgRating < minRating + 1;
                    })
                    .collect(Collectors.toList());
        }

        return houses;
    }

    // Đếm House
    public int countBoardingHouses() {
        return (int) boardingHouseRepository.count();
    }

    // Hàm lấy 4 BoardingHouse có số điểm cao nhất
    public Map<BoardingHouse, Double> getTop4BoardingHousesByRating() {
        List<BoardingHouse> houses = boardingHouseRepository.findAll();

        return houses.stream()
                .collect(Collectors.toMap(
                        house -> house, // Key là BoardingHouse
                        house -> getAverageRatingByHouseId(house.getId()), // Value là điểm đánh giá trung bình
                        (oldValue, newValue) -> oldValue, // Merge function (không cần do không có key trùng)
                        LinkedHashMap::new // Dùng LinkedHashMap để giữ thứ tự
                ))
                .entrySet().stream()
                .sorted((e1, e2) -> Double.compare(e2.getValue(), e1.getValue())) // Sắp xếp theo điểm đánh giá giảm dần
                .limit(4) // Chỉ lấy top 4
                .collect(Collectors.toMap(
                        Map.Entry::getKey, // Key là BoardingHouse
                        Map.Entry::getValue, // Value là điểm đánh giá trung bình
                        (oldValue, newValue) -> oldValue, // Merge function
                        LinkedHashMap::new // Đảm bảo giữ thứ tự
                ));
    }

    public List<RoomImage> getAllImagesFromBoardingHouse(int houseId) {
        List<Room> rooms = roomRepository.findByHouse_Id(houseId); // đảm bảo images được nạp (EAGER hoặc JOIN FETCH)
        List<RoomImage> allImages = new ArrayList<>();
        for (Room room : rooms) {
            allImages.addAll(room.getImages());
        }
        return allImages;
    }

    public List<BoardingHouse> getBoardingHousesByProfileId(int profileId) {
        return boardingHouseRepository.findByProfile_Id(profileId);
    }

}
