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

    <body>

        <!-- **************** MAIN CONTENT START **************** -->        

        <main>

            <!-- Sidebar START -->
            <%@include file="user.include/staffSidebar.jsp" %>
            <!-- Sidebar END -->

            <!-- Page content START -->
            <div class="page-content">

                <div class="page-content-wrapper p-xxl-4">

                    <!-- Title -->
                    <div class="row">
                        <div class="col-12 mb-5">
                            <div class="d-sm-flex justify-content-between align-items-center">
                                <h1 class="h3 mb-2 mb-sm-0">Quản Lý Hồ Sơ Chủ Nhà</h1>
                                <div class="d-grid">
                                    <a href="#" class="btn btn-primary-soft mb-0">
                                        <i class="bi bi-plus-lg fa-fw"></i> Thêm Hồ Sơ Mới
                                    </a>
                                </div>					
                            </div>
                        </div>
                    </div>

                    <!-- Counter START -->
                    <div class="row g-4 mb-5">
                        <!-- Counter item -->
                        <div class="col-md-6 col-xxl-3">
                            <div class="card card-body shadow p-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <!-- Number -->
                                    <div class="me-2">
                                        <span>Hồ Sơ Mới</span>
                                        <h3 class="mb-0 mt-2">${newProfilesCount != null ? newProfilesCount : 0}</h3>
                                    </div>
                                    <!-- Icon -->
                                    <div class="icon-lg rounded-circle flex-shrink-0 bg-primary bg-opacity-10 text-primary mb-0">
                                        <i class="bi bi-person-plus fa-fw"></i>
                                    </div>
                                </div>
                                <!-- Progress bar -->
                                <div class="progress progress-xs bg-primary bg-opacity-10 mb-2">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                                    </div>
                                </div>
                                <span><span class="text-primary">${todayNewProfiles != null ? todayNewProfiles : 0} hồ sơ mới</span> hôm nay</span>
                            </div>	
                        </div>

                        <!-- Counter item -->
                        <div class="col-md-6 col-xxl-3">
                            <div class="card card-body shadow p-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <!-- Number -->
                                    <div class="me-2">
                                        <span>Đã Duyệt</span>
                                        <h3 class="mb-0 mt-2">${approvedProfilesCount != null ? approvedProfilesCount : 0}</h3>
                                    </div>
                                    <!-- Icon -->
                                    <div class="icon-lg rounded-circle flex-shrink-0 bg-success bg-opacity-10 text-success mb-0">
                                        <i class="bi bi-check-circle fa-fw"></i>
                                    </div>
                                </div>
                                <!-- Progress bar -->
                                <div class="progress progress-xs bg-success bg-opacity-10 mb-2">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                                    </div>
                                </div>
                                <span><span class="text-success">${todayApproved != null ? todayApproved : 0} hồ sơ duyệt</span> hôm nay</span>
                            </div>	
                        </div>

                        <!-- Counter item -->
                        <div class="col-md-6 col-xxl-3">
                            <div class="card card-body shadow p-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <!-- Number -->
                                    <div class="me-2">
                                        <span>Chờ Duyệt</span>
                                        <h3 class="mb-0 mt-2">${pendingProfilesCount != null ? pendingProfilesCount : 0}</h3>
                                    </div>
                                    <!-- Icon -->
                                    <div class="icon-lg rounded-circle flex-shrink-0 bg-warning bg-opacity-10 text-warning mb-0">
                                        <i class="bi bi-hourglass-split fa-fw"></i>
                                    </div>
                                </div>
                                <!-- Progress bar -->
                                <div class="progress progress-xs bg-warning bg-opacity-10 mb-2">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 45%" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                                    </div>
                                </div>
                                <span><span class="text-warning">${urgentPending != null ? urgentPending : 0} hồ sơ cần</span> xử lý gấp</span>
                            </div>	
                        </div>

                        <!-- Counter item -->
                        <div class="col-md-6 col-xxl-3">
                            <div class="card card-body shadow p-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <!-- Number -->
                                    <div class="me-2">
                                        <span>Bị Từ Chối</span>
                                        <h3 class="mb-0 mt-2">${rejectedProfilesCount != null ? rejectedProfilesCount : 0}</h3>
                                    </div>
                                    <!-- Icon -->
                                    <div class="icon-lg rounded-circle flex-shrink-0 bg-danger bg-opacity-10 text-danger mb-0">
                                        <i class="bi bi-x-circle fa-fw"></i>
                                    </div>
                                </div>
                                <!-- Progress bar -->
                                <div class="progress progress-xs bg-danger bg-opacity-10 mb-2">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                    </div>
                                </div>
                                <span><span class="text-danger">${todayRejected != null ? todayRejected : 0} hồ sơ từ chối</span> hôm nay</span>
                            </div>	
                        </div>
                    </div>
                    <!-- Counter END -->

                    <!-- Tabs and search START -->
                    <!-- Tabs Navigation -->
                    <div class="row g-4 justify-content-between align-items-center">
                        <div class="col-lg-5">
                            <ul class="nav nav-pills-shadow nav-responsive" id="profileTabs" role="tablist">
                                <li class="nav-item"> 
                                    <a class="nav-link mb-0 me-sm-2 active" id="tab-all-tab" data-bs-toggle="tab" href="#tab-all" role="tab">Tất Cả Trạng Thái</a> 
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link mb-0 me-sm-2" id="tab-approved-tab" data-bs-toggle="tab" href="#tab-approved" role="tab">Đã Duyệt</a>
                                </li>
                                <li class="nav-item"> 
                                    <a class="nav-link mb-0 me-sm-2" id="tab-pending-tab" data-bs-toggle="tab" href="#tab-pending" role="tab">Chờ Duyệt</a> 
                                </li>
                                <li class="nav-item"> 
                                    <a class="nav-link mb-0" id="tab-rejected-tab" data-bs-toggle="tab" href="#tab-rejected" role="tab">Bị Từ Chối</a> 
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Tabs Content -->
                    <div class="tab-content mt-5" id="myTabContent">
                        <c:forEach var="tab" items="${fn:split('ALL,APPROVED,PENDING,REJECTED', ',')}">
                            <c:set var="tabId" value="tab-${fn:toLowerCase(tab)}" />
                            <div class="tab-pane fade ${tab == 'ALL' ? 'show active' : ''}" id="${tabId}" role="tabpanel">
                                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xxl-4 g-4">
                                    <c:set var="found" value="false" />
                                    <c:forEach var="profile" items="${ownerProfiles}">
                                        <c:if test="${tab == 'ALL' || profile.approved == tab}">
                                            <c:set var="found" value="true" />
                                            <!-- Card START -->
                                            <div class="col">
                                                <div class="card shadow h-100">
                                                    <div class="card-header bg-light p-3">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <c:choose>
                                                                <c:when test="${profile.approved == 'APPROVED'}">
                                                                    <div class="badge text-bg-success">
                                                                        <i class="bi bi-check-circle-fill me-1"></i> Đã duyệt
                                                                    </div>
                                                                </c:when>
                                                                <c:when test="${profile.approved == 'REJECTED'}">
                                                                    <div class="badge text-bg-danger">
                                                                        <i class="bi bi-x-circle-fill me-1"></i> Bị từ chối
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="badge text-bg-warning">
                                                                        <i class="bi bi-hourglass-split me-1"></i> Chờ duyệt
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <div class="dropdown">
                                                                <button class="btn btn-sm btn-outline-secondary border-0" type="button" id="dropdownAction${profile.id}" data-bs-toggle="dropdown" aria-expanded="false">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                                <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownAction${profile.id}">
                                                                    <c:if test="${profile.approved == 'PENDING'}">
                                                                        <li>
                                                                            <form method="post" action="${pageContext.request.contextPath}/boarding-house/updateApproval" class="d-inline">
                                                                                <input type="hidden" name="profileId" value="${profile.id}" />
                                                                                <input type="hidden" name="status" value="APPROVED" />
                                                                                <button type="submit" class="dropdown-item text-success">
                                                                                    <i class="bi bi-check-circle me-2"></i>Duyệt hồ sơ
                                                                                </button>
                                                                            </form>
                                                                        </li>
                                                                        <li>
                                                                            <button type="button" class="dropdown-item text-danger" data-bs-toggle="modal" data-bs-target="#rejectModal${profile.id}">
                                                                                <i class="bi bi-x-circle me-2"></i>Từ chối
                                                                            </button>
                                                                        </li>
                                                                    </c:if>
                                                                    <li><hr class="dropdown-divider" /></li>
                                                                    <li>
                                                                        <a class="dropdown-item text-warning" href="${pageContext.request.contextPath}/ownerProfile/edit/${profile.id}">
                                                                            <i class="bi bi-pencil me-2"></i>Chỉnh sửa
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-body px-3">
                                                        <h5 class="card-title mb-1">
                                                            <c:out value="${profile.owner.fullName}" default="Chưa có tên"/>
                                                        </h5>
                                                        <p class="text-muted small mb-3">
                                                            <i class="bi bi-envelope me-1"></i>
                                                            <c:out value="${profile.owner.email}" default="Chưa có email"/>
                                                        </p>
                                                        <ul class="list-group list-group-borderless small mt-2 mb-0">
                                                            <li class="list-group-item pb-1 px-0">
                                                                <i class="bi bi-card-text text-primary me-2"></i> 
                                                                <strong>CMND/CCCD:</strong> 
                                                                <c:out value="${profile.owner.cccd}" default="Chưa cập nhật"/>
                                                            </li>
                                                            <li class="list-group-item pb-1 px-0">
                                                                <i class="bi bi-telephone text-success me-2"></i> 
                                                                <strong>Điện thoại:</strong> 
                                                                <c:out value="${profile.owner.phoneNumber}" default="Chưa cập nhật"/>
                                                            </li>
                                                            <li class="list-group-item pb-1 px-0">
                                                                <i class="bi bi-file-earmark-text text-info me-2"></i> 
                                                                <strong>Giấy chứng nhận:</strong> 
                                                                <c:choose>
                                                                    <c:when test="${not empty profile.landCertificate}">
                                                                        <span class="text-success">Đã có</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="text-warning">Chưa có</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </li>
                                                            <li class="list-group-item pb-1 px-0">
                                                                <i class="bi bi-house-door text-warning me-2"></i> 
                                                                <strong>Số nhà trọ:</strong> 
                                                                <span class="badge bg-primary rounded-pill">
                                                                    ${profile.boardingHouses != null ? profile.boardingHouses.size() : 0}
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="card-footer bg-light pt-3">
                                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                                            <small class="text-muted">
                                                                <i class="bi bi-calendar3 me-1"></i>
                                                                <fmt:formatDate value="${profile.createdAtDate}" pattern="dd/MM/yyyy" />
                                                            </small>
                                                            <c:if test="${profile.updatedAt != null}">
                                                                <small class="text-muted">
                                                                    <i class="bi bi-arrow-repeat me-1"></i>
                                                                    <fmt:formatDate value="${profile.updatedAtAsDate}" pattern="dd/MM/yyyy" />
                                                                </small>
                                                            </c:if>
                                                        </div>
                                                        <button type="button" class="btn btn-sm btn-primary w-100" 
                                                                data-bs-toggle="modal" data-bs-target="#ownershipDetailModal${profile.id}">
                                                            <i class="bi bi-eye me-1"></i>Xem chi tiết
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>  
                                            <%@include file="user.include/detailBoardingHouse.jsp" %>
                                            <!-- Card END -->
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${not found}">
                                        <div class="col-12">
                                            <div class="text-center py-5">
                                                <i class="bi bi-inbox display-1 text-muted"></i>
                                                <h4 class="mt-3">Không có hồ sơ nào</h4>
                                                <p class="text-muted">Chưa có hồ sơ chủ nhà phù hợp với trạng thái này.</p>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- Tab content END -->

                    <!-- Pagination START -->
                    <c:if test="${totalPages > 1}">
                        <div class="d-sm-flex justify-content-sm-between align-items-sm-center mt-4">
                            <p class="mb-sm-0 text-center text-sm-start">
                                Hiển thị từ 
                                <strong>${(currentPage - 1) * pageSize + 1}</strong>
                                đến 
                                <strong>
                                    <c:choose>
                                        <c:when test="${currentPage * pageSize > totalElements}">
                                            ${totalElements}
                                        </c:when>
                                        <c:otherwise>
                                            ${currentPage * pageSize}
                                        </c:otherwise>
                                    </c:choose>
                                </strong>
                                trong tổng số <strong>${totalElements}</strong> hồ sơ
                            </p>

                            <nav class="mb-sm-0 d-flex justify-content-center" aria-label="pagination">
                                <ul class="pagination pagination-sm pagination-primary-soft mb-0">
                                    <!-- Trang trước -->
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage - 1}&size=${pageSize}${param.search != null ? '&search=' += param.search : ''}">Trước</a>
                                        </li>
                                    </c:if>

                                    <!-- Các số trang -->
                                    <c:set var="start" value="${currentPage - 2 < 1 ? 1 : currentPage - 2}" />
                                    <c:set var="end" value="${currentPage + 2 > totalPages ? totalPages : currentPage + 2}" />

                                    <c:forEach begin="${start}" end="${end}" var="i">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}&size=${pageSize}${param.search != null ? '&search=' += param.search : ''}">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <!-- Trang sau -->
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage + 1}&size=${pageSize}${param.search != null ? '&search=' += param.search : ''}">Sau</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </c:if>

                    <!-- Pagination END -->

                </div>
            </div>
            <!-- Page content END -->
        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Bootstrap JS -->
        <script src="../../../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="${pageContext.request.contextPath}/assets/js/functions.js"></script>

    </body>

</html>