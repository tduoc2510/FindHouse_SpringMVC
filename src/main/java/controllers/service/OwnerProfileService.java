/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

/**
 *
 * @author Thanh Duoc
 */
import controllers.repository.OwnerProfileRepository;
import controllers.repository.UserRepository;
import java.util.List;
import model.entity.BoardingHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.OwnerProfile;
import model.entity.User;

@Service
public class OwnerProfileService {

    @Autowired
    private OwnerProfileRepository ownerProfileRepository;

    public List<OwnerProfile> getProfilesByOwnerId(int ownerId) {
        return ownerProfileRepository.findAllByOwnerId(ownerId);
    }
    @Autowired
    private UserRepository userRepository;

    public List<OwnerProfile> getAllProfiles() {
        return ownerProfileRepository.findAll();
    }

    public void register(Integer userId,
            String landCertUrl,
            String contractUrl,
            String houseName,
            int maxRooms,
            String address,
            String description) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Tạo OwnerProfile
        OwnerProfile profile = new OwnerProfile();
        profile.setOwner(user);
        profile.setLandCertificate(landCertUrl);
        profile.setOwnershipContract(contractUrl);

        // Tạo BoardingHouse
        BoardingHouse house = new BoardingHouse();
        house.setName(houseName);
        house.setAddress(address);
        house.setDescription(description);
        house.setMaxRoomCount(maxRooms);
        house.setProfile(profile); // ánh xạ ngược lại

        // Gán house vào profile
        profile.setBoardingHouses(List.of(house)); // hoặc new ArrayList<>() nếu nhiều hơn

        // Save: JPA sẽ cascade xuống BoardingHouse
        ownerProfileRepository.save(profile);
    }

    public void updateApproval(int profileId, String status, String reason) {
        OwnerProfile profile = ownerProfileRepository.findById(profileId)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy hồ sơ chủ trọ"));

        profile.setApproved(status);

        // Nếu từ chối thì lưu lý do
        if ("REJECTED".equals(status)) {
            profile.setReason(reason);
        } 

        ownerProfileRepository.save(profile);
    }
}
