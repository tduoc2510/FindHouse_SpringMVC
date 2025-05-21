<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from stackbros.in/bookinga/landing/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:03:39 GMT -->
    <%@include file="../include/head.jsp" %>

    <body>

        <!-- **************** MAIN CONTENT START **************** -->        <%@include file="../include/header.jsp" %>

        <main>

            <!-- =======================
            Content START -->
            <section class="pt-3">
                <div class="container">
                    <div class="row">

                        <!-- Sidebar START -->
                        <%@include file="user.include/sideBar.jsp" %>
                        <!-- Sidebar END -->

                        <!-- Main content START -->
                        <div class="col-lg-8 col-xl-9 ps-xl-5">

                            <!-- Offcanvas menu button -->
                            <div class="d-grid mb-0 d-lg-none w-100">
                                <button class="btn btn-primary mb-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                                    <i class="fas fa-sliders-h"></i> Menu
                                </button>
                            </div>

                            <div class="card border bg-transparent">
                                <!-- Card header -->
                                <div class="card-header bg-transparent border-bottom">
                                    <h4 class="card-header-title">My Bookings</h4>
                                </div>

                                <!-- Card body START -->
                                <div class="card-body p-0">

                                    <!-- Tabs -->
                                    <ul class="nav nav-tabs nav-bottom-line nav-responsive nav-justified">
                                        <li class="nav-item"> 
                                            <a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab-1"><i class="bi bi-briefcase-fill fa-fw me-1"></i>Lịch sử thuê trọ</a> 
                                        </li>
                                    </ul>

                                    <!-- Tabs content START -->
                                    <div class="tab-content p-2 p-sm-4" id="nav-tabContent">

                                        <!-- Tab content item START -->

                                        <div class="tab-pane fade show active" id="tab-1">

                                            <!-- Card item START -->

                                            <c:forEach items="${bookingRequests}" var="booking">
                                                <div class="card border mb-4">
                                                    <!-- Card header -->
                                                    <div class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
                                                        <!-- Icon and Title -->
                                                        <div class="d-flex align-items-center">
                                                            <div class="icon-lg bg-light rounded-circle flex-shrink-0"><i class="fa-solid fa-house"></i></div>	
                                                            <!-- Title -->
                                                            <div class="ms-2">
                                                                <h6 class="card-title mb-0"><a href="${pageContext.request.contextPath}/boarding-house/${booking.room.house.id}">
                                                                        ${booking.room.title} - ${booking.room.house.name}</a></h6>
                                                                <ul class="nav nav-divider small">
                                                                    <li class="nav-item">Booking ID: ${booking.id}</li>
                                                                    <li class="nav-item">Địa chỉ trọ: ${booking.room.house.address}</li>
                                                                </ul>
                                                            </div>
                                                        </div>


                                                        <!-- Modal -->

                                                        <!-- Button -->
                                                        <c:if test="${booking.status=='confirm2'}">
                                                            <div class="mt-2 mt-md-0">
                                                                <a href="#" class="btn btn-primary-soft mb-0" data-bs-toggle="modal" data-bs-target="#roomDetail">Xem hợp đồng</a>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${booking.status=='rejected'}">
                                                            <div class="mt-2 mt-md-0">
                                                                <a href="#" class="btn btn-primary-soft mb-0" data-bs-toggle="modal" data-bs-target="#reasonDetail">Xem lý do</a>
                                                            </div>
                                                        </c:if>
                                                        <div class="modal fade" id="reasonDetail" tabindex="-1" aria-labelledby="roomDetailLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content p-0">

                                                                    <!-- Title -->
                                                                    <div class="modal-header p-3">
                                                                        <h5 class="modal-title mb-0" id="roomDetailLabel">Lý do từ chối</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>

                                                                    <!-- Modal body -->
                                                                    <div class="modal-body p-0">
                                                                        <!-- Card START -->
                                                                        <div class="card bg-transparent p-3">

                                                                            <!-- Card header -->
                                                                            <div class="card-header bg-transparent pb-0">
                                                                                <h3 class="card-title mb-1">${booking.room.house.name}</h3>
                                                                                <h4 class="card-title text-muted">${booking.room.title}</h4>
                                                                            </div>

                                                                            <!-- Card body START -->
                                                                            <div class="card-body">
                                                                                <!-- Mô tả phòng -->
                                                                                <p>Nhà trọ: ${booking.reason}</p>

                                                                            </div>




                                                                            <!-- Card body END -->

                                                                        </div>
                                                                        <!-- Card END -->
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal fade" id="roomDetail" tabindex="-1" aria-labelledby="roomDetailLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content p-0">

                                                                    <!-- Title -->
                                                                    <div class="modal-header p-3">
                                                                        <h5 class="modal-title mb-0" id="roomDetailLabel">Thông Tin Hợp đồng</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>

                                                                    <!-- Modal body -->
                                                                    <div class="modal-body p-0">
                                                                        <!-- Card START -->
                                                                        <div class="card bg-transparent p-3">

                                                                            <!-- Card header -->
                                                                            <div class="card-header bg-transparent pb-0">
                                                                                <h3 class="card-title mb-1">${booking.room.house.name}</h3>
                                                                                <h4 class="card-title text-muted">${booking.room.title}</h4>
                                                                            </div>

                                                                            <!-- Card body START -->
                                                                            <div class="card-body">
                                                                                <!-- Mô tả phòng -->
                                                                                <p>${booking.room.description}</p>

                                                                                <!-- Tiện nghi -->
                                                                                <div class="row">
                                                                                    <h5 class="mb-2">Tiện nghi</h5>
                                                                                    <hr>
                                                                                    <li class="list-group-item d-flex align-items-center mb-2">
                                                                                        <i class="fa-solid fa-check-circle text-success me-2"></i>
                                                                                        <span class="h6 fw-light mb-0">${booking.room.amenities}</span>
                                                                                    </li>
                                                                                    <hr>
                                                                                    <li class="list-group-item d-flex align-items-center mb-2">
                                                                                        <i class="fa-solid fa-hotel text-success me-2"></i>
                                                                                        <span class="h6 fw-light mb-0">Giá: <strong>${booking.room.price} VND/tháng</strong></span>
                                                                                    </li>
                                                                                </div>

                                                                                <!-- Thông tin hợp đồng -->
                                                                                <div class="bg-secondary text-white p-4 rounded mt-3" style="height: 300px;">
                                                                                    <h5 class="text-center mb-3">Thông tin hợp đồng</h5>
                                                                                    <div class="row g-4">
                                                                                        <!-- Nội dung thống kê hợp đồng ở đây -->
                                                                                    </div>
                                                                                </div>
                                                                                <div class="mt-4 d-flex align-items-center">
                                                                                    <input class="form-check-input me-2" type="checkbox" id="confirmCheckbox" onchange="togglePaymentButton()">
                                                                                    <label class="form-check-label h6 fw-light mb-0" for="confirmCheckbox">
                                                                                        Tôi đồng ý với các điều khoản hợp đồng
                                                                                    </label>
                                                                                </div>


                                                                                <form action="${pageContext.request.contextPath}/booking/update-status" method="post">
                                                                                    <input type="hidden" name="status" value="confirm3">
                                                                                    <input type="hidden" name="requestId" value="${booking.id}">

                                                                                    <button id="paymentButton" type="submit" class="btn btn-primary mt-3 w-100" disabled>Xác nhận thanh toán</button>
                                                                                </form>

                                                                            </div>
                                                                            <!-- Card body END -->

                                                                        </div>
                                                                        <!-- Card END -->
                                                                    </div>
                                                                    <script>
                                                                        function togglePaymentButton() {
                                                                            const checkbox = document.getElementById('confirmCheckbox');
                                                                            const paymentButton = document.getElementById('paymentButton');
                                                                            paymentButton.disabled = !checkbox.checked;
                                                                        }
                                                                    </script>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Card body -->
                                                    <div class="card-body">
                                                        <div class="row g-3">
                                                            <div class="col-sm-6 col-md-4">
                                                                <span>Đặt vào lúc</span>
                                                                <h6 class="mb-0"><fmt:formatDate value="${booking.requestedAt}" pattern="dd/MM/yyyy HH:mm:ss" /></h6>
                                                            </div>

                                                            <div class="col-sm-6 col-md-4">
                                                                <span>Cập nhật lần cuối</span>
                                                                <h6 class="mb-0"><fmt:formatDate value="${booking.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss" /></h6>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <span>Trạng thái</span>
                                                                <c:choose>
                                                                    <c:when test="${booking.status == 'pending'}">
                                                                        <div class="badge text-bg-warning">Đang chờ xác nhận</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'confirm1'}">
                                                                        <div class="badge text-bg-warning">Đang đợi chủ trọ xác nhận</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'confirm2'}">
                                                                        <div class="badge text-bg-warning">Đang đợi bạn thanh toán</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'confirm3'}">
                                                                        <div class="badge text-bg-success">Đã thanh toán</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'rejected'}">
                                                                        <div class="badge text-bg-danger">Bị từ chối</div>


                                                                    </c:when>

                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <c:if test="${empty bookingRequests}">
                                                <p>Hiện tại chưa có lịch sử thuê trọ</p><!-- comment -->
                                            </c:if>
                                            <!-- Card item END -->

                                            <!-- Card item START -->

                                            <!-- Card item END -->
                                        </div>
                                        <!-- Tabs content item END -->


                                    </div>

                                </div>
                                <!-- Card body END -->
                            </div>
                        </div>
                        <!-- Main content END -->

                    </div>
                </div>
            </section>
            <!-- =======================
            Content END -->

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