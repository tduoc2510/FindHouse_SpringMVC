/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

import java.util.List;
import java.util.Optional;
import model.entity.OwnerProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Thanh Duoc
 */
@Repository
public interface OwnerProfileRepository extends JpaRepository<OwnerProfile, Integer> {

    List<OwnerProfile> findAllByOwnerId(int ownerId);

}
