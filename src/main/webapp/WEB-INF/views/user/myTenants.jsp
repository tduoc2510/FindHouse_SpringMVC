<%-- 
    Document   : myRentals
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <%@include file="../include/head.jsp" %>

    <body>
        <!-- **************** MAIN CONTENT START **************** -->        
        <%@include file="../include/header.jsp" %>

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
                                <button class="btn btn-primary mb-4" type="button" 
                                        data-bs-toggle="offcanvas" 
                                        data-bs-target="#offcanvasSidebar" 
                                        aria-controls="offcanvasSidebar">
                                    <i class="fas fa-sliders-h"></i> Menu
                                </button>
                            </div>

                            <!-- Page header -->
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div>
                                    <h2 class="mb-1">Phòng trọ của tôi</h2>
                                    <p class="text-muted mb-0">Quản lý thông tin các phòng trọ bạn đang thuê</p>
                                </div>
                                <div class="text-end">
                                    <small class="text-muted">
                                        Tổng: <span class="fw-bold text-primary">${tenants.size()}</span> phòng
                                    </small>
                                </div>
                            </div>

                            <!-- Filter and Status Summary -->
                            <c:if test="${not empty tenants}">
                                <div class="card border-0 bg-light mb-4">
                                    <div class="card-body p-3">
                                        <div class="row text-center">
                                            <div class="col-md-4">
                                                <div class="d-flex align-items-center justify-content-center">
                                                    <i class="fas fa-home text-success me-2"></i>
                                                    <div>
                                                        <h6 class="mb-0 text-success">Đang thuê</h6>
                                                        <small class="text-muted">
                                                            <c:set var="activeCount" value="0" />
                                                            <c:forEach var="tenant" items="${tenants}">
                                                                <c:if test="${tenant.status == 'active'}">
                                                                    <c:set var="activeCount" value="${activeCount + 1}" />
                                                                </c:if>
                                                            </c:forEach>
                                                            ${activeCount} phòng
                                                        </small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="d-flex align-items-center justify-content-center">
                                                    <i class="fas fa-clock text-warning me-2"></i>
                                                    <div>
                                                        <h6 class="mb-0 text-warning">Sắp hết hạn</h6>
                                                        <small class="text-muted">0 phòng</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="d-flex align-items-center justify-content-center">
                                                    <i class="fas fa-money-bill-wave text-info me-2"></i>
                                                    <div>
                                                        <h6 class="mb-0 text-info">Tổng chi phí/tháng</h6>
                                                        <small class="text-muted">
                                                            <c:set var="totalCost" value="0" />
                                                            <c:forEach var="tenant" items="${tenants}">
                                                                <c:if test="${tenant.status == 'active'}">
                                                                    <c:set var="totalCost" value="${totalCost + tenant.room.price}" />
                                                                </c:if>
                                                            </c:forEach>
                                                            <fmt:formatNumber value="${totalCost}" /> VND
                                                        </small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Rental Cards -->
                            <div class="card border-0 shadow-sm">
                                <!-- Card header -->
                                <div class="card-header bg-dark border-bottom">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">
                                            <i class="fas fa-list me-2 text-primary"></i>
                                            Danh sách phòng trọ
                                        </h5>
                                        <div class="dropdown">
                                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle" 
                                                    type="button" data-bs-toggle="dropdown">
                                                <i class="fas fa-filter me-1"></i> Lọc
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#"><i class="fas fa-check-circle me-2 text-success"></i>Đang thuê</a></li>
                                                <li><a class="dropdown-item" href="#"><i class="fas fa-pause-circle me-2 text-secondary"></i>Đã kết thúc</a></li>
                                                <li><hr class="dropdown-divider"></li>
                                                <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>Tất cả</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!-- Card body START -->
                                <div class="card-body p-0">
                                    <c:choose>
                                        <c:when test="${not empty tenants}">
                                            <div class="row g-0">
                                                <c:forEach var="tenant" items="${tenants}" varStatus="status">
                                                    <div class="col-12">
                                                        <div class="border-bottom p-4 ${status.last ? '' : 'border-bottom'}">
                                                            <div class="row align-items-center">
                                                                <!-- Room Info -->
                                                                <div class="col-lg-8">
                                                                    <div class="d-flex align-items-start">
                                                                        <!-- Status Icon -->
                                                                        <div class="flex-shrink-0 me-3">
                                                                            <div class="avatar avatar-sm">
                                                                                <div class="avatar-img rounded-circle 
                                                                                     ${tenant.status == 'active' ? 'bg-success' : 'bg-secondary'} 
                                                                                     d-flex align-items-center justify-content-center">
                                                                                    <i class="fas ${tenant.status == 'active' ? 'fa-home' : 'fa-pause'} 
                                                                                       text-white small"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <!-- Room Details -->
                                                                        <div class="flex-grow-1">
                                                                            <h6 class="mb-1 fw-bold text-primary">
                                                                                ${tenant.room.title}
                                                                            </h6>
                                                                            <p class="mb-2 text-muted">
                                                                                <i class="fas fa-building me-1"></i>
                                                                                ${tenant.room.house.name}
                                                                            </p>
                                                                            <p class="mb-1 small">
                                                                                <i class="fas fa-map-marker-alt me-1 text-danger"></i>
                                                                                ${tenant.room.house.address}
                                                                            </p>

                                                                            <!-- Room specs in compact format -->
                                                                            <div class="d-flex flex-wrap gap-3 mt-2">
                                                                                <span class="badge bg-light text-dark">
                                                                                    <i class="fas fa-expand-arrows-alt me-1"></i>
                                                                                    ${tenant.room.area} m²
                                                                                </span>
                                                                                <span class="badge bg-light text-dark">
                                                                                    <i class="fas fa-money-bill-wave me-1"></i>
                                                                                    <fmt:formatNumber value="${tenant.room.price}" /> VND/tháng
                                                                                </span>
                                                                                <span class="badge ${tenant.status == 'active' ? 'bg-success' : 'bg-secondary'}">
                                                                                    <i class="fas ${tenant.status == 'active' ? 'fa-check-circle' : 'fa-pause-circle'} me-1"></i>
                                                                                    ${tenant.status == 'active' ? 'Đang thuê' : 'Đã kết thúc'}
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Rental Period & Actions -->
                                                                <div class="col-lg-4">
                                                                    <div class="text-lg-end">
                                                                        <!-- Rental Period -->
                                                                        <div class="mb-2">
                                                                            <small class="text-muted d-block">Thời gian thuê</small>
                                                                            <div class="fw-bold">
                                                                                <fmt:formatDate value="${tenant.rentStartAsDate}" pattern="dd/MM/yyyy" />
                                                                                <c:if test="${tenant.rentEnd != null}">
                                                                                    - <fmt:formatDate value="${tenant.rentEndAsDate}" pattern="dd/MM/yyyy" />
                                                                                </c:if>
                                                                                <c:if test="${tenant.rentEnd == null}">
                                                                                    - <span class="text-success">Hiện tại</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>

                                                                        <!-- Action Buttons -->
                                                                        <div class="d-flex gap-2 justify-content-lg-end">
                                                                            <button class="btn btn-sm btn-outline-primary" 
                                                                                    data-bs-toggle="tooltip" 
                                                                                    title="Xem chi tiết">
                                                                                <i class="fas fa-eye"></i>
                                                                            </button>
                                                                            <c:if test="${tenant.status == 'active'}">
                                                                                <button class="btn btn-sm btn-outline-info" 
                                                                                        data-bs-toggle="tooltip" 
                                                                                        title="Thanh toán">
                                                                                    <i class="fas fa-credit-card"></i>
                                                                                </button>
                                                                                <button class="btn btn-sm btn-outline-warning"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#contactModal${tenant.id}"
                                                                                        title="Liên hệ chủ trọ">
                                                                                    <i class="fas fa-comments"></i>
                                                                                </button>

                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Modal báo cáo -->
                                                    <div class="modal fade" id="contactModal${tenant.id}" tabindex="-1" aria-labelledby="contactModalLabel${tenant.id}" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">

                                                                <!-- Header -->
                                                                <div class="modal-header bg-warning text-dark">
                                                                    <h5 class="modal-title fw-bold" id="contactModalLabel${tenant.id}">
                                                                        <i class="fas fa-comments me-2"></i>Báo cáo sự cố / góp ý
                                                                    </h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                                                                </div>

                                                                <!-- Form -->
                                                                <form id="reportForm${tenant.id}" action="${pageContext.request.contextPath}/report/submit" method="post">
                                                                    <div class="modal-body">
                                                                        <!-- Hidden fields -->
                                                                        <input type="hidden" name="roomId" value="${tenant.room.id}" />
                                                                        <input type="hidden" name="tenantId" value="${tenant.id}" />

                                                                        <p class="mb-2"><strong>Phòng:</strong> ${tenant.room.title} (${tenant.room.house.name})</p>

                                                                        <!-- Loại báo cáo -->
                                                                        <div class="mb-3">
                                                                            <label for="type${tenant.id}" class="form-label">Loại phản ánh</label>
                                                                            <select class="form-select" name="type" id="type${tenant.id}" required>
                                                                                <option value="MAINTENANCE">Báo hỏng / sửa chữa</option>
                                                                                <option value="FEEDBACK">Góp ý / ý kiến</option>
                                                                                <option value="OTHER">Khác</option>
                                                                            </select>
                                                                        </div>

                                                                        <!-- Nội dung -->
                                                                        <div class="mb-3">
                                                                            <label for="content${tenant.id}" class="form-label">Nội dung <span class="text-danger">*</span></label>
                                                                            <textarea class="form-control" id="content${tenant.id}" name="content" rows="4" required
                                                                                      placeholder="Ví dụ: Máy lạnh bị hỏng, vòi nước rò rỉ, xin sửa sớm..."></textarea>
                                                                            <div class="invalid-feedback">Vui lòng nhập nội dung báo cáo.</div>
                                                                        </div>

                                                                        <p class="text-muted small">
                                                                            <i class="fas fa-info-circle me-1"></i>
                                                                            Báo cáo sẽ được gửi tới chủ trọ và lưu trong hệ thống để xử lý.
                                                                        </p>
                                                                    </div>

                                                                    <!-- Footer -->
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                                        <button type="submit" id="submitReportBtn${tenant.id}" class="btn btn-primary">
                                                                            <span class="spinner-border spinner-border-sm d-none" id="loadingSpinner${tenant.id}" role="status" aria-hidden="true"></span>
                                                                            <span id="btnText${tenant.id}">Gửi báo cáo</span>
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </c:forEach>
                                            </div>
                                        </c:when>

                                        <c:otherwise>
                                            <!-- Empty State -->
                                            <div class="text-center py-5">
                                                <div class="mb-4">
                                                    <i class="fas fa-home fa-3x text-muted opacity-50"></i>
                                                </div>
                                                <h5 class="text-muted mb-2">Chưa có phòng trọ nào</h5>
                                                <p class="text-muted mb-4">
                                                    Bạn chưa thuê phòng trọ nào. Hãy tìm kiếm và thuê phòng trọ phù hợp với nhu cầu của bạn.
                                                </p>
                                                <a href="${pageContext.request.contextPath}/rooms/search" 
                                                   class="btn btn-primary">
                                                    <i class="fas fa-search me-2"></i>Tìm phòng trọ
                                                </a>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
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

        <!-- Initialize tooltips -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll("form[id^='reportForm']").forEach(function (form) {
                    form.addEventListener("submit", function (e) {
                        const tenantId = form.querySelector("[name='tenantId']").value;
                        const contentField = form.querySelector("textarea[name='content']");
                        const btn = document.getElementById("submitReportBtn" + tenantId);
                        const spinner = document.getElementById("loadingSpinner" + tenantId);
                        const btnText = document.getElementById("btnText" + tenantId);

                        if (contentField.value.trim() === "") {
                            e.preventDefault();
                            contentField.classList.add("is-invalid");
                            return;
                        } else {
                            contentField.classList.remove("is-invalid");
                        }

                        btn.disabled = true;
                        spinner.classList.remove("d-none");
                        btnText.textContent = "Đang gửi...";
                    });
                });
            });
        </script>




    </body>
</html>