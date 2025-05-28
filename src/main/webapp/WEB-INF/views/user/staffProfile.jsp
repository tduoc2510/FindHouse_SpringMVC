<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
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
            <nav class="navbar sidebar navbar-expand-xl navbar-light">
                <!-- Navbar brand for xl START -->
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                        <img class="light-mode-item navbar-brand-item" src="assets/images/logo.svg" alt="logo">
                        <img class="dark-mode-item navbar-brand-item" src="assets/images/logo-light.svg" alt="logo">
                    </a>
                </div>
                <!-- Navbar brand for xl END -->

                <div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
                    <div class="offcanvas-body sidebar-content d-flex flex-column pt-4">

                        <!-- Sidebar menu START -->
                        <ul class="navbar-nav flex-column" id="navbar-sidebar">
                            <!-- Menu item -->
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/user/profile" class="nav-link active">Dashboard</a></li>

                            <!-- Title -->

                        </ul>
                        <!-- Sidebar menu end -->

                        <!-- Sidebar footer START -->
                        <div class="d-flex align-items-center justify-content-between text-primary-hover mt-auto p-3">
                            <a class="h6 fw-light mb-0 text-body" href="${pageContext.request.contextPath}/logout" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Sign out">
                                <i class="fa-solid fa-arrow-right-from-bracket"></i> Log out
                            </a>


                        </div>
                        <!-- Sidebar footer END -->

                    </div>
                </div>
            </nav>
            <!-- Sidebar END -->

            <!-- Page content START -->
            <div class="page-content">



                <!-- Page main content START -->
                <div class="page-content-wrapper p-xxl-4">

                    <!-- Title -->
                    <div class="row">
                        <div class="col-12 mb-4 mb-sm-5">
                            <div class="d-sm-flex justify-content-between align-items-center">
                                <h1 class="h3 mb-2 mb-sm-0">Dashboard</h1>
                                <div class="d-grid"><a href="#" class="btn btn-primary-soft mb-0"><i class="bi bi-plus-lg fa-fw"></i> New Booking</a></div>				
                            </div>
                        </div>
                    </div>

                    <!-- Counter boxes START -->
                    <div class="row g-4 mb-5">
                        <!-- Counter item: Total Hotels -->
                        <div class="col-md-4">
                            <div class="card card-body bg-warning bg-opacity-10 border border-warning border-opacity-25 p-4 h-100">
                                <div class="d-flex justify-content-between align-items-center">
                                    <!-- Digit -->
                                    <div>
                                        <h4 class="mb-0">${contHouse}</h4>
                                        <span class="h6 fw-light mb-0">Total House</span>
                                    </div>
                                    <!-- Icon -->
                                    <div class="icon-lg rounded-circle bg-warning text-white mb-0">
                                        <i class="fa-solid fa-hotel fa-fw"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Counter item: Total Rooms -->
                        <div class="col-md-4">
                            <div class="card card-body bg-primary bg-opacity-10 border border-primary border-opacity-25 p-4 h-100">
                                <div class="d-flex justify-content-between align-items-center">
                                    <!-- Digit -->
                                    <div>
                                        <h4 class="mb-0">${countRoom}</h4>
                                        <span class="h6 fw-light mb-0">Total Rooms</span>
                                    </div>
                                    <!-- Icon -->
                                    <div class="icon-lg rounded-circle bg-primary text-white mb-0">
                                        <i class="fa-solid fa-bed fa-fw"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Counter item: Total Users -->
                        <div class="col-md-4">
                            <div class="card card-body bg-info bg-opacity-10 border border-info border-opacity-25 p-4 h-100">
                                <div class="d-flex justify-content-between align-items-center">
                                    <!-- Digit -->
                                    <div>
                                        <h4 class="mb-0">${countUser}</h4>
                                        <span class="h6 fw-light mb-0">Total Users</span>
                                    </div>
                                    <!-- Icon -->
                                    <div class="icon-lg rounded-circle bg-info text-white mb-0">
                                        <i class="fa-solid fa-users fa-fw"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Counter boxes END -->


                    <!-- Hotel grid START -->
                    <div class="row g-4 mb-5">
                        <!-- Title -->
                        <div class="col-12">
                            <div class="d-flex justify-content-between">
                                <h4 class="mb-0">Popular Boarding Houses</h4>
                                <a href="#" class="btn btn-primary-soft mb-0">View All</a>
                            </div>  
                        </div>

                        <!-- Duyệt danh sách BoardingHouse -->
                        <c:forEach var="entry" items="${top4BoardingHouseList}" varStatus="status">
                            <c:set var="house" value="${entry.key}" />
                            <c:set var="averageRating" value="${entry.value}" />

                            <div class="col-lg-6">
                                <div class="card shadow p-3">
                                    <div class="row g-4">
                                        <!-- Card img -->
                                        <div class="col-md-3 position-relative">
                                            <img src="${pageContext.request.contextPath}/assets/images/category/hotel/01.jpg" class="rounded-2" alt="House Image">

                                            <!-- Huy hiệu xếp hạng -->
                                            <span class="badge position-absolute top-0 start-0 bg-warning text-dark fw-bold p-2">
                                                Top ${status.index + 1}
                                            </span>
                                        </div>

                                        <!-- Card body -->
                                        <div class="col-md-9">
                                            <div class="card-body position-relative d-flex flex-column p-0 h-100">
                                                <!-- Buttons -->
                                                <div class="list-inline-item dropdown position-absolute top-0 end-0">
                                                    <a href="#" class="btn btn-sm btn-round btn-light" role="button" data-bs-toggle="dropdown">
                                                        <i class="bi bi-three-dots-vertical"></i>
                                                    </a>
                                                    <ul class="dropdown-menu dropdown-menu-end min-w-auto shadow">
                                                        <li><a class="dropdown-item small" href="#"><i class="bi bi-info-circle me-2"></i>Report</a></li>
                                                        <li><a class="dropdown-item small" href="#"><i class="bi bi-slash-circle me-2"></i>Disable</a></li>
                                                    </ul>
                                                </div>

                                                <!-- Title -->
                                                <h5 class="card-title mb-0 me-5">
                                                    <a href="house-detail.jsp?id=${house.id}">${house.name}</a>
                                                </h5>
                                                <small><i class="bi bi-geo-alt me-2"></i> ${house.address} </small>

                                                <!-- Description -->
                                                <p class="mt-2 text-secondary fs-6">
                                                    ${house.description}
                                                </p>

                                                <!-- Created At -->
                                                <small class="text-muted fs-6">
                                                    <i class="bi bi-calendar3 me-2"></i> 
                                                    Created at: 
                                                    <fmt:formatDate value="${house.createdAtDate}" pattern="dd/MM/yyyy HH:mm:ss" />
                                                </small>

                                                <!-- Average Rating -->
                                                <p class="text-warning mt-2">
                                                    <i class="bi bi-star-fill"></i> 
                                                    <fmt:formatNumber value="${averageRating}" pattern="#.##" />
                                                </p>

                                                <!-- Price and Button -->
                                                <div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
                                                    <div class="hstack gap-2 mt-3 mt-sm-0">
                                                        <a href="#" class="btn btn-sm btn-primary-soft px-2 mb-0"><i class="bi bi-pencil-square fa-fw"></i></a>    
                                                        <a href="#" class="btn btn-sm btn-danger-soft px-2 mb-0"><i class="bi bi-slash-circle fa-fw"></i></a>    
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




                    <!-- Widget START -->
                    <div class="row g-4">
                        <!-- Reviews START -->
                        <div class="col-lg-6 col-xxl-4">
                            <div class="card shadow h-100">
                                <!-- Card header -->
                                <div class="card-header border-bottom d-flex justify-content-between align-items-center p-3">
                                    <h5 class="card-header-title">Reviews</h5>
                                    <a href="#" class="btn btn-link p-0 mb-0">View all</a>
                                </div>

                                <!-- Card body START -->
                                <div class="card-body p-3">
                                    <c:forEach var="review" items="${reviewList}">
                                        <!-- Review item START -->
                                        <div class="d-flex justify-content-between align-items-center">
                                            <!-- Info -->
                                            <div class="ms-sm-3 mt-2 mt-sm-0">
                                                <h6 class="mb-1">${review.user.username} - <span>${review.room.house.name}</span></h6>
                                                <p class="mb-1">${review.comment}</p>
                                                <small class="text-muted">Posted on: 
                                                    <fmt:formatDate value="${review.createdAt}" pattern="dd/MM/yyyy HH:mm:ss" />
                                                </small>

                                                <!-- Rating -->
                                                <ul class="list-inline smaller mb-0">
                                                    <c:forEach begin="1" end="${review.rating}">
                                                        <li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
                                                        </c:forEach>
                                                        <c:forEach begin="${review.rating + 1}" end="5">
                                                        <li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>
                                            <!-- Button -->
                                            <a href="#" class="btn btn-sm btn-light flex-shrink-0 mb-0 ms-3">View</a>
                                        </div>
                                        <!-- Review item END -->
                                        <hr> <!-- Divider -->
                                    </c:forEach>
                                </div>
                                <!-- Card body END -->

                            </div>
                        </div>
                        <!-- Reviews END -->
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
