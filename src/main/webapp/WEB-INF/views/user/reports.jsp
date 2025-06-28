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

    <body class="bg-dark">
        <!-- MAIN CONTENT START -->        
        <%@include file="../include/header.jsp" %>

        <main>
            <!-- Menu item START -->
            <%@include file="user.include/ownerNavbar.jsp" %>
            <!-- Menu item END -->

            <!-- Content START -->
            <section class="py-5">
                <div class="container">
                    <!-- Header Section -->
                    <div class="row mb-5">
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="icon-shape icon-lg rounded-circle bg-danger-soft me-3">
                                            <i class="bi bi-flag-fill text-danger fs-4"></i>
                                        </div>
                                        <div>
                                            <h2 class="mb-0 fw-bold text-light">Tenant Reports</h2>
                                            <p class="text-light-muted mb-0">Manage feedback and reports from tenants</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Filter Section -->
                                <div class="d-flex gap-2">
                                    <div class="dropdown">
                                        <button class="btn btn-outline-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                            <i class="bi bi-funnel me-2"></i>Filter by Status
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-dark">
                                            <li><a class="dropdown-item" href="#">All Reports</a></li>
                                            <li><a class="dropdown-item" href="#">Pending</a></li>
                                            <li><a class="dropdown-item" href="#">Resolved</a></li>
                                        </ul>
                                    </div>
                                    <button class="btn btn-primary">
                                        <i class="bi bi-arrow-clockwise me-2"></i>Refresh
                                    </button>
                                </div>
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
                                            <i class="bi bi-flag text-primary"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0 text-light-muted">Total Reports</h6>
                                            <h4 class="mb-0 fw-bold text-primary">${fn:length(reports)}</h4>
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
                                            <h6 class="mb-0 text-light-muted">Pending</h6>
                                            <h4 class="mb-0 fw-bold text-warning">0</h4>
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
                                            <h6 class="mb-0 text-light-muted">Resolved</h6>
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
                                            <h6 class="mb-0 text-light-muted">This Week</h6>
                                            <h4 class="mb-0 fw-bold text-info">0</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Reports List -->
                    <c:choose>
                        <c:when test="${not empty reports}">
                            <div class="card bg-dark-card border-dark shadow-sm">
                                <div class="card-header bg-dark-header border-bottom border-dark py-3">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h5 class="mb-0 fw-semibold text-light">
                                            <i class="bi bi-list-ul me-2 text-primary"></i>
                                            Reports List
                                        </h5>
                                        <small class="text-light-muted">${fn:length(reports)} reports</small>
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
                                                    <th class="border-0 py-3 fw-semibold text-light">Room</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Tenant</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Type</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Content</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Date Submitted</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Status</th>
                                                    <th class="border-0 py-3 fw-semibold text-light">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="report" items="${reports}">
                                                    <tr class="border-bottom border-dark">
                                                        <td class="ps-4 py-3">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="${report.id}">
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="icon-shape icon-sm rounded-circle bg-primary-soft me-2">
                                                                    <i class="bi bi-house-door text-primary"></i>
                                                                </div>
                                                                <div>
                                                                    <h6 class="mb-0 fw-semibold text-light">${report.room.title}</h6>
                                                                    <small class="text-light-muted">Room ID: #${report.room.id}</small>
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
                                                                    <h6 class="mb-0 fw-semibold text-light">${report.reporter.fullName}</h6>
                                                                    <small class="text-light-muted">${report.reporter.email}</small>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <span class="badge bg-info-soft text-info px-3 py-2 rounded-pill">
                                                                <i class="bi bi-tag me-1"></i>${report.type}
                                                            </span>
                                                        </td>
                                                        <td class="py-3">
                                                            <div class="content-preview">
                                                                <p class="mb-0 text-truncate text-light" style="max-width: 200px;" title="${report.content}">
                                                                    ${report.content}
                                                                </p>
                                                                <button class="btn btn-link btn-sm text-primary p-0" data-bs-toggle="modal" data-bs-target="#contentModal-${report.id}">
                                                                    View Full Content
                                                                </button>
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <div class="text-light-muted">
                                                                <i class="bi bi-calendar3 me-1"></i>
                                                                <fmt:formatDate value="${report.createdAtDate}" pattern="MMM dd, yyyy"/>
                                                                <br>
                                                                <small class="text-light-muted">
                                                                    <i class="bi bi-clock me-1"></i>
                                                                    <fmt:formatDate value="${report.createdAtDate}" pattern="HH:mm"/>
                                                                </small>
                                                            </div>
                                                        </td>
                                                        <td class="py-3">
                                                            <c:choose>
                                                                <c:when test="${report.status == 'PENDING'}">
                                                                    <span class="badge bg-warning-soft text-warning px-3 py-2 rounded-pill">
                                                                        <i class="bi bi-clock me-1"></i>Pending
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${report.status == 'RESOLVED'}">
                                                                    <span class="badge bg-success-soft text-success px-3 py-2 rounded-pill">
                                                                        <i class="bi bi-check-circle me-1"></i>Resolved
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-secondary-soft text-secondary px-3 py-2 rounded-pill">
                                                                        ${report.status}
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="py-3 position-relative">
                                                            <div class="dropdown position-static">
                                                                <button class="btn btn-sm btn-outline-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                                                    <i class="bi bi-three-dots"></i>
                                                                </button>
                                                                <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
                                                                    <li>
                                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#viewModal-${report.id}">
                                                                            <i class="bi bi-eye me-2"></i>Xem chi tiết
                                                                        </a>
                                                                    </li>
                                                                    <c:if test="${report.status == 'PENDING'}">
                                                                        <li>
                                                                            <a class="dropdown-item text-success" href="#" onclick="submitResolve(${report.id})">
                                                                                <i class="bi bi-check-circle me-2"></i>Đánh dấu đã xử lý
                                                                            </a>
                                                                        </li>
                                                                    </c:if>
                                                                    <li><hr class="dropdown-divider"></li>
                                                                    <li>
                                                                        <a class="dropdown-item text-danger" href="#" onclick="deleteReport(${report.id})">
                                                                            <i class="bi bi-trash me-2"></i>Xóa
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                            <!-- Form ẩn để gửi cập nhật trạng thái -->
                                                            <form id="resolveForm-${report.id}" method="post"
                                                                  action="${pageContext.request.contextPath}/report/admin/update-status"
                                                                  style="display:none;">
                                                                <input type="hidden" name="reportId" value="${report.id}" />
                                                                <input type="hidden" name="status" value="RESOLVED" />
                                                            </form>
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
                                        <small class="text-light-muted">Showing 1 to ${fn:length(reports)} of ${fn:length(reports)} results</small>
                                        <nav aria-label="Reports pagination">
                                            <ul class="pagination pagination-sm mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link bg-dark text-light border-dark" href="#" tabindex="-1">Previous</a>
                                                </li>
                                                <li class="page-item active">
                                                    <a class="page-link bg-primary border-primary" href="#">1</a>
                                                </li>
                                                <li class="page-item disabled">
                                                    <a class="page-link bg-dark text-light border-dark" href="#">Next</a>
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
                                            <i class="bi bi-flag fs-1 text-light-muted"></i>
                                        </div>
                                        <h4 class="fw-bold text-light mb-2">No Reports Yet</h4>
                                        <p class="text-light-muted mb-4">You haven't received any reports from tenants yet. When tenants submit feedback or reports, they will appear here.</p>
                                        <div class="row justify-content-center">
                                            <div class="col-md-6">
                                                <div class="d-flex gap-2 justify-content-center">
                                                    <button class="btn btn-outline-light">
                                                        <i class="bi bi-arrow-clockwise me-2"></i>Refresh Page
                                                    </button>
                                                    <button class="btn btn-primary">
                                                        <i class="bi bi-house-door me-2"></i>Manage Rooms
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

            .content-preview {
                max-width: 250px;
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
            .table-responsive {
                overflow: visible !important;
            }

            .dropdown-menu {
                z-index: 1055 !important; /* Vượt lên trên mọi thứ khác */
            }

        </style>

        <!-- JavaScript -->
        <script>
            function submitResolve(reportId) {
                if (confirm("Bạn chắc chắn muốn đánh dấu báo cáo này là Đã xử lý?")) {
                    const form = document.getElementById("resolveForm-" + reportId);
                    if (form) {
                        form.submit();
                    }
                }
            }
        </script>

        <script>
            function markAsResolved(reportId) {
                if (confirm('Are you sure you want to mark this report as resolved?')) {
                    // AJAX call to update report status
                    console.log('Marking report ' + reportId + ' as resolved');
                    // Add your AJAX implementation here
                }
            }

            function deleteReport(reportId) {
                if (confirm('Are you sure you want to delete this report? This action cannot be undone.')) {
                    // AJAX call to delete report
                    console.log('Deleting report ' + reportId);
                    // Add your AJAX implementation here
                }
            }

            // Select all checkbox functionality
            document.getElementById('selectAll').addEventListener('change', function () {
                const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                checkboxes.forEach(checkbox => {
                    checkbox.checked = this.checked;
                });
            });
        </script>
    </body>
</html>