/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.entity;

/**
 *
 * @author Thanh Duoc
 */
import javax.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "ServicePackages")
public class ServicePackage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "package_id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @Column(name = "price", precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "duration_days")
    private Integer durationDays;

    @Column(name = "max_posts_per_month")
    private Integer maxPostsPerMonth;

    @Column(name = "is_featured")
    private Boolean isFeatured;

    @Column(name = "has_360_images")
    private Boolean has360Images;

    @Column(name = "title_color", length = 20)
    private String titleColor;

    // Getters and setters...

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getDurationDays() {
        return durationDays;
    }

    public void setDurationDays(Integer durationDays) {
        this.durationDays = durationDays;
    }

    public Integer getMaxPostsPerMonth() {
        return maxPostsPerMonth;
    }

    public void setMaxPostsPerMonth(Integer maxPostsPerMonth) {
        this.maxPostsPerMonth = maxPostsPerMonth;
    }

    public Boolean getIsFeatured() {
        return isFeatured;
    }

    public void setIsFeatured(Boolean isFeatured) {
        this.isFeatured = isFeatured;
    }

    public Boolean getHas360Images() {
        return has360Images;
    }

    public void setHas360Images(Boolean has360Images) {
        this.has360Images = has360Images;
    }

    public String getTitleColor() {
        return titleColor;
    }

    public void setTitleColor(String titleColor) {
        this.titleColor = titleColor;
    }
    
}

