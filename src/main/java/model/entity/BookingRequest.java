package model.entity;

import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "BookingRequests")
public class BookingRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "request_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private model.entity.User user;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    @Column(name = "status", length = 50, columnDefinition = "NVARCHAR(50) DEFAULT 'pending'")
    private String status;
    @Column(name = "reason", length = 50)
    private String reason;

    @Column(name = "requested_at", columnDefinition = "DATETIME DEFAULT getdate()")
    private Date requestedAt;

    @Column(name = "updated_at", columnDefinition = "DATETIME DEFAULT getdate()")
    private Date updatedAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public model.entity.User getUser() {
        return user;
    }

    public void setUser(model.entity.User user) {
        this.user = user;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getRequestedAt() {
        return requestedAt;
    }

    public void setRequestedAt(Date requestedAt) {
        this.requestedAt = requestedAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void updateStatus(String newStatus) {
        this.status = newStatus;
        this.updatedAt = new Date(); // Cập nhật thời gian thay đổi trạng thái
    }
}
