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
import javax.transaction.Transactional;
import model.entity.BoardingHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.OwnerProfile;
import model.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

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

    public List<OwnerProfile> getProfilesByPage(int page, int size) {
        int offset = (page - 1) * size;
        return ownerProfileRepository.findProfilesWithPagination(offset, size);
    }

    public int countAllProfiles() {
        return ownerProfileRepository.countProfiles();
    }

    public Page<OwnerProfile> getPendingProfiles(Pageable pageable) {
        return ownerProfileRepository.findByApproved("PENDING", pageable);
    }

    @Transactional()
    public Page<OwnerProfile> getAllWithDetails(Pageable pageable) {
        Page<OwnerProfile> page = ownerProfileRepository.findAll(pageable);

        // Lazy load rooms thủ công (tránh multiple bag fetch exception)
        page.getContent().forEach(profile -> {
            profile.getBoardingHouses().forEach(house -> {
                house.getRooms().size(); // trigger lazy
            });
        });

        return page;
    }

}
