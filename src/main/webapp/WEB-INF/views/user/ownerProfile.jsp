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
            <section class="py-4 bg-light">
                <div class="container">

                    <!-- Page Header -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="d-flex align-items-center mb-3">
                                <div class="bg-primary bg-opacity-10 rounded-circle p-3 me-3">
                                    <i class="bi bi-house-door text-primary fs-4"></i>
                                </div>
                                <div>
                                    <h1 class="h3 mb-1 text-white">Dashboard</h1>
                                    <p class="text-muted mb-0">Tổng quan về hoạt động của bạn</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Statistics Section -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="card border-0 shadow-sm">
                                <div class="card-body p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-3">
                                        <h5 class="mb-0 text-primary">
                                            <i class="bi bi-graph-up me-2"></i>Thống kê tổng quan
                                        </h5>
                                        <div class="dropdown">
                                            <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                                Tháng này
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Hôm nay</a></li>
                                                <li><a class="dropdown-item" href="#">Tuần này</a></li>
                                                <li><a class="dropdown-item" href="#">Tháng này</a></li>
                                                <li><a class="dropdown-item" href="#">Năm nay</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <!-- Statistics Grid -->
                                    <div class="row g-4">
                                        <!-- Total Listings -->
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="d-flex align-items-center p-3 bg-success bg-opacity-10 rounded-3">
                                                <div class="bg-success rounded-circle p-3 me-3">
                                                    <i class="bi bi-journals text-white fs-5"></i>
                                                </div>
                                                <div>
                                                    <h4 class="mb-0 text-success">56</h4>
                                                    <small class="text-muted">Tổng số phòng</small>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Earnings -->
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="d-flex align-items-center p-3 bg-info bg-opacity-10 rounded-3">
                                                <div class="bg-info rounded-circle p-3 me-3">
                                                    <i class="bi bi-graph-up-arrow text-white fs-5"></i>
                                                </div>
                                                <div>
                                                    <h4 class="mb-0 text-info">2,55M VNĐ</h4>
                                                    <small class="text-muted">Doanh thu</small>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Visitors -->
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="d-flex align-items-center p-3 bg-warning bg-opacity-10 rounded-3">
                                                <div class="bg-warning rounded-circle p-3 me-3">
                                                    <i class="bi bi-bar-chart-line-fill text-white fs-5"></i>
                                                </div>
                                                <div>
                                                    <h4 class="mb-0 text-warning">15K</h4>
                                                    <small class="text-muted">Lượt xem</small>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Reviews -->
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="d-flex align-items-center p-3 bg-primary bg-opacity-10 rounded-3">
                                                <div class="bg-primary rounded-circle p-3 me-3">
                                                    <i class="bi bi-star text-white fs-5"></i>
                                                </div>
                                                <div>
                                                    <h4 class="mb-0 text-primary">12K</h4>
                                                    <small class="text-muted">Đánh giá</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Booking Management -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card border-0 shadow-sm">
                                <!-- Card Header -->
                                <div class="card-header bg-opacity-10 border-bottom py-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h5 class="mb-1 text-primary">
                                                <i class="bi bi-calendar-check me-2"></i>Yêu cầu đặt phòng
                                            </h5>
                                            <small class="text-muted">Quản lý các yêu cầu đặt phòng từ khách hàng</small>
                                        </div>
                                        <a href="#" class="btn btn-primary btn-sm">
                                            <i class="bi bi-eye me-1"></i>Xem tất cả
                                        </a>
                                    </div>
                                </div>

                                <!-- Card Body -->
                                <div class="card-body p-0">
                                    <!-- Search and Filter -->
                                    <div class="p-4 bg-light border-bottom">
                                        <div class="row g-3 align-items-center">
                                            <!-- Search -->
                                            <div class="col-md-8">
                                                <form class="rounded position-relative">
                                                    <input class="form-control pe-5" type="search" placeholder="Search" aria-label="Search">
                                                    <button class="btn border-0 px-3 py-0 position-absolute top-50 end-0 translate-middle-y" type="submit"><i class="fas fa-search fs-6"></i></button>
                                                </form>
                                            </div>

                                            <!-- Filter -->
                                            <div class="col-md-4">
                                                <select class="form-select">
                                                    <option value="">Tất cả trạng thái</option>
                                                    <option value="pending">Chờ xác nhận</option>
                                                    <option value="confirm1">Chờ chủ trọ</option>
                                                    <option value="confirm2">Chờ thanh toán</option>
                                                    <option value="confirm3">Đã xác nhận</option>
                                                    <option value="rejected">Từ chối</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Table -->
                                    <div class="table-responsive">
                                        <table class="table table-hover align-middle mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th class="border-0 rounded-start px-4">#</th>
                                                    <th class="border-0">Khách hàng</th>
                                                    <th class="border-0">Liên hệ</th>
                                                    <th class="border-0">Phòng</th>
                                                    <th class="border-0">Giá</th>
                                                    <th class="border-0">Ngày đăng ký</th>
                                                    <th class="border-0">Ngày xem phòng</th>
                                                    <th class="border-0">Trạng thái</th>
                                                    <th class="border-0 rounded-end text-center">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bookingRequests}" var="bookingRequest">
                                                    <tr>
                                                        <td class="px-4">
                                                            <span class="fw-bold text-primary">#${bookingRequest.id}</span>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="bg-primary bg-opacity-10 rounded-circle p-2 me-2">
                                                                    <i class="bi bi-person text-primary"></i>
                                                                </div>
                                                                <div>
                                                                    <h6 class="mb-0">${bookingRequest.user.fullName}</h6>
                                                                    <small class="text-muted">Khách hàng</small>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${bookingRequest.status == 'confirm3'}">
                                                                    <span class="badge bg-success bg-opacity-20 text-success px-3 py-2">
                                                                        <i class="bi bi-telephone me-1"></i>
                                                                        ${bookingRequest.user.phoneNumber}
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-secondary bg-opacity-20 text-secondary px-3 py-2">
                                                                        <i class="bi bi-eye-slash me-1"></i>
                                                                        ${fn:substring(bookingRequest.user.phoneNumber, 0, 3)}***
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <h6 class="mb-0">${bookingRequest.room.title}</h6>
                                                                <small class="text-muted">Phòng trọ</small>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <span class="fw-bold text-success">
                                                                <fmt:formatNumber value="${bookingRequest.room.price}" /> VNĐ
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <div class="fw-medium">
                                                                    <fmt:formatDate value="${bookingRequest.requestedAtAsDate}" pattern="dd/MM/yyyy" />
                                                                </div>
                                                                <small class="text-muted">
                                                                    <fmt:formatDate value="${bookingRequest.requestedAtAsDate}" pattern="HH:mm" />
                                                                </small>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <div class="fw-medium">
                                                                    <fmt:formatDate value="${bookingRequest.viewingDateAsDate}" pattern="dd/MM/yyyy" />
                                                                </div>
                                                                <small class="text-muted">
                                                                    <fmt:formatDate value="${bookingRequest.viewingDateAsDate}" pattern="HH:mm" />
                                                                </small>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${bookingRequest.status == 'pending'}">
                                                                    <span class="badge bg-warning text-dark px-3 py-2">
                                                                        <i class="bi bi-clock me-1"></i>Chờ xác nhận
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'confirm1'}">
                                                                    <span class="badge bg-info text-white px-3 py-2">
                                                                        <i class="bi bi-hourglass me-1"></i>Chờ chủ trọ
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'confirm2'}">
                                                                    <span class="badge bg-primary text-white px-3 py-2">
                                                                        <i class="bi bi-credit-card me-1"></i>Chờ thanh toán
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'confirm3'}">
                                                                    <span class="badge bg-success text-white px-3 py-2">
                                                                        <i class="bi bi-check-circle me-1"></i>Đã xác nhận
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'rejected'}">
                                                                    <span class="badge bg-danger text-white px-3 py-2">
                                                                        <i class="bi bi-x-circle me-1"></i>Từ chối
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-secondary text-white px-3 py-2">
                                                                        ${bookingRequest.status}
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-center">
                                                            <c:choose>
                                                                <c:when test="${bookingRequest.status == 'confirm1'}">
                                                                    <div class="btn-group" role="group">
                                                                        <button type="button" class="btn btn-success btn-sm" 
                                                                                onclick="acceptRequest(${bookingRequest.id})"
                                                                                title="Chấp nhận">
                                                                            <i class="bi bi-check-lg"></i>
                                                                        </button>
                                                                        <button type="button" class="btn btn-danger btn-sm" 
                                                                                onclick="rejectRequest(${bookingRequest.id})"
                                                                                title="Từ chối">
                                                                            <i class="bi bi-x-lg"></i>
                                                                        </button>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-muted">
                                                                        <i class="bi bi-dash-circle"></i>
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Card Footer -->
                                <div class="card-footer bg-opacity-10 border-top py-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="text-muted">
                                            <small>Hiển thị 1 đến 8 trong tổng số 20 mục</small>
                                        </div>
                                        <nav aria-label="Pagination">
                                            <ul class="pagination pagination-sm mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" tabindex="-1">
                                                        <i class="bi bi-chevron-left"></i>
                                                    </a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">
                                                        <i class="bi bi-chevron-right"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Content END -->

        </main>
        <!-- MAIN CONTENT END -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Include footer -->
        <%@include file="../include/footer.jsp" %>

        <!-- JavaScript for booking actions -->
        <script>
            function acceptRequest(id) {
                updateStatus(id, "confirm2", "");
            }

            function rejectRequest(id) {
                const reason = prompt("Vui lòng nhập lý do từ chối:");
                if (!reason || reason.trim() === "") {
                    alert("Bạn phải nhập lý do!");
                    return;
                }
                updateStatus(id, "rejected", reason);
            }

            function updateStatus(id, status, reason) {
                const formData = new FormData();
                formData.append("requestId", id);
                formData.append("status", status);
                formData.append("reason", reason);

                fetch("${pageContext.request.contextPath}/booking/update-status", {
                    method: "POST",
                    body: formData
                })
                        .then(response => {
                            if (!response.ok)
                                throw new Error("Lỗi máy chủ");
                            return response.text();
                        })
                        .then(data => {
                            alert("Cập nhật trạng thái thành công!");
                            location.reload();
                        })
                        .catch(error => {
                            alert("Đã xảy ra lỗi: " + error.message);
                        });
            }
        </script>

    </body>
</html>