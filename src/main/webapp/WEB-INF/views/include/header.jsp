<%-- 
    Document   : header
    Created on : Feb 28, 2025, 2:27:21 PM
    Author     : Thanh Duoc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="navbar-light header-sticky">
    <!-- Logo Nav START -->
    <nav class="navbar navbar-expand-xl">
        <div class="container">
            <!-- Logo START -->
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <img style="height: 80px; width: auto;" class="light-mode-item navbar-brand-item" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo">
            </a>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <img style="height: 80px; width: auto;" class="dark-mode-item navbar-brand-item" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo">
            </a>
            <!-- Logo END -->

            <!-- Responsive navbar toggler -->
            <button class="navbar-toggler ms-auto ms-sm-0 p-0 p-sm-2" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-animation">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
                <span class="d-none d-sm-inline-block small">Menu</span>
            </button>

            <!-- Main navbar START -->
            <div class="navbar-collapse collapse" id="navbarCollapse">
                <ul class="navbar-nav navbar-nav-scroll me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/home">
                            <i class="bi bi-house-door fa-fw me-2"></i>Trang chủ
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/boarding-house/houseList" id="listingMenu">
                            <i class="bi bi-building fa-fw me-2"></i>Danh sách phòng trọ
                        </a>
                    </li><li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/boarding-house/posts" id="listingMenu">
                            <i class="bi bi-newspaper fa-fw me-2"></i>Bài đăng
                        </a>
                    </li>
                    <c:if test="${not empty USER && USER.role == 'owner'}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/user/profile">
                                <i class="bi bi-gear fa-fw me-2"></i>Quản lý nhà trọ
                            </a>
                        </li>
                    </c:if>
                </ul>

                <!-- Right side navigation for guest users -->
                <c:if test="${empty USER}">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/signup">
                                <i class="bi bi-person-plus fa-fw me-2"></i>Đăng ký
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">
                                <i class="bi bi-box-arrow-in-right fa-fw me-2"></i>Đăng nhập
                            </a>
                        </li>
                    </ul>
                </c:if>
            </div>
            <!-- Main navbar END -->

            <!-- Profile section for logged-in users -->
            <c:if test="${not empty USER}">
                <ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">
                    <!-- Notification icon (optional) -->
                    <li class="nav-item ms-2">
                        <a class="nav-link" href="${pageContext.request.contextPath}/notifications" title="Thông báo">
                            <i class="bi bi-bell fa-fw"></i>
                        </a>
                    </li>

                    <!-- Profile dropdown START -->
                    <li class="nav-item ms-3 dropdown">
                        <!-- Avatar -->
                        <a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button"
                           data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <img class="avatar-img rounded-2" src="${pageContext.request.contextPath}/assets/images/avatar/01.jpg" alt="avatar">
                        </a>

                        <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                            aria-labelledby="profileDropdown">
                            <!-- Profile info -->
                            <li class="px-3 mb-3">
                                <div class="d-flex align-items-center">
                                    <!-- Avatar -->
                                    <div class="avatar me-3">
                                        <img class="avatar-img rounded-circle shadow" src="${pageContext.request.contextPath}/assets/images/avatar/01.jpg"
                                             alt="avatar">
                                    </div>
                                    <div>
                                        <a class="h6 mt-2 mt-sm-0" href="#">${USER.username}</a>
                                        <p class="small m-0">${USER.email}</p>
                                        <span class="badge bg-primary">${USER.role}</span>
                                    </div>
                                </div>
                            </li>

                            <!-- Links -->
                            <li><hr class="dropdown-divider"></li>

                            <!-- Profile link for all users -->
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">
                                    <i class="bi bi-person fa-fw me-2"></i>Hồ sơ cá nhân</a>
                            </li>

                            <!-- Tenant specific links -->
                            <c:if test="${USER.role == 'tenant'}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/booking">
                                        <i class="bi bi-bookmark-check fa-fw me-2"></i>Đặt phòng của tôi</a>
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/favorites">
                                        <i class="bi bi-heart fa-fw me-2"></i>Yêu thích</a>
                                </li>
                            </c:if>

                            <!-- Landlord specific links -->
                            <c:if test="${USER.role == 'landlord'}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/landlord/dashboard">
                                        <i class="bi bi-speedometer2 fa-fw me-2"></i>Bảng điều khiển</a>
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/landlord/manage-houses">
                                        <i class="bi bi-building fa-fw me-2"></i>Quản lý nhà trọ</a>
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/landlord/bookings">
                                        <i class="bi bi-calendar-check fa-fw me-2"></i>Đơn đặt phòng</a>
                                </li>
                            </c:if>

                            <!-- Settings -->
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/settings">
                                    <i class="bi bi-gear fa-fw me-2"></i>Cài đặt</a>
                            </li>

                            <!-- Logout -->
                            <li><a class="dropdown-item bg-danger-soft-hover" href="${pageContext.request.contextPath}/logout">
                                    <i class="bi bi-power fa-fw me-2"></i>Đăng xuất</a>
                            </li>
                        </ul>
                    </li>
                    <!-- Profile dropdown END -->
                </ul>
            </c:if>
        </div>
    </nav>
    <!-- Logo Nav END -->
</header>