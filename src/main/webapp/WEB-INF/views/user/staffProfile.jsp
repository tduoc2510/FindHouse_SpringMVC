<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="model.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from stackbros.in/bookinga/landing/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:03:39 GMT -->
    <%@include file="../include/head.jsp" %>

    <body>

        <!-- **************** MAIN CONTENT START **************** -->        

        <main>

            <!-- Sidebar START -->
            <%@include file="user.include/staffSidebar.jsp" %>
            <!-- Sidebar END -->

            <!-- Page content START -->
            <div class="page-content">

                <!-- Page main content START -->
                <div class="page-content-wrapper p-xxl-4">

                    <!-- Enhanced Header Section -->
                    <div class="row">
                        <div class="col-12 mb-4 mb-sm-5">
                            <!-- Welcome Card -->
                            <div class="card border-0 bg-primary bg-gradient text-white mb-4">
                                <div class="card-body p-4">
                                    <div class="d-sm-flex justify-content-between align-items-center">
                                        <div>
                                            <h1 class="h2 mb-2 text-white fw-bold">
                                                <i class="bi bi-house-door me-2"></i>
                                                Dashboard Overview
                                            </h1>
                                            <p class="mb-0 text-white-50 fs-6">
                                                <i class="bi bi-calendar3 me-2"></i>
                                                Welcome back! Here's what's happening with your properties today.
                                            </p>
                                        </div>
                                        <div class="d-grid d-sm-block mt-3 mt-sm-0">
                                            <a href="#" class="btn btn-light btn-lg shadow-sm">
                                                <i class="bi bi-plus-lg me-2"></i>
                                                New Booking
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Enhanced Counter boxes START -->
                    <div class="row g-4 mb-5">
                        <!-- Counter item: Total Hotels -->
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm h-100">
                                <div class="card-body bg-warning bg-opacity-10 p-4">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <!-- Digit -->
                                        <div>
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="bi bi-arrow-up-right text-success me-2"></i>
                                                <small class="text-success fw-medium">+12% from last month</small>
                                            </div>
                                            <h2 class="mb-1 fw-bold text-white">${contHouse}</h2>
                                            <span class="text-muted fw-medium">Total Houses</span>
                                        </div>
                                        <!-- Icon -->
                                        <div class="bg-warning rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                            <i class="fa-solid fa-hotel fa-fw text-white fs-4"></i>
                                        </div>
                                    </div>
                                    <!-- Progress bar -->
                                    <div class="progress mt-3" style="height: 4px;">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 75%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Counter item: Total Rooms -->
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm h-100">
                                <div class="card-body bg-primary bg-opacity-10 p-4">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <!-- Digit -->
                                        <div>
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="bi bi-arrow-up-right text-success me-2"></i>
                                                <small class="text-success fw-medium">+8% from last month</small>
                                            </div>
                                            <h2 class="mb-1 fw-bold text-white">${countRoom}</h2>
                                            <span class="text-muted fw-medium">Total Rooms</span>
                                        </div>
                                        <!-- Icon -->
                                        <div class="bg-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                            <i class="fa-solid fa-bed fa-fw text-white fs-4"></i>
                                        </div>
                                    </div>
                                    <!-- Progress bar -->
                                    <div class="progress mt-3" style="height: 4px;">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 60%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Counter item: Total Users -->
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm h-100">
                                <div class="card-body bg-info bg-opacity-10 p-4">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <!-- Digit -->
                                        <div>
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="bi bi-arrow-up-right text-success me-2"></i>
                                                <small class="text-success fw-medium">+15% from last month</small>
                                            </div>
                                            <h2 class="mb-1 fw-bold text-white">${countUser}</h2>
                                            <span class="text-muted fw-medium">Total Users</span>
                                        </div>
                                        <!-- Icon -->
                                        <div class="bg-info rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                            <i class="fa-solid fa-users fa-fw text-white fs-4"></i>
                                        </div>
                                    </div>
                                    <!-- Progress bar -->
                                    <div class="progress mt-3" style="height: 4px;">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 85%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Counter boxes END -->

                    <!-- Enhanced Hotel grid START -->
                    <div class="row g-4 mb-5">
                        <!-- Title -->
                        <div class="col-12">
                            <div class="card bg-light border-0 p-4 mb-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h3 class="mb-1 fw-bold text-white">
                                            <i class="bi bi-star-fill text-warning me-2"></i>
                                            Popular Boarding Houses
                                        </h3>
                                        <p class="text-muted mb-0">Top performing properties based on ratings and bookings</p>
                                    </div>
                                    <a href="#" class="btn btn-primary btn-lg">
                                        <i class="bi bi-eye me-2"></i>
                                        View All
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Duyệt danh sách BoardingHouse -->
                        <c:forEach var="entry" items="${top4BoardingHouseList}" varStatus="status">
                            <c:set var="house" value="${entry.key}" />
                            <c:set var="averageRating" value="${entry.value}" />

                            <div class="col-lg-6">
                                <div class="card border-0 shadow-sm mb-4">
                                    <div class="card-body p-4">
                                        <div class="row g-4">
                                            <!-- Card img -->
                                            <div class="col-md-4 position-relative">
                                                <div class="position-relative overflow-hidden rounded-3">
                                                    <img src="${pageContext.request.contextPath}/assets/images/category/hotel/01.jpg" 
                                                         class="img-fluid w-100" 
                                                         style="height: 120px; object-fit: cover;" 
                                                         alt="House Image">

                                                    <!-- Ranking Badge -->
                                                    <div class="position-absolute top-0 start-0 m-2">
                                                        <span class="badge bg-warning text-white fw-bold px-3 py-2 rounded-pill">
                                                            <i class="bi bi-trophy-fill me-1"></i>
                                                            #${status.index + 1}
                                                        </span>
                                                    </div>

                                                    <!-- Rating Badge -->
                                                    <div class="position-absolute bottom-0 end-0 m-2">
                                                        <span class="badge bg-dark bg-opacity-75 text-white px-2 py-1 rounded-pill">
                                                            <i class="bi bi-star-fill text-warning me-1"></i>
                                                            <fmt:formatNumber value="${averageRating}" pattern="#.#" />
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Card body -->
                                            <div class="col-md-8">
                                                <div class="d-flex flex-column h-100">
                                                    <!-- Action Dropdown -->
                                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                                        <div class="flex-grow-1">
                                                            <!-- Title -->
                                                            <h5 class="card-title mb-1 fw-bold">
                                                                <a href="house-detail.jsp?id=${house.id}" class="text-decoration-none text-white">
                                                                    ${house.name}
                                                                </a>
                                                            </h5>
                                                            <!-- Location -->
                                                            <div class="d-flex align-items-center text-muted mb-2">
                                                                <i class="bi bi-geo-alt-fill me-2 text-primary"></i>
                                                                <small class="fw-medium">${house.address}</small>
                                                            </div>
                                                        </div>

                                                        <!-- Actions -->
                                                        <div class="dropdown">
                                                            <button class="btn btn-light btn-sm rounded-pill" type="button" data-bs-toggle="dropdown">
                                                                <i class="bi bi-three-dots-vertical"></i>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-end shadow">
                                                                <li><a class="dropdown-item" href="#"><i class="bi bi-eye me-2"></i>View Details</a></li>
                                                                <li><a class="dropdown-item" href="#"><i class="bi bi-pencil me-2"></i>Edit</a></li>
                                                                <li><hr class="dropdown-divider"></li>
                                                                <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-trash me-2"></i>Delete</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                    <!-- Description -->
                                                    <p class="text-muted mb-3 flex-grow-1" style="font-size: 0.9rem; line-height: 1.4;">
                                                        ${house.description}
                                                    </p>

                                                    <!-- Metadata -->
                                                    <div class="row g-2 mb-3">
                                                        <div class="col-12">
                                                            <small class="text-muted d-flex align-items-center">
                                                                <i class="bi bi-calendar3 me-2 text-info"></i>
                                                                Created: <fmt:formatDate value="${house.createdAtDate}" pattern="dd/MM/yyyy" />
                                                            </small>
                                                        </div>
                                                    </div>

                                                    <!-- Action Buttons -->
                                                    <div class="d-flex gap-2 mt-auto">
                                                        <button class="btn btn-primary btn-sm flex-fill">
                                                            <i class="bi bi-eye me-1"></i>
                                                            View
                                                        </button>
                                                        <button class="btn btn-outline-primary btn-sm flex-fill">
                                                            <i class="bi bi-pencil me-1"></i>
                                                            Edit
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- Hotel grid END -->

                    <!-- Enhanced Widget START -->
                    <div class="row g-4">
                        <!-- Reviews START -->
                        <div class="col-lg-8 col-xl-9">
                            <div class="card border-0 shadow-sm">
                                <!-- Card header -->
                                <div class="card-header bg-light border-bottom-0 p-4">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h4 class="card-title mb-1 fw-bold">
                                                <i class="bi bi-chat-square-quote text-primary me-2"></i>
                                                Recent Reviews
                                            </h4>
                                            <p class="text-muted mb-0">Latest customer feedback and ratings</p>
                                        </div>
                                        <a href="#" class="btn btn-primary">
                                            <i class="bi bi-eye me-2"></i>
                                            View All
                                        </a>
                                    </div>
                                </div>

                                <!-- Card body START -->
                                <div class="card-body">
                                    <c:forEach var="review" items="${reviewList}" varStatus="reviewStatus">
                                        <!-- Review item START -->
                                        <div class="border-bottom pb-4 mb-4">
                                            <div class="row g-3">
                                                <!-- Avatar and User Info -->
                                                <div class="col-auto">
                                                    <div class="bg-primary rounded-circle d-flex align-items-center justify-content-center text-white fw-bold" style="width: 50px; height: 50px;">
                                                        ${review.user.username.substring(0,1).toUpperCase()}
                                                    </div>
                                                </div>

                                                <!-- Review Content -->
                                                <div class="col">
                                                    <!-- User and Property Info -->
                                                    <div class="d-flex flex-wrap justify-content-between align-items-start mb-2">
                                                        <div>
                                                            <h6 class="mb-1 fw-bold text-white">${review.user.username}</h6>
                                                            <small class="text-muted">
                                                                <i class="bi bi-house me-1"></i>
                                                                ${review.room.house.name}
                                                            </small>
                                                        </div>

                                                        <!-- Rating -->
                                                        <div class="d-flex align-items-center">
                                                            <div class="me-2">
                                                                <c:forEach begin="1" end="${review.rating}">
                                                                    <i class="bi bi-star-fill text-warning"></i>
                                                                </c:forEach>
                                                                <c:forEach begin="${review.rating + 1}" end="5">
                                                                    <i class="bi bi-star text-muted"></i>
                                                                </c:forEach>
                                                            </div>
                                                            <span class="badge bg-primary rounded-pill">${review.rating}/5</span>
                                                        </div>
                                                    </div>

                                                    <!-- Review Comment -->
                                                    <blockquote class="blockquote-footer mb-2">
                                                        <p class="mb-2 text-white">"${review.comment}"</p>
                                                    </blockquote>

                                                    <!-- Review Date and Actions -->
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <small class="text-muted">
                                                            <i class="bi bi-clock me-1"></i>
                                                            <fmt:formatDate value="${review.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                                        </small>

                                                        <div class="btn-group btn-group-sm">
                                                            <button class="btn btn-outline-primary btn-sm">
                                                                <i class="bi bi-reply me-1"></i>
                                                                Reply
                                                            </button>
                                                            <button class="btn btn-outline-secondary btn-sm">
                                                                <i class="bi bi-three-dots"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Review item END -->
                                    </c:forEach>

                                    <!-- Empty state if no reviews -->
                                    <c:if test="${empty reviewList}">
                                        <div class="text-center py-5">
                                            <i class="bi bi-chat-square-quote display-1 text-muted mb-3"></i>
                                            <h5 class="text-muted">No reviews yet</h5>
                                            <p class="text-muted">Customer reviews will appear here once submitted.</p>
                                        </div>
                                    </c:if>
                                </div>
                                <!-- Card body END -->
                            </div>
                        </div>
                        <!-- Reviews END -->

                        <!-- Quick Stats Sidebar -->
                        <div class="col-lg-4 col-xl-3">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-light border-bottom-0 p-3">
                                    <h5 class="card-title mb-0 fw-bold">
                                        <i class="bi bi-graph-up text-success me-2"></i>
                                        Quick Stats
                                    </h5>
                                </div>
                                <div class="card-body p-3">
                                    <!-- Occupancy Rate -->
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <small class="text-muted">Occupancy Rate</small>
                                        <span class="fw-bold text-success">85%</span>
                                    </div>
                                    <div class="progress mb-4" style="height: 6px;">
                                        <div class="progress-bar bg-success" style="width: 85%"></div>
                                    </div>

                                    <!-- Revenue This Month -->
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <small class="text-muted">Monthly Revenue</small>
                                        <span class="fw-bold text-primary">$12,500</span>
                                    </div>
                                    <div class="progress mb-4" style="height: 6px;">
                                        <div class="progress-bar bg-primary" style="width: 70%"></div>
                                    </div>

                                    <!-- Avg Rating -->
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <small class="text-muted">Average Rating</small>
                                        <div class="d-flex align-items-center">
                                            <i class="bi bi-star-fill text-warning me-1"></i>
                                            <span class="fw-bold">4.2</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>	
                    <!-- Widget END -->

                </div>
                <!-- Page main content END -->
            </div>
            <!-- Page content END -->

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="${pageContext.request.contextPath}/assets/js/functions.js"></script>

    </body>

    <!-- Mirrored from stackbros.in/bookinga/landing/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:03:39 GMT -->
</html>