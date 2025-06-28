/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import model.entity.Report;
import model.entity.User;
import model.entity.Room;
import model.entity.Tenant;
import controllers.repository.ReportRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import java.util.Optional;

@Service
public class ReportService {

    @Autowired
    private ReportRepository reportRepository;

    // Tạo mới một report
    public void createReport(Report report) {
        reportRepository.save(report);
    }

    // Lấy danh sách report của một người dùng
    public List<Report> getReportsByUser(User user) {
        return reportRepository.findByReporter(user);
    }

    // Lấy tất cả report (dành cho admin)
    public List<Report> getAllReports() {
        return reportRepository.findAll();
    }

    // Lấy các report theo phòng
    public List<Report> getReportsByRoom(Room room) {
        return reportRepository.findByRoom(room);
    }

    // Lấy các report theo trạng thái
    public List<Report> getReportsByStatus(String status) {
        return reportRepository.findByStatus(status);
    }

    // Lấy các report theo tenant
    public List<Report> getReportsByTenant(Tenant tenant) {
        return reportRepository.findByTenant(tenant);
    }

    // Cập nhật trạng thái xử lý
    public void updateStatus(Long reportId, String status) {
        Optional<Report> optionalReport = reportRepository.findById(reportId);
        if (optionalReport.isPresent()) {
            Report report = optionalReport.get();
            report.setStatus(status);
            reportRepository.save(report);
        }
    }

    // Gửi phản hồi cho report
    public void replyToReport(Long reportId, String reply) {
        Optional<Report> optionalReport = reportRepository.findById(reportId);
        if (optionalReport.isPresent()) {
            Report report = optionalReport.get();
            report.setReply(reply);
            report.setStatus("RESOLVED");
            reportRepository.save(report);
        }
    }

    // Lấy 1 report theo id
    public Report getById(Long id) {
        return reportRepository.findById(id).orElse(null);
    }

    public List<Report> getReportsByOwner(User owner) {
        List<Report> reports = reportRepository.findReportsByOwnerWithRelations(owner);

        // Ép load các trường cần thiết (phòng và người báo cáo), đề phòng Lazy nếu có entity chưa `JOIN FETCH`
        reports.forEach(report -> {
            if (report.getRoom() != null) {
                report.getRoom().getTitle(); // trigger Room
                if (report.getRoom().getHouse() != null) {
                    report.getRoom().getHouse().getName(); // trigger House nếu cần
                }
            }
            if (report.getReporter() != null) {
                report.getReporter().getFullName(); // trigger Reporter
            }
        });

        return reports;
    }

}
