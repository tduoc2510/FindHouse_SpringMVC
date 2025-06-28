<%-- 
    Document   : ownerProfileManagement
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="model.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">

    <%@include file="../include/head.jsp" %>

    <body class="bg-dark text-light">

        <!-- **************** MAIN CONTENT START **************** -->        

        <main>

            <!-- Sidebar START -->
            <%@include file="user.include/staffSidebar.jsp" %>
            <!-- Sidebar END -->

            <!-- Page content START -->
            <div class="page-content">
                <div class="container py-4">

                    <!-- Page Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="icon-shape icon-lg rounded-circle bg-primary-soft me-3">
                                    <i class="bi bi-calendar-check-fill text-primary fs-4"></i>
                                </div>
                                <div>
                                    <h2 class="mb-0 fw-bold text-light">Danh sách yêu cầu đặt phòng</h2>
                                    <p class="text-light-muted mb-0">Quản lý và xử lý các yêu cầu đặt phòng đang chờ</p>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex gap-2">
                            <button class="btn btn-outline-light">
                                <i class="bi bi-arrow-clockwise me-2"></i>Làm mới
                            </button>
                            <div class="dropdown">
                                <button class="btn btn-outline-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                    <i class="bi bi-funnel me-2"></i>Lọc
                                </button>
                                <ul class="dropdown-menu dropdown-menu-dark">
                                    <li><a class="dropdown-item" href="#">Tất cả</a></li>
                                    <li><a class="dropdown-item" href="#">Chờ xử lý</a></li>
                                    <li><a class="dropdown-item" href="#">Đã xác nhận</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Statistics Cards -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card bg-dark-card border-dark shadow-sm h-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-shape icon-md rounded-circle bg-primary-soft me-3">
                                            <i class="bi bi-calendar-event text-primary"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0 text-light-muted">Tổng yêu cầu</h6>
                                            <h4 class="mb-0 fw-bold text-primary">${fn:length(requests)}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-dark-card border-dark shadow-sm h-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-shape icon-md rounded-circle bg-warning-soft me-3">
                                            <i class="bi bi-clock text-warning"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0 text-light-muted">Chờ xử lý</h6>
                                            <h4 class="mb-0 fw-bold text-warning">${fn:length(requests)}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-dark-card border-dark shadow-sm h-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-shape icon-md rounded-circle bg-success-soft me-3">
                                            <i class="bi bi-check-circle text-success"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0 text-light-muted">Đã xác nhận</h6>
                                            <h4 class="mb-0 fw-bold text-success">0</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-dark-card border-dark shadow-sm h-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-shape icon-md rounded-circle bg-info-soft me-3">
                                            <i class="bi bi-graph-up text-info"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0 text-light-muted">Hôm nay</h6>
                                            <h4 class="mb-0 fw-bold text-info">0</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Booking Requests Table -->
                    <c:choose>
                        <c:when test="${not empty requests}">
                            <div class="card bg-dark-card border-dark shadow-sm">
                                <div class="card-header bg-dark-header border-bottom border-dark py-3">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h5 class="mb-0 fw-semibold text-light">
                                            <i class="bi bi-list-ul me-2 text-primary"></i>
                                            Danh sách yêu cầu đặt phòng
                                        </h5>
                                        <small class="text-light-muted">${fn:length(requests)} yêu cầu</small>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table table-dark table-hover mb-0">
                                            <thead class="table-dark">
                                                <tr>
                                                    <th class="border-0 py-3 ps-4">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="selectAll">
                                                        </div>
                                                    </th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Phòng</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Người đặt</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Ngày đặt</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Trạng thái</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="request" items="${requests}">
                                                    <tr class="border-bottom border-dark">
                                                        <td class="ps-4 py-3">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="${request.id}">
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="icon-shape icon-sm rounded-circle bg-primary-soft me-2">
                                                                    <i class="bi bi-house-door text-primary"></i>
                                                                </div>
                                                                <div>
                                                                    <h6 class="mb-0 fw-semibold text-light">${request.room.title}</h6>
                                                                    <small class="text-light-muted">Room ID: #${request.room.id}</small>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="avatar avatar-sm me-2">
                                                                    <div class="avatar-img rounded-circle bg-secondary d-flex align-items-center justify-content-center">
                                                                        <i class="bi bi-person text-white"></i>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <h6 class="mb-0 fw-semibold text-light">${request.user.fullName}</h6>
                                                                    <small class="text-light-muted">${request.user.email}</small>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <div class="text-light-muted">
                                                                <i class="bi bi-calendar3 me-1"></i>
                                                                <fmt:formatDate value="${request.requestedAtAsDate}" pattern="dd/MM/yyyy"/>
                                                                <br>
                                                                <small class="text-light-muted">
                                                                    <i class="bi bi-clock me-1"></i>
                                                                    <fmt:formatDate value="${request.requestedAtAsDate}" pattern="HH:mm"/>
                                                                </small>
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <span class="badge bg-warning-soft text-warning px-3 py-2 rounded-pill">
                                                                <i class="bi bi-clock me-1"></i>Chờ xử lý
                                                            </span>
                                                        </td>
                                                        <td class="py-3">
                                                            <div class="dropdown">
                                                                <button class="btn btn-sm btn-outline-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                                                    <i class="bi bi-three-dots me-1"></i>Thao tác
                                                                </button>
                                                                <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
                                                                    <li>
                                                                        <a class="dropdown-item" href="/booking-request/view/${request.id}">
                                                                            <i class="bi bi-eye me-2"></i>Xem chi tiết
                                                                        </a>
                                                                    </li>
                                                                    <li><hr class="dropdown-divider"></li>
                                                                    <li>
                                                                        <form method="post" action="/booking/update-status" class="d-inline">
                                                                            <input type="hidden" name="requestId" value="${request.id}" />
                                                                            <input type="hidden" name="status" value="confirm1" />
                                                                            <button type="submit" class="dropdown-item text-success">
                                                                                <i class="bi bi-check-circle me-2"></i>Xác nhận
                                                                            </button>
                                                                        </form>
                                                                    </li>
                                                                    <li>
                                                                        <form method="post" action="/booking/update-status" class="d-inline">
                                                                            <input type="hidden" name="requestId" value="${request.id}" />
                                                                            <input type="hidden" name="status" value="reject" />
                                                                            <button type="submit" class="dropdown-item text-danger">
                                                                                <i class="bi bi-x-circle me-2"></i>Từ chối
                                                                            </button>
                                                                        </form>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Pagination -->
                                <div class="card-footer bg-dark-header border-top border-dark py-3">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <small class="text-light-muted">Hiển thị 1 đến ${fn:length(requests)} của ${fn:length(requests)} kết quả</small>
                                        <nav aria-label="Booking requests pagination">
                                            <ul class="pagination pagination-sm mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link bg-dark text-light border-dark" href="#" tabindex="-1">Trước</a>
                                                </li>
                                                <li class="page-item active">
                                                    <a class="page-link bg-primary border-primary" href="#">1</a>
                                                </li>
                                                <li class="page-item disabled">
                                                    <a class="page-link bg-dark text-light border-dark" href="#">Sau</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Empty State -->
                            <div class="card bg-dark-card border-dark shadow-sm">
                                <div class="card-body text-center py-5">
                                    <div class="empty-state">
                                        <div class="icon-shape icon-xxl rounded-circle bg-dark-lighter mx-auto mb-4">
                                            <i class="bi bi-calendar-x fs-1 text-light-muted"></i>
                                        </div>
                                        <h4 class="fw-bold text-light mb-2">Chưa có yêu cầu đặt phòng</h4>
                                        <p class="text-light-muted mb-4">Hiện tại chưa có yêu cầu đặt phòng nào đang chờ xử lý. Các yêu cầu mới sẽ xuất hiện tại đây.</p>
                                        <div class="row justify-content-center">
                                            <div class="col-md-6">
                                                <div class="d-flex gap-2 justify-content-center">
                                                    <button class="btn btn-outline-light">
                                                        <i class="bi bi-arrow-clockwise me-2"></i>Làm mới trang
                                                    </button>
                                                    <button class="btn btn-primary">
                                                        <i class="bi bi-house-door me-2"></i>Quản lý phòng
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <!-- Page content END -->

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Custom Dark Mode Styles -->
        <style>
            :root {
                --dark-bg: #1a1a1a;
                --dark-card: #2d2d2d;
                --dark-header: #333333;
                --dark-lighter: #404040;
                --text-light: #ffffff;
                --text-light-muted: #b0b0b0;
                --border-dark: #404040;
            }

            body.bg-dark {
                background-color: var(--dark-bg) !important;
                color: var(--text-light);
            }

            .page-content {
                background-color: var(--dark-bg);
                min-height: 100vh;
            }

            .bg-dark-card {
                background-color: var(--dark-card) !important;
            }

            .bg-dark-header {
                background-color: var(--dark-header) !important;
            }

            .bg-dark-lighter {
                background-color: var(--dark-lighter) !important;
            }

            .text-light-muted {
                color: var(--text-light-muted) !important;
            }

            .border-dark {
                border-color: var(--border-dark) !important;
            }

            .icon-shape {
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .icon-sm {
                width: 30px;
                height: 30px;
            }
            .icon-md {
                width: 45px;
                height: 45px;
            }
            .icon-lg {
                width: 60px;
                height: 60px;
            }
            .icon-xxl {
                width: 100px;
                height: 100px;
            }

            .bg-primary-soft {
                background-color: rgba(13, 110, 253, 0.2);
            }
            .bg-success-soft {
                background-color: rgba(25, 135, 84, 0.2);
            }
            .bg-warning-soft {
                background-color: rgba(255, 193, 7, 0.2);
            }
            .bg-danger-soft {
                background-color: rgba(220, 53, 69, 0.2);
            }
            .bg-info-soft {
                background-color: rgba(13, 202, 240, 0.2);
            }
            .bg-secondary-soft {
                background-color: rgba(108, 117, 125, 0.2);
            }

            .avatar {
                width: 35px;
                height: 35px;
            }
            .avatar-img {
                width: 100%;
                height: 100%;
            }

            .table-dark {
                --bs-table-bg: var(--dark-card);
                --bs-table-striped-bg: var(--dark-header);
                --bs-table-hover-bg: rgba(13, 110, 253, 0.1);
                border-color: var(--border-dark);
            }

            .table-hover tbody tr:hover {
                background-color: rgba(13, 110, 253, 0.1) !important;
            }

            .badge {
                font-weight: 500;
                font-size: 0.75rem;
            }

            .empty-state {
                padding: 2rem;
            }

            .card {
                border-radius: 12px;
            }

            .btn {
                border-radius: 8px;
            }

            .btn-outline-light:hover {
                background-color: var(--text-light);
                color: var(--dark-bg);
            }

            .dropdown-menu-dark {
                --bs-dropdown-bg: var(--dark-card);
                --bs-dropdown-border-color: var(--border-dark);
                --bs-dropdown-link-hover-bg: var(--dark-header);
            }

            .dropdown-menu {
                border-radius: 8px;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.3);
            }

            .page-link {
                border-radius: 6px;
                margin: 0 2px;
                border: 1px solid var(--border-dark);
            }

            .page-link.bg-dark {
                background-color: var(--dark-card) !important;
                border-color: var(--border-dark) !important;
            }

            .page-link.bg-dark:hover {
                background-color: var(--dark-header) !important;
            }

            .page-item.active .page-link {
                background-color: #0d6efd;
                border-color: #0d6efd;
            }

            .form-check-input:checked {
                background-color: #0d6efd;
                border-color: #0d6efd;
            }

            .form-check-input {
                background-color: var(--dark-card);
                border-color: var(--border-dark);
            }

            .form-check-input:focus {
                border-color: #86b7fe;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }

            /* Dropdown form styling */
            .dropdown-item form {
                width: 100%;
            }

            .dropdown-item form button {
                background: none;
                border: none;
                width: 100%;
                text-align: left;
                padding: 0;
                font-size: inherit;
                color: inherit;
            }

            .dropdown-item form button:hover {
                background: none;
            }
        </style>

        <!-- Bootstrap JS -->
        <script src="../../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="${pageContext.request.contextPath}/assets/js/functions.js"></script>

        <!-- JavaScript -->
        <script>
            // Select all checkbox functionality
            document.addEventListener('DOMContentLoaded', function () {
                const selectAllCheckbox = document.getElementById('selectAll');
                if (selectAllCheckbox) {
                    selectAllCheckbox.addEventListener('change', function () {
                        const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                        checkboxes.forEach(checkbox => {
                            checkbox.checked = this.checked;
                        });
                    });
                }

                // Confirm actions
                document.querySelectorAll('form[action="/booking/update-status"]').forEach(form => {
                    form.addEventListener('submit', function (e) {
                        const status = this.querySelector('input[name="status"]').value;
                        let message = '';

                        if (status === 'confirm1') {
                            message = 'Bạn có chắc chắn muốn xác nhận yêu cầu đặt phòng này?';
                        } else if (status === 'reject') {
                            message = 'Bạn có chắc chắn muốn từ chối yêu cầu đặt phòng này?';
                        }

                        if (message && !confirm(message)) {
                            e.preventDefault();
                        }
                    });
                });
            });
        </script>

    </body>

</html>