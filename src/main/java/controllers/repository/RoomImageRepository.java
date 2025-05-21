/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

import java.util.List;
import model.entity.Review;
import model.entity.Room;
import model.entity.RoomImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Thanh Duoc
 */
@Repository
public interface RoomImageRepository extends JpaRepository<RoomImage, Integer> {

    // Lấy danh sách ảnh theo ID phòng
    List<RoomImage> findByRoom_Id(int roomId);

}
