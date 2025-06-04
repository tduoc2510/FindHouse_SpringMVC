package model.entity;

import javax.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.Instant;
import java.util.Date;
import java.util.List;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "OwnerProfiles")
public class OwnerProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "profile_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "owner_id", nullable = false)
    private User owner;

    @Column(name = "land_certificate", length = 255)
    private String landCertificate;

    @Column(name = "ownership_contract", length = 255)
    private String ownershipContract;

    @Column(name = "approved")
    private String approved = "PENDING"; // Hoặc "APPROVED", "REJECTED"
    @Column(name = "reason")
    private String reason; // Hoặc "APPROVED", "REJECTED"

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private Instant createdAt;

    // ⚠️ Thêm ánh xạ với BoardingHouses
    @OneToMany(mappedBy = "profile", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<BoardingHouse> boardingHouses;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private Instant updatedAt;

    // Getters và Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getLandCertificate() {
        return landCertificate;
    }

    public void setLandCertificate(String landCertificate) {
        this.landCertificate = landCertificate;
    }

    public String getOwnershipContract() {
        return ownershipContract;
    }

    public void setOwnershipContract(String ownershipContract) {
        this.ownershipContract = ownershipContract;
    }

    public String getApproved() {
        return approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public List<BoardingHouse> getBoardingHouses() {
        return boardingHouses;
    }

    public void setBoardingHouses(List<BoardingHouse> boardingHouses) {
        this.boardingHouses = boardingHouses;
    }

    public Date getCreatedAtDate() {
        return createdAt != null ? Date.from(createdAt) : null;
    }

    public Date getUpdatedAtAsDate() {
        return updatedAt != null ? Date.from(updatedAt) : null;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

}
