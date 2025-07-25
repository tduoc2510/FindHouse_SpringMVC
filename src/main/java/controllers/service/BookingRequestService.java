/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import controllers.repository.BookingRequestRepository;
import java.time.Instant;
import java.util.Date;

/**
 *
 * @author Thanh Duoc
 */
import model.entity.BookingRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import model.entity.Room;
import model.entity.User;

@Service
public class BookingRequestService {

    @Autowired
    private BookingRequestRepository bookingRequestRepository;

    public List<BookingRequest> getBookingRequestsByUserId(Integer userId) {
        return bookingRequestRepository.findByUser_Id(userId); // ✅ Trả về List<BookingRequest>
    }

    public List<BookingRequest> getRequestsByOwnerId(Integer ownerId) {
        return bookingRequestRepository.findByRoom_House_Profile_Owner_Id(ownerId);
    }

    public BookingRequest getBookingById(int id) {
        return bookingRequestRepository.findById(id).orElse(null);
    }

    public boolean updateBookingStatus(Integer requestId, String newStatus, String reason) {
        Optional<BookingRequest> optionalBooking = bookingRequestRepository.findById(requestId);
        if (optionalBooking.isPresent()) {
            BookingRequest booking = optionalBooking.get();

            // Cập nhật trạng thái
            booking.setStatus(newStatus);

            // Nếu từ chối thì lưu lý do, nếu không thì xóa lý do cũ
            if ("rejected".equals(newStatus)) {
                booking.setReason(reason);
            } else {
                booking.setReason(null); // Đảm bảo không có lý do nếu trạng thái không phải "rejected"
            }

            // Cập nhật thời gian cập nhật
            bookingRequestRepository.save(booking);
            return true;
        }
        return false;
    }

    public void createBooking(User user, Room room, Instant viewingDate) {
        BookingRequest booking = new BookingRequest();
        booking.setUser(user);
        booking.setRoom(room);
        booking.setViewingDate(viewingDate);
        booking.setStatus("pending");
        bookingRequestRepository.save(booking);
    }

    public List<BookingRequest> getBookingsByUser(User user) {
        return bookingRequestRepository.findByUser(user);
    }

    public List<BookingRequest> getPendingRequests() {
        return bookingRequestRepository.findByStatus("pending");
    }

}
