package controllers.repository;

import java.util.List;
import model.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Thanh Duoc
 */
@Repository
public interface RoomRepository extends JpaRepository<Room, Integer> {

    List<Room> findByHouse_Id(Integer houseId); // Lấy danh sách phòng theo BoardingHouse
}
