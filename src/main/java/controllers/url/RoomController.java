package controllers.url;

import controllers.service.BoardingHouseService;
import controllers.service.RoomService;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.*;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import model.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/api/rooms")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private BoardingHouseService houseService;

    @Autowired
    private ServletContext context;

    @GetMapping
    @ResponseBody
    public String testRoomApi() {
        return "RoomController is working!";
    }

    @GetMapping("/form")
    public String showRoomForm(Map<String, Object> model) {
        model.put("houseId", 123); // test ID bất kỳ
        return "user/ownerListing";
    }

    @PostMapping("/form")
    public String handleRoomForm(
            @RequestParam("house_id") int houseId,
            @RequestParam("room_title") String title,
            @RequestParam("room_area") BigDecimal area,
            @RequestParam("room_price") BigDecimal price,
            @RequestParam("room_status") String status,
            @RequestParam("room_description") String description,
            @RequestParam(value = "amenities", required = false) List<String> amenities,
            @RequestParam(value = "room_images", required = false) List<MultipartFile> roomImages,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes,
            Model model
    ) {

        try {
            Optional<BoardingHouse> optionalHouse = houseService.getBoardingHouseById(houseId);
            if (!optionalHouse.isPresent()) {
                redirectAttributes.addFlashAttribute("error", "House ID không tồn tại.");
                return "user/ownerListing";
            }

            BoardingHouse house = optionalHouse.get();

            Room room = new Room();
            room.setHouse(house);
            room.setTitle(title);
            room.setArea(area);
            room.setPrice(price);
            room.setStatus(status);
            room.setDescription(description);

            // Thư mục lưu ảnh
            String uploadDir = context.getRealPath("/uploads/rooms/");
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            // Xử lý tiện ích
            if (amenities != null && !amenities.isEmpty()) {
                for (String name : amenities) {
                    if (!name.trim().isEmpty()) {
                        Amenity amenity = new Amenity();
                        amenity.setName(name.trim());
                        amenity.setRoom(room);
                        room.getAmenities().add(amenity);
                    }
                }
            }

            // Xử lý ảnh
            if (roomImages != null && !roomImages.isEmpty()) {
                for (MultipartFile file : roomImages) {
                    if (!file.isEmpty()) {
                        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                        File destFile = new File(uploadDirFile, fileName);
                        file.transferTo(destFile);

                        RoomImage image = new RoomImage();
                        image.setImageUrl("/uploads/rooms/" + fileName);
                        image.setRoom(room);
                        room.getImages().add(image);
                    }
                }
            }

            roomService.saveRoom(room);

            redirectAttributes.addFlashAttribute("success", "Phòng đã được thêm thành công.");
            return "redirect:/user/ownerListing";

        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "Lỗi khi upload ảnh: " + e.getMessage());
            return "redirect:/error404";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Lỗi không xác định: " + e.getMessage());
            return "redirect:/error404";
        }
    }
}
