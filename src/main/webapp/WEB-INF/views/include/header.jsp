<%-- 
    Document   : header
    Created on : Feb 28, 2025, 2:27:21 PM
    Author     : Thanh Duoc
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="navbar-light header-sticky">
    <!-- Logo Nav START -->
    <nav class="navbar navbar-expand-xl">
        <div class="container">
            <!-- Logo START -->
            <!--            <a class="navbar-brand" href="index.html">
                            <img class="light-mode-item navbar-brand-item" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo" style="width: 200px;height: 200px;">
                        </a>
            -->                        
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <img style="height: 150px" class="light-mode-item navbar-brand-item" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo"  z  >
            </a>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <img style="height: 150px" class="dark-mode-item navbar-brand-item" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo"  z  >
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

            <!-- Responsive category toggler -->
            <button class="navbar-toggler ms-sm-auto mx-3 me-md-0 p-0 p-sm-2" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarCategoryCollapse"
                    aria-controls="navbarCategoryCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <i class="bi bi-grid-3x3-gap-fill fa-fw"></i><span
                    class="d-none d-sm-inline-block small">Category</span>
            </button>

            <!-- Main navbar START -->
            <div class="navbar-collapse collapse" id="navbarCollapse">
                <ul class="navbar-nav navbar-nav-scroll me-auto">


                    <li class="nav-item">
                        <a class="nav-link" href="/boarding-house/houseList" id="listingMenu" 
                           aria-haspopup="true" aria-expanded="false">Danh sách phòng trọ</a>
                    </li>


                </ul>
            </div>
            <!-- Main navbar END -->

            <!-- Nav category menu START -->


            <c:if test="${empty USER}">
                <div class="navbar-collapse collapse" id="navbarCategoryCollapse">
                    <ul class="navbar-nav navbar-nav-scroll nav-pills-primary-soft text-center ms-auto p-2 p-xl-0">
                        <!-- Nav item Hotel -->
                        <li class="nav-item"> <a class="nav-link active" href="${pageContext.request.contextPath}/signup">Sign Up</a> </li>
                        <li class="nav-item"> <a class="nav-link active" href="${pageContext.request.contextPath}/login">Login</a> </li>

                    </ul>
                </div>
            </c:if>
            <c:if test="${not empty USER}">
                <!-- Nav category menu END -->

                <!-- Profile and Notification START -->
                <ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">



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
                                    </div>
                                </div>
                            </li>

                            <!-- Links -->
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <c:if test="${USER.role =='tenant'}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/booking"><i class="bi bi-bookmark-check fa-fw me-2"></i>My
                                        Bookings</a></li>
                                    </c:if>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile"><i class="bi bi-gear fa-fw me-2"></i>Profile</a></li>

                            <li><a class="dropdown-item bg-danger-soft-hover" href="/logout"><i
                                        class="bi bi-power fa-fw me-2"></i>Sign Out</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>


                        </ul>
                    </li>
                    <!-- Profile dropdown END -->
                </ul>
            </c:if>
            <!-- Profile and Notification START -->

        </div>
    </nav>
    <!-- Logo Nav END -->
</header>