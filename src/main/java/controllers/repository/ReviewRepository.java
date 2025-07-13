/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

import java.util.List;
import model.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Thanh Duoc
 */
@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {

    List<Review> findByRoomId(Integer roomId);

    int countByRoomId(Integer roomId);

    @Query("SELECT AVG(r.rating) FROM Review r")
    Double calculateAverageRating();

    @Query("SELECT COUNT(r) FROM Review r")
    int getTotalReviews();
}
