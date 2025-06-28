<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
    <%@include file="../include/head.jsp" %>

    <body>
        <!-- MAIN CONTENT START -->        
        <%@include file="../include/header.jsp" %>

        <main>
            <!-- Menu item START -->
            <%@include file="user.include/ownerNavbar.jsp" %>
            <!-- Menu item END -->

            <!-- Content START -->
            <section class="py-5 bg-light">
                <div class="container">

                    <!-- Page Header -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h1 class="h3 mb-1 text-white">
                                        <i class="bi bi-building me-2 text-primary"></i>
                                        Quản lý nhà trọ
                                    </h1>
                                    <p class="text-muted mb-0">Theo dõi và quản lý các căn hộ của bạn</p>
                                </div>
                                <button class="btn btn-primary btn-lg shadow-sm" data-bs-toggle="modal" data-bs-target="#ownershipModal">
                                    <i class="bi bi-plus-circle me-2"></i>Thêm nhà trọ
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Statistics Cards -->
                    <div class="row g-4 mb-5">
                        <!-- Earnings Card -->
                        <div class="col-lg-4 col-md-6">
                            <div class="card border-0 shadow-sm h-100">
                                <div class="card-body p-4">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="bg-success bg-opacity-10 rounded-circle p-3 me-3">
                                            <i class="bi bi-currency-dollar text-success fs-4"></i>
                                        </div>
                                        <div>
                                            <h6 class="text-muted mb-1">Tổng thu nhập</h6>
                                            <h3 class="text-success mb-0 fw-bold">$25,869</h3>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-success">
                                            <i class="bi bi-arrow-up me-1"></i>0.20% vs tháng trước
                                        </small>
                                        <a href="#" class="btn btn-sm btn-outline-success">Xem chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Booked Rooms Card -->
                        <div class="col-lg-4 col-md-6">
                            <div class="card border-0 shadow-sm h-100">
                                <div class="card-body p-4">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="bg-info bg-opacity-10 rounded-circle p-3 me-3">
                                            <i class="bi bi-calendar-check text-info fs-4"></i>
                                        </div>
                                        <div>
                                            <h6 class="text-muted mb-1">Phòng đã thuê</h6>
                                            <h3 class="text-info mb-0 fw-bold">58</h3>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">Tổng: 102 phòng</small>
                                        <a href="#" class="btn btn-sm btn-outline-info">Xem booking</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Available Rooms Card -->
                        <div class="col-lg-4 col-md-6">
                            <div class="card border-0 shadow-sm h-100">
                                <div class="card-body p-4">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="bg-warning bg-opacity-10 rounded-circle p-3 me-3">
                                            <i class="bi bi-house-door text-warning fs-4"></i>
                                        </div>
                                        <div>
                                            <h6 class="text-muted mb-1">Phòng trống</h6>
                                            <h3 class="text-warning mb-0 fw-bold">42</h3>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">Tổng: 102 phòng</small>
                                        <a href="#" class="btn btn-sm btn-outline-warning">Xem phòng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Boarding Houses List -->
                    <div class="row">
                        <div class="col-12">
                            <c:forEach var="profile" items="${profile}">
                                <!-- Profile Header -->
                                <div class="card shadow-sm mb-4">
                                    <div class="card-header bg-gradient-primary text-white py-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0">
                                                <i class="bi bi-person-badge me-2"></i>
                                                Hồ sơ ID: ${profile.id}
                                            </h5>
                                            <span class="badge bg-light text-dark px-3 py-2">
                                                <i class="bi bi-${profile.approved ? 'check-circle text-success' : 'clock text-warning'} me-1"></i>
                                                ${profile.approved ? 'Đã duyệt' : 'Chờ duyệt'}
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Houses List -->
                                    <div class="card-body p-0">
                                        <c:forEach var="house" items="${profile.boardingHouses}">
                                            <div class="border-bottom p-4">
                                                <div class="row g-4">
                                                    <!-- House Image -->
                                                    <div class="col-md-3">
                                                        <div class="position-relative">
                                                            <div class="tiny-slider-inner rounded-3 overflow-hidden shadow-sm"
                                                                 data-autoplay="true"
                                                                 data-arrow="true"
                                                                 data-dots="false"
                                                                 data-items="1">
                                                                <c:forEach var="image" items="${imagesByHouse[house.id]}">
                                                                    <div>
                                                                        <img src="${pageContext.request.contextPath}${image.imageUrl}"
                                                                             alt="Room image"
                                                                             class="w-100 rounded-3"
                                                                             style="height: 200px; object-fit: cover;" />
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- House Details -->
                                                    <div class="col-md-9">
                                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                                            <div>
                                                                <h4 class="mb-2 text-primary fw-bold">
                                                                    <a href="hotel-detail.jsp?id=${house.id}" class="text-decoration-none">
                                                                        ${house.name}
                                                                    </a>
                                                                </h4>
                                                                <p class="text-muted mb-0">
                                                                    <i class="bi bi-geo-alt me-2"></i>${house.address}
                                                                </p>
                                                            </div>

                                                            <!-- Actions Dropdown -->
                                                            <div class="dropdown">
                                                                <button class="btn btn-outline-secondary btn-sm dropdown-toggle" 
                                                                        type="button" data-bs-toggle="dropdown">
                                                                    <i class="bi bi-three-dots"></i>
                                                                </button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a class="dropdown-item" href="#"><i class="bi bi-pencil me-2"></i>Chỉnh sửa</a></li>
                                                                    <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-trash me-2"></i>Xóa</a></li>
                                                                    <li><hr class="dropdown-divider"></li>
                                                                    <li><a class="dropdown-item" href="#"><i class="bi bi-info-circle me-2"></i>Báo cáo</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <!-- Action Buttons -->
                                                        <div class="d-flex gap-2 mb-3">
                                                            <c:choose>
                                                                <c:when test="${fn:length(house.rooms) lt house.maxRoomCount}">
                                                                    <!-- Vẫn cho phép thêm phòng -->
                                                                    <button class="btn btn-primary btn-sm" 
                                                                            data-bs-toggle="modal" 
                                                                            data-bs-target="#addRoomModal" 
                                                                            data-house-id="${house.id}">
                                                                        <i class="bi bi-plus-circle me-1"></i>Thêm phòng
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- Không cho thêm nữa -->
                                                                    <button class="btn btn-outline-danger btn-sm" disabled>
                                                                        <i class="bi bi-exclamation-triangle me-1"></i>Đã đủ số phòng
                                                                    </button>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <button class="btn btn-outline-secondary btn-sm"
                                                                    type="button"
                                                                    data-bs-toggle="collapse"
                                                                    data-bs-target="#rooms-${house.id}">
                                                                <i class="bi bi-list-ul me-1"></i>Xem phòng
                                                            </button>
                                                        </div>

                                                        <!-- Rooms List (Collapsible) -->
                                                        <div class="collapse" id="rooms-${house.id}">
                                                            <div class="bg-light rounded-3 p-3">
                                                                <h6 class="text-muted mb-3">Danh sách phòng</h6>

                                                                <c:choose>
                                                                    <c:when test="${empty house.rooms}">
                                                                        <div class="text-center py-4">
                                                                            <i class="bi bi-house-door text-muted fs-1 mb-3"></i>
                                                                            <p class="text-muted mb-0">Chưa có phòng nào</p>
                                                                            <small class="text-muted">Nhấn "Thêm phòng" để bắt đầu</small>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="row g-3">
                                                                            <c:forEach var="room" items="${house.rooms}">
                                                                                <div class="col-md-6 col-lg-4">
                                                                                    <div class="card border-start border-primary border-3 h-100">
                                                                                        <div class="card-body p-3">
                                                                                            <div class="d-flex justify-content-between align-items-start mb-2">
                                                                                                <h6 class="fw-bold mb-1">${room.title}</h6>
                                                                                                <span class="badge bg-${room.status eq 'available' ? 'success' : 'secondary'}">
                                                                                                    ${room.status eq 'available' ? 'Còn phòng' : 'Hết phòng'}
                                                                                                </span>
                                                                                            </div>

                                                                                            <div class="mb-2">
                                                                                                <small class="text-muted">
                                                                                                    <i class="bi bi-rulers me-1"></i>${room.area} m²
                                                                                                </small>
                                                                                            </div>

                                                                                            <div class="mb-3">
                                                                                                <div class="text-success fw-bold">
                                                                                                    <fmt:formatNumber value="${room.price}" currencySymbol="VNĐ" /> VNĐ/tháng
                                                                                                </div>
                                                                                            </div>

                                                                                            <!-- Amenities -->
                                                                                            <div class="mb-0">
                                                                                                <small class="text-muted d-block mb-1">Tiện nghi:</small>
                                                                                                <c:forEach var="amenity" items="${room.amenities}" varStatus="status">
                                                                                                    <span class="badge bg-light text-dark me-1 mb-1">
                                                                                                        ${amenity.name}
                                                                                                    </span>
                                                                                                </c:forEach>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Content END -->

        </main>
        <!-- MAIN CONTENT END -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Include Modals -->
        <%@include file="user.include/addRoomForm.jsp" %>
        <%@include file="user.include/addBoardingHouse.jsp" %>
        <%@include file="../include/footer.jsp" %>

    </body>
</html>