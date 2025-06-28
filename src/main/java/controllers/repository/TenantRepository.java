/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

import java.util.List;
import model.entity.Tenant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Thanh Duoc
 */
@Repository
public interface TenantRepository extends JpaRepository<Tenant, Integer> {

    List<Tenant> findByUserId(int userId);

}
