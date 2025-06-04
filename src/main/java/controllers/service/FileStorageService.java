/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Thanh Duoc
 */
@Service
public class FileStorageService {

    private final Path rootDir = Paths.get("uploads/docs");

    public String saveFile(MultipartFile file) throws IOException {
        // Tạo thư mục nếu chưa có
        if (!Files.exists(rootDir)) {
            Files.createDirectories(rootDir);
        }

        // Tạo tên file duy nhất
        String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        Path filePath = rootDir.resolve(filename);

        // Lưu file vào thư mục
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        // Trả về đường dẫn tương đối (dùng để lưu DB hoặc render)
        return "/uploads/docs/" + filename;
    }
}
