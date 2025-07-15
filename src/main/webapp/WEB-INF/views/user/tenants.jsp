<%@page contentType="text/html" pageEncoding="UTF-8" import="model.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
    <%@include file="../include/head.jsp" %>
    <body>
        <c:set var="totalRevenue" value="0" />
        <c:forEach var="tenant" items="${tenants}">
            <c:if test="${tenant.status == 'active'}">
                <c:set var="roomPrice" value="${tenant.room.price}" />
                <c:set var="contractValue" value="${roomPrice * 3}" />
                <c:set var="contractRevenue" value="${contractValue * 0.02}" />
                <c:set var="totalRevenue" value="${totalRevenue + contractRevenue}" />
            </c:if>
        </c:forEach>
        <main class="d-flex">
            <!-- Sidebar -->
            <%@ include file="user.include/staffSidebar.jsp" %>

            <!-- Main Content -->
            <div class="page-content flex-grow-1">
                <div class="page-content-wrapper p-3 p-lg-4">

                    <!-- Header Section -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="d-flex justify-content-between align-items-center flex-wrap">
                                <div>
                                    <h1 class="h3 mb-1">Thống kê người thuê thành công</h1>
                                    <p class="text-muted mb-0">Quản lý và theo dõi danh sách người thuê</p>
                                </div>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-primary btn-sm" onclick="window.print()">
                                        <i class="bi bi-printer"></i> In báo cáo
                                    </button>
                                    <button class="btn btn-outline-success btn-sm" onclick="exportToExcel()">
                                        <i class="bi bi-file-excel"></i> Xuất Excel
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>



                    <!-- Statistics Cards -->
                    <div class="row mb-4">
                        <div class="col-md-3 mb-3">
                            <div class="card border-0 shadow-sm text-center">
                                <div class="card-body">
                                    <div class="text-primary mb-2">
                                        <i class="bi bi-people-fill" style="font-size: 2rem;"></i>
                                    </div>
                                    <h5 class="card-title">${fn:length(tenants)}</h5>
                                    <p class="card-text text-muted">Tổng số người thuê</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card border-0 shadow-sm text-center">
                                <div class="card-body">
                                    <div class="text-success mb-2">
                                        <i class="bi bi-check-circle-fill" style="font-size: 2rem;"></i>
                                    </div>
                                    <h5 class="card-title">
                                        <c:set var="activeCount" value="0" />
                                        <c:forEach var="tenant" items="${tenants}">
                                            <c:if test="${tenant.status == 'active'}">
                                                <c:set var="activeCount" value="${activeCount + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        ${activeCount}
                                    </h5>
                                    <p class="card-text text-muted">Đang thuê</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card border-0 shadow-sm text-center">
                                <div class="card-body">
                                    <div class="text-secondary mb-2">
                                        <i class="bi bi-x-circle-fill" style="font-size: 2rem;"></i>
                                    </div>
                                    <h5 class="card-title">
                                        <c:set var="inactiveCount" value="0" />
                                        <c:forEach var="tenant" items="${tenants}">
                                            <c:if test="${tenant.status == 'inactive'}">
                                                <c:set var="inactiveCount" value="${inactiveCount + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        ${inactiveCount}
                                    </h5>
                                    <p class="card-text text-muted">Đã kết thúc</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card border-0 shadow-sm text-center">
                                <div class="card-body">
                                    <div class="text-danger mb-2">
                                        <i class="bi bi-currency-dollar" style="font-size: 2rem;"></i>
                                    </div>
                                    <h5 class="card-title text-danger">
                                        <fmt:formatNumber value="${totalRevenue}" /> VND
                                    </h5>
                                    <p class="card-text text-muted">Doanh thu từ hợp đồng (2%)</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Table Section -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-light d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0"><i class="bi bi-table"></i> Danh sách người thuê</h6>
                                    <small class="text-muted">Hiển thị ${fn:length(tenants)} kết quả</small>
                                </div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover align-middle mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th class="text-center" style="width: 60px;">STT</th>
                                                    <th>Thông tin người thuê</th>
                                                    <th>Phòng thuê</th>
                                                    <th class="text-center">Thời gian thuê</th>
                                                    <th class="text-center">Trạng thái</th>
                                                    <th class="text-center" style="width: 120px;">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="tenant" items="${tenants}" varStatus="loop">
                                                    <tr>
                                                        <td class="text-center">${loop.index + 1}</td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="avatar-sm bg-light rounded-circle d-flex align-items-center justify-content-center me-3">
                                                                    <i class="bi bi-person text-muted"></i>
                                                                </div>
                                                                <div>
                                                                    <h6 class="mb-0">${tenant.user.fullName}</h6>
                                                                    <small class="text-muted">
                                                                        <i class="bi bi-envelope me-1"></i>${tenant.user.email}
                                                                    </small><br>
                                                                    <small class="text-muted">
                                                                        <i class="bi bi-phone me-1"></i>${tenant.user.phoneNumber}
                                                                    </small>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <h6 class="mb-0">${tenant.room.title}</h6>
                                                                <small class="text-muted">
                                                                    <i class="bi bi-geo-alt me-1"></i>Phòng số ${tenant.room.id}
                                                                </small>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div>
                                                                <div class="small">
                                                                    <strong>Bắt đầu:</strong> 
                                                                    ${tenant.rentStart}
                                                                </div>
                                                                <div class="small text-muted">
                                                                    <strong>Kết thúc:</strong> 
                                                                    <c:choose>
                                                                        <c:when test="${tenant.rentEnd != null}">
                                                                            ${tenant.rentEnd}
                                                                        </c:when>
                                                                        <c:otherwise>---</c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <c:choose>
                                                                <c:when test="${tenant.status == 'active'}">
                                                                    <span class="badge bg-success">
                                                                        <i class="bi bi-check-circle me-1"></i>Đang thuê
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${tenant.status == 'inactive'}">
                                                                    <span class="badge bg-secondary">
                                                                        <i class="bi bi-x-circle me-1"></i>Đã kết thúc
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-warning text-dark">
                                                                        <i class="bi bi-exclamation-triangle me-1"></i>${tenant.status}
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-center">
                                                            <button class="btn btn-sm btn-outline-primary" 
                                                                    data-bs-toggle="modal" 
                                                                    data-bs-target="#bookingModal${loop.index}"
                                                                    title="Xem chi tiết yêu cầu thuê">
                                                                <i class="bi bi-eye"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                <c:if test="${empty tenants}">
                                                    <tr>
                                                        <td colspan="6" class="text-center py-5">
                                                            <div class="text-muted">
                                                                <i class="bi bi-inbox" style="font-size: 3rem;"></i>
                                                                <div class="mt-3">
                                                                    <h6>Không có dữ liệu</h6>
                                                                    <p class="mb-0">Không tìm thấy người thuê nào phù hợp với điều kiện lọc.</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Modals -->
        <c:forEach var="tenant" items="${tenants}" varStatus="loop">
            <div class="modal fade" id="bookingModal${loop.index}" tabindex="-1" 
                 aria-labelledby="bookingModalLabel${loop.index}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content border-0 shadow">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="bookingModalLabel${loop.index}">
                                <i class="bi bi-file-text me-2"></i>Chi tiết yêu cầu thuê phòng
                            </h5>
                            <button type="button" class="btn-close btn-close-white" 
                                    data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card h-100">
                                        <div class="card-header bg-light">
                                            <h6 class="mb-0"><i class="bi bi-person-circle me-2"></i>Thông tin cơ bản</h6>
                                        </div>
                                        <div class="card-body">
                                            <dl class="row mb-0">
                                                <dt class="col-sm-5">Người thuê:</dt>
                                                <dd class="col-sm-7">${tenant.user.fullName}</dd>

                                                <dt class="col-sm-5">Email:</dt>
                                                <dd class="col-sm-7">${tenant.user.email}</dd>

                                                <dt class="col-sm-5">Số điện thoại:</dt>
                                                <dd class="col-sm-7">${tenant.user.phoneNumber}</dd>

                                                <dt class="col-sm-5">Phòng thuê:</dt>
                                                <dd class="col-sm-7">${tenant.room.title}</dd>
                                                <dt class="col-sm-5">Giá thuê phòng:</dt>
                                                <dd class="col-sm-7">
                                                    <fmt:formatNumber value="${tenant.room.price}" /> VND/tháng
                                                </dd>

                                                <dt class="col-sm-5">Lý do thuê:</dt>
                                                <dd class="col-sm-7">
                                                    <c:choose>
                                                        <c:when test="${not empty tenant.bookingRequest.reason}">
                                                            <span class="text-break">${tenant.bookingRequest.reason}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted">Không có thông tin</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </dd>

                                                <dt class="col-sm-5">Ngày xem phòng:</dt>
                                                <dd class="col-sm-7">
                                                    <c:choose>
                                                        <c:when test="${tenant.bookingRequest != null && tenant.bookingRequest.viewingDate != null}">
                                                            <fmt:formatDate value="${tenant.bookingRequest.viewingDateAsDate}" pattern="dd/MM/yyyy HH:mm" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted">Không có lịch hẹn</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </dd>

                                            </dl>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="card h-100">
                                        <div class="card-header bg-light">
                                            <h6 class="mb-0"><i class="bi bi-file-earmark-pdf me-2"></i>Hợp đồng thuê</h6>
                                        </div>
                                        <div class="card-body">
                                            <c:choose>
                                                <c:when test="${not empty tenant.bookingRequest.contractFile}">
                                                    <div class="text-center mb-3">
                                                        <i class="bi bi-file-earmark-pdf text-danger" style="font-size: 3rem;"></i>
                                                        <h6 class="mt-2">Hợp đồng thuê phòng</h6>
                                                        <p class="text-muted small">Tệp PDF đã được tải lên</p>
                                                    </div>

                                                    <div class="d-flex gap-2 justify-content-center">
                                                        <a href="${pageContext.request.contextPath}/${tenant.bookingRequest.contractFile}" 
                                                           target="_blank" class="btn btn-primary btn-sm">
                                                            <i class="bi bi-eye me-1"></i>Xem tệp
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/${tenant.bookingRequest.contractFile}" 
                                                           download class="btn btn-outline-primary btn-sm">
                                                            <i class="bi bi-download me-1"></i>Tải về
                                                        </a>
                                                    </div>

                                                    <div class="mt-3">
                                                        <div class="ratio ratio-16x9 border rounded shadow-sm">
                                                            <iframe 
                                                                src="${pageContext.request.contextPath}/${tenant.bookingRequest.contractFile}#toolbar=0&navpanes=0&scrollbar=1" 
                                                                allowfullscreen
                                                                loading="lazy"
                                                                frameborder="0"
                                                                style="border-radius: 8px;">
                                                            </iframe>
                                                        </div>
                                                    </div>
                                                    <!-- Tổng giá trị hợp đồng -->
                                                    <div class="text-center text-success fw-semibold mb-3">
                                                        <i class="bi bi-cash-stack me-1"></i>
                                                        Tổng giá trị hợp đồng:
                                                        <fmt:formatNumber value="${tenant.room.price * 3}" />VND cho 3 tháng
                                                    </div>


                                                </c:when>
                                                <c:otherwise>
                                                    <div class="text-center text-muted py-5">
                                                        <i class="bi bi-file-earmark-x" style="font-size: 3rem;"></i>
                                                        <h6 class="mt-2">Chưa có hợp đồng</h6>
                                                        <p class="mb-0">Hợp đồng thuê phòng chưa được tải lên</p>
                                                    </div>
                                                    <!-- Tổng giá trị hợp đồng -->
                                                    <div class="text-center text-success fw-semibold mb-3">
                                                        <i class="bi bi-cash-stack me-1"></i>
                                                        Tổng giá trị hợp đồng:
                                                        <fmt:formatNumber value="${tenant.room.price * 3}" />VND cho 3 tháng
                                                    </div>

                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-4">
                                    <div class="card h-100">
                                        <div class="card-header bg-light">
                                            <h6 class="mb-0"><i class="bi bi-person-badge me-2"></i>Thông tin chủ trọ</h6>
                                        </div>
                                        <div class="card-body">
                                            <dl class="row mb-0">
                                                <dt class="col-sm-5">Họ tên:</dt>
                                                <dd class="col-sm-7">${tenant.room.house.profile.owner.fullName}</dd>

                                                <dt class="col-sm-5">Email:</dt>
                                                <dd class="col-sm-7">${tenant.room.house.profile.owner.email}</dd>

                                                <dt class="col-sm-5">Số điện thoại:</dt>
                                                <dd class="col-sm-7">${tenant.room.house.profile.owner.phoneNumber}</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                <i class="bi bi-x-lg me-1"></i>Đóng
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/js/functions.js"></script>

        <script>
                                        // Utility functions
                                        function exportToExcel() {
                                            alert('Chức năng xuất Excel đang được phát triển');
                                        }

                                        // Set max date for date inputs
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const today = new Date().toISOString().split('T')[0];
                                            document.getElementById('fromDate').setAttribute('max', today);
                                            document.getElementById('toDate').setAttribute('max', today);

                                            // Auto-fill toDate when fromDate is selected
                                            document.getElementById('fromDate').addEventListener('change', function () {
                                                const fromDate = this.value;
                                                const toDateInput = document.getElementById('toDate');
                                                if (fromDate && !toDateInput.value) {
                                                    toDateInput.value = today;
                                                }
                                                toDateInput.setAttribute('min', fromDate);
                                            });
                                        });
        </script>
    </body>
</html> 