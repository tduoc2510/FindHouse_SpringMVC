package controllers.url;

import controllers.service.BoardingHouseService;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.entity.BoardingHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @Autowired
    private BoardingHouseService boardingHouseService;

    @GetMapping({"/home", "/"}) // Mapping cho trang chính
    public String home(Model model, HttpSession session) {
        List<BoardingHouse> houses = boardingHouseService.getAllBoardingHouses();
        model.addAttribute("houses", houses); // Thêm danh sách căn hộ vào model
        return "index"; // Trả về trang index.jsp
    }

}
