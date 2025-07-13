/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import controllers.repository.PostRepository;
import java.util.List;
import java.util.Optional;
import model.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thanh Duoc
 */
@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    // Lưu hoặc cập nhật bài đăng
    public Post save(Post post) {
        return postRepository.save(post);
    }

    // Lấy tất cả bài đăng
    public List<Post> getAll() {
        return postRepository.findAll();
    }

    // Lấy bài theo ID
    public Post getById(int id) {
        Optional<Post> optionalPost = postRepository.findById(id);
        return optionalPost.orElse(null);
    }

    // Xoá bài theo ID
    public void delete(int id) {
        postRepository.deleteById(id);
    }

    // Lấy danh sách bài theo ID nhà trọ
    public List<Post> getByHouseId(int houseId) {
        return postRepository.findByHouse_Id(houseId);
    }

    // Lấy bài theo trạng thái (draft, published, ...)
    public List<Post> getByStatus(String status) {
        return postRepository.findByStatus(status);
    }

    // Lấy 5 bài mới nhất
    public List<Post> getLatestPosts() {
        return postRepository.findTop5ByOrderByCreatedAtDesc();
    }
}
