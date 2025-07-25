<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <%@include file="../include/head.jsp" %>

    <body class="has-navbar-mobile">
        <!-- Header START -->
        <%@include file="../include/header.jsp" %>
        <!-- Header END -->

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Banner START -->
            <section class="pt-0">
                <div class="container">
                    <!-- Background image -->
                    <div class="rounded-3 p-3 p-sm-5" style="background-image: url(${pageContext.request.contextPath}/assets/images/bg/05.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
                        <!-- Banner title -->
                        <div class="row my-2 my-xl-5"> 
                            <div class="col-md-8 mx-auto"> 
                                <h1 class="text-center text-white">Danh sách trọ</h1>
                            </div>
                        </div>


                    </div>
                </div>
            </section>
            <!-- =======================
            Main Banner END -->

            <!-- =======================
            Hotel list START -->
            <section class="pt-0">
                <div class="container">


                    <div class="row">
                        <!-- Left sidebar START -->
                        <%@include file="house.include/search.jsp" %>
                        <!-- Left sidebar END -->

                        <!-- Main content START -->
                        <div class="col-xl-8 col-xxl-9">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div>
                                    <h4 class="mb-1">Tìm thấy <span class="text-primary">${houses.size()}</span> nhà trọ</h4>
                                    <p class="text-muted small mb-0"><i class="bi bi-geo-alt me-1"></i>Hiển thị kết quả phù hợp nhất</p>
                                </div>
                                <div class="d-flex gap-2">
                                    <!-- View toggle -->
                                    <div class="btn-group btn-group-sm" role="group">
                                        <button type="button" class="btn btn-outline-secondary active">
                                            <i class="bi bi-grid-3x2"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-secondary">
                                            <i class="bi bi-list"></i>
                                        </button>
                                    </div>

                                    <!-- Sort dropdown -->
                                    <div class="dropdown">
                                        <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                            <i class="bi bi-sort-down me-1"></i>Sắp xếp
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-arrow-up me-2"></i>Giá thấp đến cao</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-arrow-down me-2"></i>Giá cao đến thấp</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-star me-2"></i>Đánh giá cao nhất</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-clock me-2"></i>Mới nhất</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="vstack gap-4">

                                <!-- Card item START -->
                                <c:choose>
                                    <c:when test="${not empty housesResult}">
                                        <c:forEach items="${housesResult}" var="house">
                                            <div class="card shadow-sm border-0 h-100 position-relative overflow-hidden" style="transition: all 0.3s ease;">
                                                <!-- Hover overlay -->
                                                <div class="position-absolute top-0 start-0 w-100 h-100 bg-primary opacity-0 transition-all" style="z-index: 1; pointer-events: none;"></div>

                                                <div class="row g-0">
                                                    <!-- Card img -->
                                                    <div class="col-md-5 position-relative">
                                                        <!-- Status badge -->
                                                        <div class="position-absolute top-0 end-0 m-3" style="z-index: 3;">
                                                            <c:choose>
                                                                <c:when test="${status.index % 3 == 0}">
                                                                    <span class="badge bg-success">
                                                                        <i class="bi bi-check-circle me-1"></i>Còn phòng
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${status.index % 3 == 1}">
                                                                    <span class="badge bg-warning text-dark">
                                                                        <i class="bi bi-exclamation-triangle me-1"></i>Sắp hết
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-danger">
                                                                        <i class="bi bi-x-circle me-1"></i>Hết phòng
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>

                                                        <!-- Image count badge -->
                                                        <div class="position-absolute bottom-0 start-0 m-3" style="z-index: 3;">
                                                            <span class="badge bg-dark bg-opacity-75">
                                                                <i class="bi bi-images me-1"></i>${(status.index % 5) + 5} ảnh
                                                            </span>
                                                        </div>

                                                        <!-- Slider START -->
                                                        <div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-start h-100">
                                                            <div class="tiny-slider-inner h-100" data-autoplay="false" data-arrow="true" data-dots="false" data-items="1">
                                                                <!-- Image items với placeholder đẹp hơn -->
                                                                <div class="h-100">
                                                                    <img src="https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=400&h=300&fit=crop&auto=format" 
                                                                         alt="Card image" class="w-100 h-100" style="object-fit: cover;">
                                                                </div>
                                                                <div class="h-100">
                                                                    <img src="https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400&h=300&fit=crop&auto=format" 
                                                                         alt="Card image" class="w-100 h-100" style="object-fit: cover;">
                                                                </div>
                                                                <div class="h-100">
                                                                    <img src="https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=400&h=300&fit=crop&auto=format" 
                                                                         alt="Card image" class="w-100 h-100" style="object-fit: cover;">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Slider END -->
                                                    </div>

                                                    <!-- Card body -->
                                                    <div class="col-md-7">
                                                        <div class="card-body py-md-3 d-flex flex-column h-100 position-relative" style="z-index: 2;">

                                                            <!-- Rating và Favorite -->
                                                            <div class="d-flex justify-content-between align-items-start mb-2">
                                                                <div class="d-flex align-items-center">
                                                                    <c:set var="ratingInfo" value="${houseRatings[house.id]}" />
                                                                    <c:set var="averageRating" value="${ratingInfo.average}" />
                                                                    <c:set var="totalReviews" value="${ratingInfo.total}" />

                                                                    <span class="badge bg-warning text-dark me-2 fw-bold">${averageRating}</span>

                                                                    <div class="text-warning me-2">
                                                                        <c:forEach begin="1" end="5" var="i">
                                                                            <c:choose>
                                                                                <c:when test="${i <= averageRating}">
                                                                                    <i class="fa-solid fa-star"></i>
                                                                                </c:when>
                                                                                <c:when test="${i - 0.5 <= averageRating}">
                                                                                    <i class="fa-solid fa-star-half-stroke"></i>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <i class="fa-regular fa-star"></i>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </div>

                                                                    <small class="text-muted">(${totalReviews} đánh giá)</small>
                                                                </div>

                                                                <button class="btn btn-link p-0 text-secondary fs-5" onclick="toggleFavorite(this)">
                                                                    <i class="${status.index % 4 == 0 ? 'bi bi-heart-fill text-danger' : 'bi bi-heart'}"></i>
                                                                </button>
                                                            </div>

                                                            <!-- Title -->
                                                            <h5 class="card-title mb-2">
                                                                <a href="/boarding-house/${house.id}" class="text-decoration-none text-white stretched-link">${house.name}</a>
                                                            </h5>

                                                            <!-- Address -->
                                                            <div class="mb-3">
                                                                <small class="text-muted">
                                                                    <i class="bi bi-geo-alt me-1 text-primary"></i>${house.address}
                                                                </small>
                                                                <div class="mt-1">
                                                                    <small class="text-success">
                                                                        <i class="bi bi-geo me-1"></i>Cách trung tâm ${(status.index % 10) + 1} km
                                                                    </small>
                                                                </div>
                                                            </div>

                                                            <!-- Amenities -->
                                                            <div class="mb-3">
                                                                <div class="d-flex flex-wrap gap-1">
                                                                    <span class="badge bg-light text-dark border">
                                                                        <i class="bi bi-wifi me-1"></i>Wifi
                                                                    </span>
                                                                    <span class="badge bg-light text-dark border">
                                                                        <i class="bi bi-snow me-1"></i>Điều hòa
                                                                    </span>
                                                                    <span class="badge bg-light text-dark border">
                                                                        <i class="bi bi-house-door me-1"></i>Bếp
                                                                    </span>
                                                                    <c:if test="${status.index % 3 == 0}">
                                                                        <span class="badge bg-light text-dark border">
                                                                            <i class="bi bi-car-front me-1"></i>Chỗ đậu xe
                                                                        </span>
                                                                    </c:if>
                                                                    <span class="badge bg-light text-primary border border-primary">+3</span>
                                                                </div>
                                                            </div>

                                                            <!-- Special offers -->
                                                            <c:if test="${status.index % 5 == 0}">
                                                                <div class="mb-3">
                                                                    <div class="alert alert-success py-2 mb-0 small">
                                                                        <i class="bi bi-gift me-1"></i>
                                                                        <strong>Ưu đãi đặc biệt:</strong> Miễn phí tháng đầu khi thuê từ 6 tháng
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                            <!-- Price and Button -->
                                                            <div class="mt-auto">
                                                                <div class="d-flex justify-content-between align-items-center">
                                                                    <div>
                                                                        <div class="d-flex align-items-baseline mb-1">
                                                                            <h5 class="text-primary mb-0 fw-bold">${((status.index % 3) + 2)}.${(status.index % 9) + 1} triệu</h5>
                                                                            <small class="text-muted ms-1">/tháng</small>
                                                                            <c:if test="${status.index % 4 == 0}">
                                                                                <small class="text-decoration-line-through text-muted ms-2">${((status.index % 3) + 2)}.${(status.index % 9) + 5} triệu</small>
                                                                            </c:if>
                                                                        </div>
                                                                        <small class="text-success">
                                                                            <i class="bi bi-shield-check me-1"></i>Có thể đặt cọc online
                                                                        </small>
                                                                    </div>

                                                                    <div class="d-flex gap-2">
                                                                        <button class="btn btn-outline-primary btn-sm" onclick="event.preventDefault(); quickContact('${house.name}')">
                                                                            <i class="bi bi-telephone"></i>
                                                                        </button>
                                                                        <a href="/boarding-house/${house.id}" class="btn btn-primary btn-sm px-3 position-relative" style="z-index: 3;">
                                                                            Xem chi tiết
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-warning text-center">
                                            <strong>Không tìm thấy nhà trọ nào phù hợp!</strong>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Card item END -->
                                <!-- Pagination -->
                                <nav class="d-flex justify-content-center" aria-label="navigation">
                                    <ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
                                        <li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fa-solid fa-angle-left"></i></a></li>
                                        <li class="page-item mb-0"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item mb-0 active"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item mb-0"><a class="page-link" href="#">..</a></li>
                                        <li class="page-item mb-0"><a class="page-link" href="#">6</a></li>
                                        <li class="page-item mb-0"><a class="page-link" href="#"><i class="fa-solid fa-angle-right"></i></a></li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                        <!-- Main content END -->
                    </div> <!-- Row END -->
                </div>
            </section>
            <!-- =======================
            Hotel list END -->

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- =======================
Footer START -->
        <%@include file="../include/footer.jsp" %>
    </body>
    <script>
        document.querySelectorAll('input[name="minPrice"]').forEach(radio => {
            radio.addEventListener('change', function () {
                document.getElementById('maxPrice').value = this.getAttribute('data-max');
            });
        });

    </script>
    <!-- Mirrored from stackbros.in/bookinga/landing/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:02:22 GMT -->

</html>