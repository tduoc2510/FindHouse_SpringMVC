/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

/**
 *
 * @author Thanh Duoc
 */
import controllers.service.PostService;
import java.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import model.entity.Post;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/posts")
public class PostController {

    @Autowired
    private PostService postService;

    // 📥 Lấy toàn bộ bài đăng và thông tin nhà trọ tương ứng
    @GetMapping()
    public String listAllPosts(Model model) {
        List<Post> posts = postService.getAll(); // Mỗi Post đã có BoardingHouse
        model.addAttribute("posts", posts);
        return "post/list_all"; // View hiển thị toàn bộ bài
    }
     // 👉 Xử lý tạo bài
    @PostMapping("/save")
    public String savePost(@ModelAttribute("post") Post post,
                           RedirectAttributes redirectAttributes) {

        post.setCreatedAt(LocalDateTime.now());
        post.setUpdatedAt(LocalDateTime.now());

        if (post.getStatus() == null || post.getStatus().isEmpty()) {
            post.setStatus("draft");
        }

        postService.save(post);
        redirectAttributes.addFlashAttribute("success", "Đăng bài thành công!");

        return "redirect:/posts/house/" + post.getHouse().getId();
    }
}
