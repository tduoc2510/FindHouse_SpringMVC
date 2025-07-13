
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <%@include file="../include/head.jsp" %>
    <body class="bg-dark text-light">
        <%@include file="../include/header.jsp" %>
        <main>
            <!-- QUẢN LÝ TẤT CẢ BÀI VIẾT -->
            <section class="py-5" style="background: linear-gradient(135deg, #0f0f0f 0%, #1a1a1a 50%, #0f0f0f 100%); min-height: 100vh;">
                <div class="container-fluid px-4">
                    <!-- Header với Search và Filter -->
                    <div class="row mb-5">
                        <div class="col-12">
                            <div class="text-center mb-4">
                                <h1 class="display-5 fw-bold text-light mb-3">
                                    <i class="bi bi-card-text me-3 text-info"></i>
                                    Bài viết PR nhà trọ
                                </h1>
                                <p class="lead text-light opacity-75">Quản lý và theo dõi tất cả bài viết giới thiệu nhà trọ</p>
                            </div>

                            <!-- Search và Filter Bar -->
                            <div class="row justify-content-center mb-4">
                                <div class="col-lg-8">
                                    <div class="card bg-dark border-secondary shadow-lg" style="border-radius: 20px; background: rgba(255,255,255,0.05) !important;">
                                        <div class="card-body p-3">
                                            <div class="row g-3 align-items-center">
                                                <div class="col-md-6">
                                                    <div class="input-group">
                                                        <span class="input-group-text bg-dark border-secondary text-light">
                                                            <i class="bi bi-search"></i>
                                                        </span>
                                                        <input type="text" class="form-control bg-dark border-secondary text-light" 
                                                               placeholder="Tìm kiếm bài viết..." style="border-radius: 0 10px 10px 0;">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <select class="form-select bg-dark border-secondary text-light">
                                                        <option value="">Tất cả trạng thái</option>
                                                        <option value="active">Đang hoạt động</option>
                                                        <option value="inactive">Tạm dừng</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                    <button class="btn btn-info w-100 rounded-pill">
                                                        <i class="bi bi-funnel me-1"></i>Lọc
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Danh sách bài viết với layout cải tiến -->
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <c:choose>
                                <c:when test="${empty posts}">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-6">
                                            <div class="card bg-dark border-secondary shadow-lg" style="border-radius: 20px;">
                                                <div class="card-body text-center py-5">
                                                    <div class="mb-4">
                                                        <i class="bi bi-journal-x text-info opacity-75" style="font-size: 4rem;"></i>
                                                    </div>
                                                    <h4 class="text-light mb-3">Chưa có bài viết nào</h4>
                                                    <p class="text-light opacity-75 mb-4">Hãy tạo bài viết đầu tiên để giới thiệu nhà trọ của bạn!</p>
                                                    <button class="btn btn-info rounded-pill px-4 py-2">
                                                        <i class="bi bi-plus-circle me-2"></i>Tạo bài viết mới
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- Grid Layout cho bài viết -->
                                    <div class="row g-4">
                                        <c:forEach var="post" items="${posts}" varStatus="status">
                                            <div class="col-xl-6 col-lg-8 col-md-10 mx-auto">
                                                <article class="post-card bg-dark border-secondary shadow-lg h-100" 
                                                         style="border-radius: 20px; border: 1px solid #404040 !important;
                                                         background: linear-gradient(145deg, #1e1e1e, #2a2a2a) !important;
                                                         transition: all 0.4s ease;">

                                                    <!-- Post Header -->
                                                    <header class="card-header border-0 p-4" 
                                                            style="border-radius: 20px 20px 0 0; background: rgba(255,255,255,0.03);">
                                                        <div class="d-flex align-items-start">
                                                            <div class="flex-shrink-0 me-3">
                                                                <div class="avatar-gradient rounded-circle d-flex align-items-center justify-content-center" 
                                                                     style="width: 50px; height: 50px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                                                                     box-shadow: 0 4px 20px rgba(102, 126, 234, 0.4);">
                                                                    <i class="bi bi-house-door-fill text-white fs-5"></i>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <h5 class="mb-1 fw-bold text-light">${post.house.name}</h5>
                                                                <p class="mb-0 text-light opacity-75 small">
                                                                    <i class="bi bi-geo-alt me-1 text-danger"></i>
                                                                    ${post.house.address}
                                                                </p>
                                                            </div>
                                                            <div class="dropdown">
                                                                <button class="btn btn-link text-light p-1 opacity-75 rounded-circle" 
                                                                        type="button" data-bs-toggle="dropdown"
                                                                        style="width: 35px; height: 35px;">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                                <ul class="dropdown-menu dropdown-menu-dark bg-dark border-secondary shadow-lg">
                                                                    <li><a class="dropdown-item text-light" href="${pageContext.request.contextPath}/posts/edit/${post.postId}">
                                                                            <i class="bi bi-pencil-square me-2 text-info"></i>Chỉnh sửa
                                                                        </a></li>
                                                                    <li><hr class="dropdown-divider border-secondary"></li>
                                                                    <li><a class="dropdown-item text-danger" href="#" onclick="deletePost(${post.postId})">
                                                                            <i class="bi bi-trash3 me-2"></i>Xóa bài viết
                                                                        </a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </header>

                                                    <!-- Post Content -->
                                                    <div class="card-body px-4 pt-0">
                                                        <h4 class="mb-3 fw-bold text-light lh-base">${post.title}</h4>
                                                        <div class="post-content text-light mb-4" style="line-height: 1.7; opacity: 0.9;">
                                                            <c:choose>
                                                                <c:when test="${fn:length(post.content) > 180}">
                                                                    <p class="mb-2">
                                                                        <span id="shortContent${status.index}">${fn:substring(post.content, 0, 180)}...</span>
                                                                        <span id="fullContent${status.index}" style="display: none;">${post.content}</span>
                                                                    </p>
                                                                    <button class="btn btn-link text-info p-0 fw-bold text-decoration-none border-0" 
                                                                            onclick="toggleContent(${status.index})" 
                                                                            id="toggleBtn${status.index}"
                                                                            style="text-shadow: 0 0 8px rgba(32, 201, 151, 0.5);">
                                                                        Xem thêm <i class="bi bi-chevron-down ms-1"></i>
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <p class="mb-0">${post.content}</p>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>

                                                    <!-- Hình ảnh Gallery - Mosaic Layout -->
                                                    <c:if test="${not empty houseImages[post.house.id]}">
                                                        <div class="position-relative mx-4 mb-4">
                                                            <c:choose>
                                                                <c:when test="${fn:length(houseImages[post.house.id]) == 1}">
                                                                    <div class="single-image-container rounded-3 overflow-hidden shadow-lg">
                                                                        <img src="${pageContext.request.contextPath}${houseImages[post.house.id][0].imageUrl}" 
                                                                             class="w-100 gallery-image"
                                                                             alt="Ảnh nhà trọ"
                                                                             style="height: 350px; object-fit: cover; cursor: pointer;" 
                                                                             onclick="openLightbox('${pageContext.request.contextPath}${houseImages[post.house.id][0].imageUrl}')" />
                                                                    </div>
                                                                </c:when>

                                                                <c:when test="${fn:length(houseImages[post.house.id]) == 2}">
                                                                    <div class="two-images-grid rounded-3 overflow-hidden shadow-lg">
                                                                        <div class="row g-2">
                                                                            <c:forEach var="image" items="${houseImages[post.house.id]}" varStatus="imgStatus">
                                                                                <div class="col-6">
                                                                                    <div class="image-container position-relative overflow-hidden h-100">
                                                                                        <img src="${pageContext.request.contextPath}${image.imageUrl}" 
                                                                                             class="w-100 h-100 gallery-image"
                                                                                             alt="Ảnh nhà trọ ${imgStatus.index + 1}"
                                                                                             style="object-fit: cover; height: 300px; cursor: pointer;" 
                                                                                             onclick="openGallery(${post.house.id}, ${imgStatus.index})" />
                                                                                        <div class="image-overlay">
                                                                                            <i class="bi bi-zoom-in"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </div>
                                                                </c:when>

                                                                <c:when test="${fn:length(houseImages[post.house.id]) == 3}">
                                                                    <div class="three-images-grid rounded-3 overflow-hidden shadow-lg">
                                                                        <div class="row g-2">
                                                                            <div class="col-8">
                                                                                <div class="image-container position-relative overflow-hidden h-100">
                                                                                    <img src="${pageContext.request.contextPath}${houseImages[post.house.id][0].imageUrl}" 
                                                                                         class="w-100 h-100 gallery-image"
                                                                                         alt="Ảnh nhà trọ chính"
                                                                                         style="object-fit: cover; height: 300px; cursor: pointer;" 
                                                                                         onclick="openGallery(${post.house.id}, 0)" />
                                                                                    <div class="image-overlay">
                                                                                        <i class="bi bi-zoom-in"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-4">
                                                                                <div class="row g-2 h-100">
                                                                                    <c:forEach var="image" items="${houseImages[post.house.id]}" varStatus="imgStatus" begin="1" end="2">
                                                                                        <div class="col-12">
                                                                                            <div class="image-container position-relative overflow-hidden h-100">
                                                                                                <img src="${pageContext.request.contextPath}${image.imageUrl}" 
                                                                                                     class="w-100 h-100 gallery-image"
                                                                                                     alt="Ảnh nhà trọ ${imgStatus.index + 1}"
                                                                                                     style="object-fit: cover; height: 146px; cursor: pointer;" 
                                                                                                     onclick="openGallery(${post.house.id}, ${imgStatus.index})" />
                                                                                                <div class="image-overlay">
                                                                                                    <i class="bi bi-zoom-in"></i>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <div class="multi-images-grid rounded-3 overflow-hidden shadow-lg">
                                                                        <div class="row g-2">
                                                                            <!-- Main image -->
                                                                            <div class="col-6">
                                                                                <div class="image-container position-relative overflow-hidden h-100">
                                                                                    <img src="${pageContext.request.contextPath}${houseImages[post.house.id][0].imageUrl}" 
                                                                                         class="w-100 h-100 gallery-image"
                                                                                         alt="Ảnh nhà trọ chính"
                                                                                         style="object-fit: cover; height: 300px; cursor: pointer;" 
                                                                                         onclick="openGallery(${post.house.id}, 0)" />
                                                                                    <div class="image-overlay">
                                                                                        <i class="bi bi-zoom-in"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Side images -->
                                                                            <div class="col-6">
                                                                                <div class="row g-2 h-100">
                                                                                    <c:forEach var="image" items="${houseImages[post.house.id]}" varStatus="imgStatus" begin="1" end="3">
                                                                                        <div class="col-6">
                                                                                            <div class="image-container position-relative overflow-hidden h-100">
                                                                                                <img src="${pageContext.request.contextPath}${image.imageUrl}" 
                                                                                                     class="w-100 h-100 gallery-image"
                                                                                                     alt="Ảnh nhà trọ ${imgStatus.index + 1}"
                                                                                                     style="object-fit: cover; height: 146px; cursor: pointer;" 
                                                                                                     onclick="openGallery(${post.house.id}, ${imgStatus.index})" />
                                                                                                <div class="image-overlay">
                                                                                                    <c:choose>
                                                                                                        <c:when test="${imgStatus.index == 3 && fn:length(houseImages[post.house.id]) > 4}">
                                                                                                            <div class="more-images-overlay">
                                                                                                                <i class="bi bi-plus-circle fs-3 mb-2"></i>
                                                                                                                <span class="fw-bold">+${fn:length(houseImages[post.house.id]) - 4}</span>
                                                                                                            </div>
                                                                                                        </c:when>
                                                                                                        <c:otherwise>
                                                                                                            <i class="bi bi-zoom-in"></i>
                                                                                                        </c:otherwise>
                                                                                                    </c:choose>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <!-- Image Counter Badge -->
                                                            <div class="position-absolute top-0 end-0 m-3">
                                                                <span class="badge rounded-pill px-3 py-2 fw-bold" 
                                                                      style="background: rgba(0,0,0,0.8); backdrop-filter: blur(15px);
                                                                      border: 1px solid rgba(255,255,255,0.2); color: white;
                                                                      box-shadow: 0 4px 20px rgba(0,0,0,0.4);">
                                                                    <i class="bi bi-images me-1"></i>${fn:length(houseImages[post.house.id])} ảnh
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </c:if>

                                                    <!-- Thông tin chi tiết -->
                                                    <div class="card-body px-4 py-3">
                                                        <div class="row g-3">
                                                            <div class="col-sm-6">
                                                                <div class="info-item d-flex align-items-center p-3 rounded-3" 
                                                                     style="background: rgba(255,107,107,0.1); border: 1px solid rgba(255,107,107,0.3);">
                                                                    <i class="bi bi-geo-alt-fill me-3 fs-5" style="color: #ff6b6b;"></i>
                                                                    <div>
                                                                        <small class="text-light opacity-75 d-block">Địa chỉ</small>
                                                                        <span class="text-light fw-semibold">${post.house.address}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="info-item d-flex align-items-center p-3 rounded-3" 
                                                                     style="background: rgba(78,205,196,0.1); border: 1px solid rgba(78,205,196,0.3);">
                                                                    <i class="bi bi-door-open-fill me-3 fs-5" style="color: #4ecdc4;"></i>
                                                                    <div>
                                                                        <small class="text-light opacity-75 d-block">Số phòng</small>
                                                                        <span class="text-light fw-semibold">${post.house.maxRoomCount} phòng</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <div class="info-item d-flex align-items-center p-3 rounded-3" 
                                                                     style="background: rgba(81,207,102,0.1); border: 1px solid rgba(81,207,102,0.3);">
                                                                    <i class="bi bi-check-circle-fill me-3 fs-5" style="color: #51cf66;"></i>
                                                                    <div class="flex-grow-1">
                                                                        <small class="text-light opacity-75 d-block">Trạng thái hoạt động</small>
                                                                        <span class="badge rounded-pill px-3 py-2 mt-1" 
                                                                              style="background: linear-gradient(135deg, #51cf66, #40c057);
                                                                              color: white; box-shadow: 0 3px 10px rgba(81, 207, 102, 0.4);">
                                                                            <i class="bi bi-broadcast me-1"></i>Đang hoạt động
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Action Footer -->
                                                    <footer class="card-footer border-0 px-4 py-4" 
                                                            style="background: rgba(255,255,255,0.03); border-top: 1px solid #404040 !important;
                                                            border-radius: 0 0 20px 20px;">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div class="d-flex gap-2">
                                                                <button class="btn btn-outline-light btn-sm rounded-pill px-3 py-2 action-btn" 
                                                                        style="border: 1px solid rgba(255,255,255,0.2); background: rgba(255,255,255,0.05);">
                                                                    <i class="bi bi-heart me-1" style="color: #ff6b6b;"></i>
                                                                    <span class="d-none d-sm-inline">Thích</span>
                                                                </button>
                                                                <button class="btn btn-outline-light btn-sm rounded-pill px-3 py-2 action-btn" 
                                                                        style="border: 1px solid rgba(255,255,255,0.2); background: rgba(255,255,255,0.05);">
                                                                    <i class="bi bi-chat-dots me-1" style="color: #4ecdc4;"></i>
                                                                    <span class="d-none d-sm-inline">Bình luận</span>
                                                                </button>
                                                                <button class="btn btn-outline-light btn-sm rounded-pill px-3 py-2 action-btn" 
                                                                        style="border: 1px solid rgba(255,255,255,0.2); background: rgba(255,255,255,0.05);">
                                                                    <i class="bi bi-share me-1" style="color: #ffd93d;"></i>
                                                                    <span class="d-none d-sm-inline">Chia sẻ</span>
                                                                </button>
                                                            </div>
                                                            <a href="${pageContext.request.contextPath}/posts/detail/${post.postId}" 
                                                               class="btn btn-sm rounded-pill px-4 py-2 text-white fw-semibold" 
                                                               style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                                                               border: none; box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
                                                               transition: all 0.3s ease;">
                                                                <i class="bi bi-eye me-2"></i>Xem chi tiết
                                                            </a>
                                                        </div>
                                                    </footer>
                                                </article>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <!-- Pagination -->
                                    <div class="row mt-5">
                                        <div class="col-12">
                                            <nav aria-label="Pagination" class="d-flex justify-content-center">
                                                <ul class="pagination pagination-dark">
                                                    <li class="page-item">
                                                        <a class="page-link bg-dark border-secondary text-light" href="#" aria-label="Previous">
                                                            <i class="bi bi-chevron-left"></i>
                                                        </a>
                                                    </li>
                                                    <li class="page-item active">
                                                        <a class="page-link bg-info border-info text-dark" href="#">1</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link bg-dark border-secondary text-light" href="#">2</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link bg-dark border-secondary text-light" href="#">3</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a class="page-link bg-dark border-secondary text-light" href="#" aria-label="Next">
                                                            <i class="bi bi-chevron-right"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- JavaScript -->
        <script>
            function toggleContent(index) {
                const shortContent = document.getElementById('shortContent' + index);
                const fullContent = document.getElementById('fullContent' + index);
                const toggleBtn = document.getElementById('toggleBtn' + index);

                if (fullContent.style.display === 'none') {
                    shortContent.style.display = 'none';
                    fullContent.style.display = 'inline';
                    toggleBtn.innerHTML = 'Thu gọn <i class="bi bi-chevron-up ms-1"></i>';
                } else {
                    shortContent.style.display = 'inline';
                    fullContent.style.display = 'none';
                    toggleBtn.innerHTML = 'Xem thêm <i class="bi bi-chevron-down ms-1"></i>';
                }
            }

            function deletePost(postId) {
                if (confirm('Bạn có chắc chắn muốn xóa bài viết này không?')) {
                    window.location.href = '${pageContext.request.contextPath}/posts/delete/' + postId;
                }
            }

            // Lightbox và Gallery functions
            function openLightbox(imageSrc) {
                const lightbox = document.createElement('div');
                lightbox.className = 'lightbox-overlay';
                lightbox.innerHTML = `
                    <div class="lightbox-container">
                        <button class="lightbox-close">&times;</button>
                        <img src="${imageSrc}" alt="Ảnh nhà trọ" class="lightbox-image">
                    </div>
                `;
                document.body.appendChild(lightbox);

                // Close lightbox
                lightbox.querySelector('.lightbox-close').onclick = () => document.body.removeChild(lightbox);
                lightbox.onclick = (e) => {
                    if (e.target === lightbox)
                        document.body.removeChild(lightbox);
                };
            }

            function openGallery(houseId, startIndex) {
                // Implement gallery modal here
                console.log('Opening gallery for house:', houseId, 'starting at index:', startIndex);
                // You can implement a full gallery modal with navigation
            }

            // Enhanced interactions
            document.addEventListener('DOMContentLoaded', function () {
                // Smooth hover animations for cards
                const postCards = document.querySelectorAll('.post-card');
                postCards.forEach(card => {
                    card.addEventListener('mouseenter', function () {
                        this.style.transform = 'translateY(-8px) scale(1.02)';
                        this.style.boxShadow = '0 20px 40px rgba(0,0,0,0.6)';
                    });

                    card.addEventListener('mouseleave', function () {
                        this.style.transform = 'translateY(0) scale(1)';
                        this.style.boxShadow = '';
                    });
                });

                // Action buttons hover effects
                const actionBtns = document.querySelectorAll('.action-btn');
                actionBtns.forEach(btn => {
                    btn.addEventListener('mouseenter', function () {
                        this.style.transform = 'translateY(-2px)';
                        this.style.background = 'rgba(255,255,255,0.15)';
                    });

                    btn.addEventListener('mouseleave', function () {
                        this.style.transform = 'translateY(0)';
                        this.style.background = 'rgba(255,255,255,0.05)';
                    });
                });

                // Search functionality
                const searchInput = document.querySelector('input[placeholder="Tìm kiếm bài viết..."]');
                if (searchInput) {
                    searchInput.addEventListener('input', function () {
                        // Implement search logic here
                        console.log('Searching for:', this.value);
                    });
                }

                // Parallax effect for background
                window.addEventListener('scroll', function () {
                    const scrolled = window.pageYOffset;
                    const parallax = document.querySelector('section');
                    const speed = scrolled * 0.5;
                    parallax.style.backgroundPosition = `center ${speed}px`;
                });
            });
        </script>

        <style>
            /* Image Gallery Styles */
            .image-container {
                position: relative;
                overflow: hidden;
                border-radius: 8px;
            }

            .gallery-image {
                transition: all 0.4s ease;
                filter: brightness(0.95);
            }

            .gallery-image:hover {
                transform: scale(1.05);
                filter: brightness(1.1);
            }

            .image-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0,0,0,0.4);
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0;
                transition: all 0.3s ease;
                color: white;
                font-size: 1.5rem;
            }

            .image-container:hover .image-overlay {
                opacity: 1;
                backdrop-filter: blur(2px);
            }

            .more-images-overlay {
                text-align: center;
                color: white;
            }

            .more-images-overlay span {
                font-size: 1.2rem;
            }

            /* Lightbox Styles */
            .lightbox-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.9);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 9999;
                animation: fadeIn 0.3s ease;
            }

            .lightbox-container {
                position: relative;
                max-width: 90%;
                max-height: 90%;
            }

            .lightbox-image {
                max-width: 100%;
                max-height: 100%;
                border-radius: 10px;
                box-shadow: 0 20px 60px rgba(0,0,0,0.8);
            }

            .lightbox-close {
                position: absolute;
                top: -40px;
                right: 0;
                background: none;
                border: none;
                color: white;
                font-size: 2rem;
                cursor: pointer;
                padding: 5px 10px;
                border-radius: 50%;
                background: rgba(255,255,255,0.2);
                transition: all 0.3s ease;
            }

            .lightbox-close:hover {
                background: rgba(255,255,255,0.3);
                transform: rotate(90deg);
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            /* Grid layouts for different image counts */
            .single-image-container,
            .two-images-grid,
            .three-images-grid,
            .multi-images-grid {
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            }

            /* Responsive adjustments for image grids */
            @media (max-width: 768px) {
                .three-images-grid .col-8,
                .multi-images-grid .col-6 {
                    flex: 0 0 100%;
                    max-width: 100%;
                }

                .three-images-grid .col-4,
                .multi-images-grid .col-6:last-child {
                    flex: 0 0 100%;
                    max-width: 100%;
                    margin-top: 8px;
                }

                .three-images-grid .col-4 .row,
                .multi-images-grid .col-6:last-child .row {
                    flex-direction: row;
                }

                .three-images-grid .col-4 .col-12,
                .multi-images-grid .col-6:last-child .col-6 {
                    flex: 0 0 50%;
                    max-width: 50%;
                }
            }
            .post-card {
                transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
                border: 1px solid rgba(255,255,255,0.1) !important;
            }

            .post-card:hover {
                border: 1px solid rgba(255,255,255,0.2) !important;
            }

            .avatar-gradient {
                animation: pulse 2s infinite;
            }

            

            .info-item {
                transition: all 0.3s ease;
            }

            .info-item:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            }

            .image-gallery {
                position: relative;
                overflow: hidden;
            }

            .image-slide img {
                transition: transform 0.5s ease;
            }

            .image-gallery:hover .image-slide img {
                transform: scale(1.05);
            }

            .dropdown-menu-dark {
                backdrop-filter: blur(15px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.6);
                border: 1px solid rgba(255,255,255,0.1);
            }

            .text-info {
                text-shadow: 0 0 8px rgba(32, 201, 151, 0.4);
            }

            .btn-info {
                background: linear-gradient(135deg, #20c997, #17a2b8);
                border: none;
                box-shadow: 0 4px 15px rgba(32, 201, 151, 0.4);
            }

            .btn-info:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(32, 201, 151, 0.6);
            }

            /* Custom scrollbar */
            ::-webkit-scrollbar {
                width: 10px;
            }

            ::-webkit-scrollbar-track {
                background: #1a1a1a;
                border-radius: 10px;
            }

            ::-webkit-scrollbar-thumb {
                background: linear-gradient(135deg, #667eea, #764ba2);
                border-radius: 10px;
            }

            ::-webkit-scrollbar-thumb:hover {
                background: linear-gradient(135deg, #764ba2, #667eea);
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .post-card {
                    margin-bottom: 2rem;
                }

                .avatar-gradient {
                    width: 40px;
                    height: 40px;
                }

                .image-gallery img {
                    height: 250px !important;
                }
            }

            /* Loading animation */
            .post-card {
                opacity: 0;
                animation: fadeInUp 0.6s ease forwards;
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Stagger animation for multiple cards */
            .post-card:nth-child(1) {
                animation-delay: 0.1s;
            }
            .post-card:nth-child(2) {
                animation-delay: 0.2s;
            }
            .post-card:nth-child(3) {
                animation-delay: 0.3s;
            }
            .post-card:nth-child(4) {
                animation-delay: 0.4s;
            }
        </style>

        <div class="back-top"></div>
    </body>
    <%@include file="../include/footer.jsp" %>
</html>