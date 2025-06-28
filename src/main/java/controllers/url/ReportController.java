/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.url;

/**
 *
 * @author Thanh Duoc
 */
import model.entity.Report;
import model.entity.Room;
import model.entity.Tenant;
import model.entity.User;
import controllers.service.ReportService;
import controllers.service.RoomService;
import controllers.service.TenantService;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private TenantService tenantService;

    // Gửi báo cáo
    @PostMapping("/submit")
    public String submitReport(@RequestParam("roomId") Integer roomId,
            @RequestParam("tenantId") Integer tenantId,
            @RequestParam("type") String type,
            @RequestParam("content") String content,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {
        User currentUser = (User) session.getAttribute("USER");
        if (currentUser == null) {
            return "redirect:/login";
        }

        Report report = new Report();
        report.setReporter(currentUser);
        report.setType(type);
        report.setContent(content);
        report.setStatus("PENDING");
        report.setCreatedAt(Instant.now());

        if (roomId != null) {
            Room room = roomService.getRoomById(roomId);
            report.setRoom(room);
        }

        reportService.createReport(report);
        redirectAttributes.addFlashAttribute("successMessage", "Gửi báo cáo thành công!");
        return "redirect:/user/tenant";
    }

    // Admin xem tất cả report
    @GetMapping("/admin/list")
    public String listReports(Model model, HttpSession session) {
        User admin = (User) session.getAttribute("USER");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/login";
        }

        List<Report> reports = reportService.getAllReports();
        model.addAttribute("reports", reports);
        return "admin/reportList";
    }

    // Xem chi tiết 1 report
    @GetMapping("/admin/view/{id}")
    public String viewReport(@PathVariable("id") Long id, Model model) {
        Report report = reportService.getById(id);
        if (report == null) {
            model.addAttribute("error", "Không tìm thấy báo cáo");
            return "admin/reportList";
        }
        model.addAttribute("report", report);
        return "admin/reportDetail";
    }

    // Admin phản hồi
    @PostMapping("/admin/reply")
    public String replyReport(@RequestParam("reportId") Long reportId,
            @RequestParam("reply") String reply,
            RedirectAttributes redirectAttributes) {
        reportService.replyToReport(reportId, reply);
        redirectAttributes.addFlashAttribute("success", "Đã phản hồi báo cáo.");
        return "redirect:/report/admin/list";
    }

    // Admin cập nhật trạng thái (nếu không cần phản hồi)
    @PostMapping("/admin/update-status")
    public String updateStatus(@RequestParam("reportId") Long reportId,
            @RequestParam("status") String status,
            RedirectAttributes redirectAttributes) {
        reportService.updateStatus(reportId, status);
        redirectAttributes.addFlashAttribute("success", "Cập nhật trạng thái thành công.");
        return "redirect:/user/reports";
    }

    // Người dùng xem báo cáo của mình
    @GetMapping("/my")
    public String myReports(HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER");
        if (user == null) {
            return "redirect:/login";
        }

        List<Report> myReports = reportService.getReportsByUser(user);
        model.addAttribute("myReports", myReports);
        return "user/myReports";
    }
}
