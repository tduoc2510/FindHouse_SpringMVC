/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

/**
 *
 * @author Thanh Duoc1
 */
import java.math.BigDecimal;
import java.util.List;
import model.entity.BoardingHouse;
import model.entity.Room;
import model.entity.RoomImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardingHouseRepository extends JpaRepository<BoardingHouse, Integer> {

    @Query("SELECT bh FROM BoardingHouse bh "
            + "LEFT JOIN bh.rooms r "
            + "LEFT JOIN Review rv ON rv.room = r "
            + "WHERE (:name IS NULL OR bh.name LIKE %:name%) "
            + "AND (:address IS NULL OR bh.address LIKE %:address%) "
            + "AND (:minPrice IS NULL OR r.price >= :minPrice) "
            + "AND (:maxPrice IS NULL OR r.price <= :maxPrice) "
            + "GROUP BY bh.id, bh.name, bh.address, bh.description, bh.createdAt, bh.updatedAt, bh.profile,bh.maxRoomCount")
    List<BoardingHouse> searchBoardingHouses(
            @Param("name") String name,
            @Param("address") String address,
            @Param("minPrice") BigDecimal minPrice,
            @Param("maxPrice") BigDecimal maxPrice
    );

    @Query("SELECT DISTINCT i FROM RoomImage i "
            + "JOIN i.room r "
            + "JOIN r.house h "
            + "WHERE h.id = :houseId")
    List<RoomImage> findAllImagesByHouseId(@Param("houseId") int houseId);

    @Query("SELECT r FROM Room r LEFT JOIN FETCH r.images WHERE r.house.id = :houseId")
    List<Room> findByHouse_Id(@Param("houseId") int houseId);

    List<BoardingHouse> findByProfile_Id(int profileId);

    List<BoardingHouse> findByProfileApproved(String approved);

    Page<BoardingHouse> findByProfileApproved(String status, Pageable pageable);

}
