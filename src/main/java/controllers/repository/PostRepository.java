/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

/**
 *
 * @author Thanh Duoc
 */
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import model.entity.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {

    // Lấy tất cả bài viết theo nhà trọ
    List<Post> findByHouse_Id(int houseId);

    // Tìm bài theo trạng thái
    List<Post> findByStatus(String status);

    // Gợi ý: tìm bài mới nhất
    List<Post> findTop5ByOrderByCreatedAtDesc();
}
