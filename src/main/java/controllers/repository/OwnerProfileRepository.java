/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;

import java.util.List;
import java.util.Optional;
import model.entity.OwnerProfile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Thanh Duoc
 */
@Repository
public interface OwnerProfileRepository extends JpaRepository<OwnerProfile, Integer> {

    List<OwnerProfile> findAllByOwnerId(int ownerId);

    @Query("SELECT o FROM OwnerProfile o ORDER BY o.createdAt DESC")
    List<OwnerProfile> findProfilesWithPagination(Pageable pageable);

    default List<OwnerProfile> findProfilesWithPagination(int offset, int size) {
        return findProfilesWithPagination((Pageable) PageRequest.of(offset / size, size));
    }

    @Query("SELECT COUNT(o) FROM OwnerProfile o")
    int countProfiles();

    @EntityGraph(attributePaths = {"boardingHouses", "owner"}) // Only boardingHouses, not rooms!
    @Query("SELECT o FROM OwnerProfile o")
    Page<OwnerProfile> findAllWithBoardingHouses(Pageable pageable);

    Page<OwnerProfile> findByApproved(String approved, Pageable pageable);

    long countByApproved(String approved);
}
