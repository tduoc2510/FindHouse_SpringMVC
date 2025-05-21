package controllers.repository;

import java.util.List;
import model.entity.BookingRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
public interface BookingRequestRepository extends JpaRepository<BookingRequest, Integer> {

    List<BookingRequest> findByUser_Id(Integer userId);  // ✅ Lấy danh sách BookingRequest theo userId

       List<BookingRequest> findByRoom_House_Owner_Id(Integer ownerId);


}
