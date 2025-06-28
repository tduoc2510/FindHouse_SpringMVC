/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

import java.util.List;
import model.entity.Report;
import model.entity.Room;
import model.entity.Tenant;
import model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Thanh Duoc
 */
public interface ReportRepository extends JpaRepository<Report, Long> {

    List<Report> findByReporter(User user);

    List<Report> findByRoom(Room room);

    List<Report> findByStatus(String status);

    List<Report> findByTenant(Tenant tenant);

    List<Report> findByRoom_House_Profile_Owner(User owner);

    @Query("SELECT r FROM Report r "
            + "JOIN FETCH r.room rm "
            + "JOIN FETCH rm.house h "
            + "JOIN FETCH h.profile p "
            + "JOIN FETCH p.owner o "
            + "JOIN FETCH r.reporter u "
            + "WHERE o = :owner")
    List<Report> findReportsByOwnerWithRelations(@Param("owner") User owner);

}
