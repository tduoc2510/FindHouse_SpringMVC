/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import controllers.repository.UserRepository;
import java.time.Instant;
import java.util.List;
import java.util.Optional;
import model.entity.Room;
import model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thanh Duoc
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(int id) {
        Optional<User> user = userRepository.findById(id);
        return user.orElse(null);
    }

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    public boolean registerUser(String email, String username, String password) {
        // Kiểm tra email hoặc username đã tồn tại
        if (userRepository.existsByEmail(email) || userRepository.existsByUsername(username)) {
            return false;
        }

        // Hash mật khẩu trước khi lưu
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Tạo user mới
        User user = new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(hashedPassword);
        user.setRole("tenant");
        user.setCreatedAt(Instant.now());
        user.setUpdatedAt(Instant.now());

        // Lưu vào database
        userRepository.save(user);
        return true;
    }

    public User validateUser(String email, String password) {
        return userRepository.findByEmail(email)
                .filter(user -> passwordEncoder.matches(password, user.getPassword()))
                .orElse(null);
    }

    // Đếm User
    public int countUsers() {
        return (int) userRepository.count();
    }

}
