/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

/**
 *
 * @author Thanh Duoc
 */
import controllers.repository.RoomRepository;
import model.entity.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoomService {

    @Autowired
    private RoomRepository roomRepository;

    // Lấy tất cả phòng
    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }

    // Lấy danh sách phòng theo BoardingHouse
    public List<Room> getRoomsByHouseId(Integer houseId) {
        return roomRepository.findByHouse_Id(houseId);
    }

    // Lấy phòng theo ID
    public Room getRoomById(Integer id) {
        Optional<Room> room = roomRepository.findById(id);
        return room.orElse(null);
    }

    // Thêm/Sửa phòng
    public Room saveRoom(Room room) {
        return roomRepository.save(room);
    }

    // Xóa phòng theo ID
    public void deleteRoom(Integer id) {
        roomRepository.deleteById(id);
    }

    // Đếm room
    public int countRooms() {
        return (int) roomRepository.count();
    }

    public void saveAllRooms(List<Room> rooms) {
        roomRepository.saveAll(rooms);
    }

}
