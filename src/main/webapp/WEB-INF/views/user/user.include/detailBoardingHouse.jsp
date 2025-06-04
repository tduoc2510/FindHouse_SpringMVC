<!-- Modal -->
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="modal fade" id="ownershipDetailModal${profile.id}" tabindex="-1" aria-labelledby="ownershipModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <!-- Header -->
            <div class="modal-header bg-primary text-white">
                <h4 class="modal-title fw-bold" id="ownershipModalLabel">
                    <i class="bi bi-building me-2"></i>Chi tiết hồ sơ chủ trọ
                </h4>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Body -->
            <div class="modal-body p-4">
                <div class="row g-4">
                    <!-- Giấy chứng nhận quyền sử dụng đất -->
                    <div class="col-lg-6">
                        <div class="border rounded-3 p-4 h-100 bg-light">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-file-earmark-pdf text-danger fs-4 me-2"></i>
                                <div>
                                    <h6 class="fw-semibold mb-1">Giấy chứng nhận đất</h6>
                                    <small class="text-muted">Tài liệu PDF đã tải lên</small>
                                </div>
                            </div>
                            <div class="border rounded">
                                <iframe src="${pageContext.request.contextPath}${profile.landCertificate}" 
                                        class="w-100 rounded" style="height: 250px; border: none;"></iframe>
                            </div>
                        </div>
                    </div>

                    <!-- Hợp đồng sở hữu -->
                    <div class="col-lg-6">
                        <div class="border rounded-3 p-4 h-100 bg-light">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-file-earmark-text text-info fs-4 me-2"></i>
                                <div>
                                    <h6 class="fw-semibold mb-1">Hợp đồng sở hữu</h6>
                                    <small class="text-muted">Tài liệu PDF đã tải lên</small>
                                </div>
                            </div>
                            <div class="border rounded">
                                <iframe src="${pageContext.request.contextPath}${profile.ownershipContract}" 
                                        class="w-100 rounded" style="height: 250px; border: none;"></iframe>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Thông tin nhà trọ -->
                <div class="card border-0 shadow-sm mt-4">
                    <div class="card-header bg-light border-0 py-3">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-house text-success fs-5 me-2"></i>
                            <h5 class="mb-0 fw-bold text-dark">Thông tin nhà trọ</h5>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-4">
                            <c:forEach var="house" items="${profile.boardingHouses}">
                                <div class="col-md-6">
                                    <div class="border rounded p-3 bg-light">
                                        <h6 class="fw-semibold"><i class="bi bi-house-door me-1"></i>${house.name}</h6>
                                        <p class="mb-1 small"><i class="bi bi-door-open me-1"></i>Số phòng: ${house.maxRoomCount}</p>
                                        <p class="mb-1 small"><i class="bi bi-geo-alt me-1"></i>Địa chỉ: ${house.address}</p>
                                        <p class="mb-0 small"><i class="bi bi-card-text me-1"></i>${house.description}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="modal-footer bg-light border-0 p-4">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="bi bi-x-lg me-1"></i>Đóng
                </button>
            </div>

        </div>
    </div>
</div>
