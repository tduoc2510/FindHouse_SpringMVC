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
                                                        <div class="d-flex align-items-center">
                                                            <div class="icon-lg bg-light rounded-circle flex-shrink-0">
                                                                <i class="fa-solid fa-house"></i>
                                                            </div>
                                                            <div class="ms-2">
                                                                <h6 class="card-title mb-0">
                                                                    <a href="${pageContext.request.contextPath}/boarding-house/${booking.room.house.id}">
                                                                        ${booking.room.title} - ${booking.room.house.name}
                                                                    </a>
                                                                </h6>
                                                                <ul class="nav nav-divider small">
                                                                    <li class="nav-item">Booking ID: ${booking.id}</li>
                                                                    <li class="nav-item">Địa chỉ: ${booking.room.house.address}</li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <c:if test="${booking.status=='confirm2'}">
                                                            <div class="mt-2 mt-md-0">
                                                                <a href="#" class="btn btn-primary-soft mb-0" data-bs-toggle="modal" data-bs-target="#roomDetail${booking.id}">Xem hợp đồng</a>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${booking.status=='rejected'}">
                                                            <div class="mt-2 mt-md-0">
                                                                <a href="#" class="btn btn-primary-soft mb-0" data-bs-toggle="modal" data-bs-target="#reasonDetail${booking.id}">Xem lý do</a>
                                                            </div>
                                                        </c:if>
                                                    </div>

                                                    <!-- Card body -->
                                                    <div class="card-body">
                                                        <div class="row g-3">
                                                            <div class="col-md-4">
                                                                <span>Người đặt</span>
                                                                <h6 class="mb-0">${booking.user.fullName}</h6>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <span>Số điện thoại</span>
                                                                <h6 class="mb-0">${booking.user.phoneNumber}</h6>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <span>Ngày hẹn xem trọ</span>
                                                                <h6 class="mb-0"><fmt:formatDate value="${booking.viewingDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></h6>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <span>Đặt vào lúc</span>
                                                                <h6 class="mb-0"><fmt:formatDate value="${booking.requestedAtAsDate}" pattern="dd/MM/yyyy HH:mm:ss" /></h6>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <span>Cập nhật lần cuối</span>
                                                                <h6 class="mb-0"><fmt:formatDate value="${booking.updatedAtAsDate}" pattern="dd/MM/yyyy HH:mm:ss" /></h6>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <span>Trạng thái</span>
                                                                <c:choose>
                                                                    <c:when test="${booking.status == 'pending'}">
                                                                        <div class="badge text-bg-warning">Đang chờ xác nhận</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'confirm1'}">
                                                                        <div class="badge text-bg-warning">Chờ chủ trọ xác nhận</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'confirm2'}">
                                                                        <div class="badge text-bg-info">Chờ bạn thanh toán</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'confirm3'}">
                                                                        <div class="badge text-bg-success">Đã thanh toán</div>
                                                                    </c:when>
                                                                    <c:when test="${booking.status == 'rejected'}">
                                                                        <div class="badge text-bg-danger">Từ chối</div>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Modal lý do -->
                                                    <div class="modal fade" id="reasonDetail${booking.id}" tabindex="-1">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content p-0">
                                                                <div class="modal-header p-3">
                                                                    <h5 class="modal-title">Lý do từ chối</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                                </div>
                                                                <div class="modal-body p-3">
                                                                    <p>${booking.reason}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Modal hợp đồng -->
                                                    <div class="modal fade" id="roomDetail${booking.id}" tabindex="-1">
                                                        <div class="modal-dialog modal-dialog-centered modal-xl">
                                                            <div class="modal-content p-0">
                                                                <div class="modal-header p-3">
                                                                    <h5 class="modal-title">Thông tin hợp đồng</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                                </div>

                                                                <div class="modal-body p-4">
                                                                    <!-- Thông tin phòng -->
                                                                    <h5 class="mb-2"><strong>${booking.room.house.name}</strong> - ${booking.room.title}</h5>
                                                                    <p class="mb-3">${booking.room.description}</p>

                                                                    <div class="row g-3">
                                                                        <div class="col-md-6">
                                                                            <p><strong>Tiện nghi:</strong></p>
                                                                            <ul>
                                                                                <c:forEach var="amenity" items="${booking.room.amenities}">
                                                                                    <li>${amenity.name}</li>
                                                                                    </c:forEach>
                                                                            </ul>
                                                                            <p><strong>Giá thuê:</strong> <fmt:formatNumber value="${booking.room.price}" /> VND/tháng</p>
                                                                            <p><strong>Diện tích:</strong> ${booking.room.area} m²</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bg-light p-3 rounded mt-4">
                                                                        <h6 class="mb-3"><i class="fa-solid fa-file-contract me-2"></i>Thông tin hợp đồng</h6>
                                                                        <ul class="list-unstyled mb-0">
                                                                            <li><strong>Mã hợp đồng:</strong> HD${booking.id} </li>
                                                                            <li><strong>Ngày hiệu lực:</strong> <fmt:formatDate value="${booking.requestedAtAsDate}" pattern="dd/MM/yyyy" /></li>
                                                                            <li><strong>Thời hạn thuê:</strong> 12 tháng</li>
                                                                            <li><strong>Đặt cọc:</strong> 1 tháng tiền nhà</li>
                                                                            <li><strong>Hình thức thanh toán:</strong> Chuyển khoản hàng tháng</li>
                                                                            <li><strong>Điều khoản:</strong> Người thuê không được tự ý sửa chữa, thay đổi cấu trúc phòng. Chủ nhà có quyền kiểm tra định kỳ mỗi 3 tháng.</li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- Hợp đồng PDF -->
                                                                    <c:if test="${booking.status == 'confirm2'}">
                                                                        <hr class="my-4" />
                                                                        <h6 class="mb-2">Hợp đồng PDF:</h6>

                                                                        <div class="ratio ratio-16x9 mb-3">
                                                                            <iframe src="${pageContext.request.contextPath}/${booking.contractFile}" frameborder="0"></iframe>
                                                                        </div>

                                                                        <div class="text-end">
                                                                            <a href="${pageContext.request.contextPath}/${booking.contractFile}"
                                                                               target="_blank"
                                                                               class="btn btn-outline-primary">
                                                                                <i class="fa-solid fa-file-pdf me-1"></i> Xem hoặc tải hợp đồng
                                                                            </a>
                                                                        </div>
                                                                    </c:if>

                                                                    <!-- Thanh toán nếu chưa thanh toán -->
                                                                    <c:if test="${booking.status == 'confirm2'}">
                                                                        <hr class="my-4" />
                                                                        <form action="${pageContext.request.contextPath}/payment" method="post">
                                                                            <input type="hidden" name="requestId" value="${booking.id}" />
                                                                            <label>Số tiền cần thanh toán:</label>
                                                                            <input type="number" name="amount" class="form-control mb-2" value="${booking.room.price}" readonly />
                                                                            <label>Nội dung thanh toán:</label>
                                                                            <input type="text" name="orderInfo" class="form-control mb-2" value="Thanh toán phòng: ${booking.room.title}" required />
                                                                            <label>Ngôn ngữ:</label>
                                                                            <select name="language" class="form-select mb-3">
                                                                                <option value="vn" selected>Tiếng Việt</option>
                                                                                <option value="en">English</option>
                                                                            </select>

                                                                            <div class="form-check mb-3">
                                                                                <input class="form-check-input" type="checkbox" id="confirmPay${booking.id}"
                                                                                       onchange="document.getElementById('payBtn${booking.id}').disabled = !this.checked" />
                                                                                <label class="form-check-label" for="confirmPay${booking.id}">Tôi đồng ý với điều khoản</label>
                                                                            </div>

                                                                            <button type="submit" id="payBtn${booking.id}" class="btn btn-primary w-100" disabled>Thanh toán</button>
                                                                        </form>
                                                                    </c:if>
                                                                </div>
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