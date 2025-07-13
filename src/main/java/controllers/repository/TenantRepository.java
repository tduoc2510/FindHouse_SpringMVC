/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

import java.util.Date;
import java.util.List;
import model.entity.Tenant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Thanh Duoc
 */
@Repository
public interface TenantRepository extends JpaRepository<Tenant, Integer> {

    List<Tenant> findByUserId(int userId);
    
    @Query("SELECT t FROM Tenant t WHERE t.status = 'active' OR t.rentEnd IS NULL")
    List<Tenant> findActiveTenants();

    @Query("SELECT t FROM Tenant t WHERE t.rentStart >= :startDate AND (t.status = 'active' OR t.rentEnd IS NULL)")
    List<Tenant> findTenantsFromDate(@Param("startDate") Date startDate);

}
