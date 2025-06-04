<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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
            Main Title START -->
            <section class="py-0 pt-sm-5">
                <div class="container position-relative">
                    <!-- Title and button START -->
                    <div class="row mb-3">
                        <div class="col-12">
                            <!-- Meta -->
                            <div class="d-lg-flex justify-content-lg-between mb-1">
                                <!-- Title -->
                                <div class="mb-2 mb-lg-0">
                                    <h1 class="fs-2">${house.name}</h1>
                                    <!-- Location -->
                                    <p class="fw-bold mb-0"><i class="bi bi-geo-alt me-2"></i>${house.address}
                                        <a href="#" class="ms-2 text-decoration-underline" data-bs-toggle="modal" data-bs-target="#mapmodal">
                                            <i class="bi bi-eye-fill me-1"></i>View On Map
                                        </a>
                                    </p>
                                </div>

                                <!-- Buttons -->
                                <ul class="list-inline text-end">

                                    <!-- Share icon -->
                                    <li class="list-inline-item dropdown">
                                        <!-- Share button -->
                                        <a href="#" class="btn btn-sm btn-light px-2" role="button" id="dropdownShare" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="fa-solid fa-fw fa-share-alt"></i>
                                        </a>
                                        <!-- dropdown button -->
                                        <ul class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare">
                                            <li><a class="dropdown-item" href="#"><i class="fab fa-twitter-square me-2"></i>Twitter</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fab fa-facebook-square me-2"></i>Facebook</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fab fa-linkedin me-2"></i>LinkedIn</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fa-solid fa-copy me-2"></i>Copy link</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Title and button END -->


                </div>
            </section>
            <!-- =======================
            Main Title END -->

            <!-- =======================
            Image gallery START -->
            <section class="card-grid pt-0">
                <div class="container">
                    <c:if test="${not empty allRoomImages}">
                        <div class="row g-2">

                            <!-- Ảnh lớn đầu tiên -->
                            <c:set var="firstImage" value="${allRoomImages[0]}" />
                            <div class="col-md-6">
                                <a data-glightbox data-gallery="gallery" href="${pageContext.request.contextPath}${firstImage.imageUrl}">
                                    <div class="card card-grid-lg card-element-hover card-overlay-hover overflow-hidden"
                                         style="background-image:url('${pageContext.request.contextPath}${firstImage.imageUrl}'); background-position: center left; background-size: cover;">
                                        <div class="hover-element position-absolute w-100 h-100">
                                            <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <!-- Nhóm ảnh nhỏ bên phải -->
                            <div class="col-md-6">
                                <div class="row g-2">

                                    <!-- 2 ảnh tiếp theo -->
                                    <c:forEach var="image" items="${allRoomImages}" varStatus="loop">
                                        <c:if test="${loop.index == 1 || loop.index == 2}">
                                            <div class="${loop.index == 1 ? 'col-12' : 'col-md-6'}">
                                                <a data-glightbox data-gallery="gallery" href="${pageContext.request.contextPath}${image.imageUrl}">
                                                    <div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden"
                                                         style="background-image:url('${pageContext.request.contextPath}${image.imageUrl}'); background-position: center left; background-size: cover;">
                                                        <div class="hover-element position-absolute w-100 h-100">
                                                            <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                    <!-- Nếu còn ảnh dư thì View all -->
                                    <c:if test="${fn:length(allRoomImages) > 3}">
                                        <div class="col-md-6">
                                            <div class="card card-grid-sm overflow-hidden"
                                                 style="background-image:url('${pageContext.request.contextPath}${allRoomImages[3].imageUrl}'); background-position: center left; background-size: cover;">
                                                <div class="bg-overlay bg-dark opacity-7"></div>

                                                <!-- Các ảnh dư để mở bằng lightbox -->
                                                <c:forEach var="image" items="${allRoomImages}" varStatus="loop">
                                                    <c:if test="${loop.index > 3}">
                                                        <a data-glightbox data-gallery="gallery" href="${pageContext.request.contextPath}${image.imageUrl}"></a>
                                                    </c:if>
                                                </c:forEach>

                                                <div class="card-img-overlay d-flex h-100 w-100">
                                                    <h6 class="card-title m-auto fw-light text-decoration-underline">
                                                        <a href="javascript:void(0)" class="text-white">View all</a>
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                </div>
                            </div>

                        </div>
                    </c:if>
                </div>
            </section>

            <!-- =======================
            Image gallery END -->

            <!-- =======================
            About hotel START -->
            <section class="pt-0">
                <div class="container" data-sticky-container>

                    <div class="row g-4 g-xl-5">
                        <!-- Content START -->
                        <div class="col-xl-7 order-1">
                            <div class="vstack gap-5">

                                <!-- About hotel START -->
                                <div class="card bg-transparent">
                                    <!-- Card header -->
                                    <div class="card-header border-bottom bg-transparent px-0 pt-0">
                                        <h3 class="mb-0">Về phòng trọ</h3>
                                    </div>

                                    <!-- Card body START -->
                                    <div class="card-body pt-4 p-0">



                                        <p class="mb-0">${house.description}</p>


                                    </div>

                                    <!-- Card body END -->
                                </div>

                                <!-- About hotel START -->

                                <!-- Amenities START -->

                                <!-- Amenities END -->

                                <!-- Room START -->
                                <div class="card bg-transparent" id="room-options">
                                    <!-- Card header -->
                                    <div class="card-header border-bottom bg-transparent px-0 pt-0">
                                        <div class="d-sm-flex justify-content-sm-between align-items-center">
                                            <h3 class="mb-2 mb-sm-0">Room Options</h3>
                                        </div>
                                    </div>

                                    <!-- Card body START -->
                                    <div class="card-body pt-4 p-0">
                                        <div class="vstack gap-4">

                                            <!-- Room item START -->
                                            <c:forEach items="${rooms}" var="room">
                                                <div class="card shadow p-3">
                                                    <div class="row g-4">
                                                        <!-- Card img -->
                                                        <div class="col-md-5 position-relative">

                                                            <!-- Slider START -->
                                                            <div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2">
                                                                <div class="tiny-slider-inner" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
                                                                    <c:if test="${not empty roomImagesMap[room.id]}">
                                                                        <c:forEach var="image" items="${roomImagesMap[room.id]}">
                                                                            <div>
                                                                                <img src="${pageContext.request.contextPath}${image.imageUrl}" 
                                                                                     alt="Room image"
                                                                                     style="width: 233px; height: 175px; object-fit: contain; border-radius: 8px;" />
                                                                            </div>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                            <!-- Slider END -->

                                                            <!-- Button -->
                                                            <a href="#" class="btn btn-link text-decoration-underline p-0 mb-0 mt-1"
                                                               data-bs-toggle="modal" data-bs-target="#roomDetail_${room.id}">
                                                                <i class="bi bi-eye-fill me-1"></i>View more details
                                                            </a>
                                                        </div>

                                                        <!-- Card body -->
                                                        <div class="col-md-7">
                                                            <div class="card-body d-flex flex-column h-100 p-0">

                                                                <!-- Title -->
                                                                <h5 class="card-title"><a href="#">${room.title}</a></h5>
                                                                    <c:choose>
                                                                        <c:when test="${room.status eq 'available'}">
                                                                        <button class="btn btn-success">Có sẵn</button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button class="btn btn-danger">Không có sẵn</button>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <!-- Amenities -->
                                                                <ul class="nav nav-divider mb-2">
                                                                    <c:forEach var="amenity" items="${room.amenities}">
                                                                        <li class="nav-item">${amenity.name}</li>
                                                                        </c:forEach>
                                                                </ul>

                                                                <!-- Price and Button -->
                                                                <div class="d-sm-flex justify-content-sm-between align-items-center mt-auto">
                                                                    <div class="d-flex align-items-center">
                                                                        <h5 class="fw-bold mb-0 me-1">
                                                                            <fmt:formatNumber value="${room.price}" currencySymbol="₫" groupingUsed="true"/> VND/Tháng
                                                                        </h5>
                                                                    </div>
                                                                    <c:if test="${room.status eq 'available'}">
                                                                        <c:choose>
                                                                            <c:when test="${not empty USER}">
                                                                                <div class="mt-3 mt-sm-0">
                                                                                    <a href="#" class="btn btn-sm btn-primary mb-0"
                                                                                       data-bs-toggle="modal" data-bs-target="#bookingModal${room.id}">
                                                                                        Select Room
                                                                                    </a>
                                                                                </div>

                                                                            </c:when>

                                                                            <c:otherwise>
                                                                                <div class="mt-3 mt-sm-0">
                                                                                    <a href="${pageContext.request.contextPath}/login"
                                                                                       class="btn btn-sm btn-warning mb-0"
                                                                                       onclick="return confirm('Bạn cần đăng nhập để đặt phòng. Chuyển đến trang đăng nhập?');">
                                                                                        Đăng nhập để đặt phòng
                                                                                    </a>
                                                                                </div>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Room modal START -->
                                                <div class="modal fade" id="roomDetail_${room.id}" tabindex="-1" aria-labelledby="roomDetailLabel_${room.id}" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content p-0">
                                                            <div class="modal-header p-3">
                                                                <h5 class="modal-title mb-0" id="roomDetailLabel_${room.id}">Room detail</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>

                                                            <div class="modal-body p-0">
                                                                <div class="card bg-transparent p-3">
                                                                    <div class="tiny-slider arrow-round arrow-dark overflow-hidden rounded-2">
                                                                        <div class="tiny-slider-inner rounded-2 overflow-hidden" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
                                                                            <c:if test="${not empty roomImagesMap[room.id]}">
                                                                                <c:forEach var="image" items="${roomImagesMap[room.id]}">
                                                                                    <div>
                                                                                        <img src="${pageContext.request.contextPath}${image.imageUrl}" 
                                                                                             alt="Room image"
                                                                                             style="width: 468px; height: 351px; object-fit: cover; border-radius: 8px;" />
                                                                                    </div>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>

                                                                    <div class="card-header bg-transparent pb-0">
                                                                        <h3 class="card-title mb-0">${room.title}</h3>
                                                                    </div>

                                                                    <div class="card-body">
                                                                        <p>${room.description}</p>
                                                                        <div class="row">
                                                                            <h5 class="mb-0">Tiện nghi</h5>
                                                                            <hr>
                                                                            <c:forEach var="amenity" items="${room.amenities}">
                                                                                <li class="list-group-item d-flex mb-0">
                                                                                    <i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">${amenity.name}</span>
                                                                                </li>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="bookingModal${room.id}" tabindex="-1" aria-labelledby="bookingModalLabel${room.id}" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <!-- Header -->
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="bookingModalLabel${room.id}">Booking for Room ${room.title}</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <!-- Body -->
                                                            <div class="modal-body">
                                                                <form action="${pageContext.request.contextPath}/booking/createBooking" method="post">
                                                                    <input type="hidden" name="roomId" value="${room.id}" />

                                                                    <!-- Thông tin phòng -->
                                                                    <div class="mb-3">
                                                                        <h5>Thông tin phòng trọ</h5>
                                                                        <p><strong>Tiêu đề:</strong> ${room.title}</p>
                                                                        <p><strong>Mô tả:</strong> ${room.description}</p>
                                                                        <p><strong>Giá thuê:</strong> <fmt:formatNumber value="${room.price}"  currencySymbol="VNĐ" />  VNĐ/Tháng</p>
                                                                        <p><strong>Diện tích:</strong> ${room.area} m²</p>
                                                                        <p><strong>Tiện nghi:</strong> <c:forEach var="amenity" items="${room.amenities}">
                                                                            <li class="list-group-item d-flex mb-0">
                                                                                <i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">${amenity.name}</span>
                                                                            </li>
                                                                        </c:forEach></p>
                                                                    </div>

                                                                    <!-- Chọn ngày xem trọ -->
                                                                    <div class="mb-3">
                                                                        <label for="viewingDate" class="form-label">Chọn ngày xem trọ</label>
                                                                        <input type="datetime-local" name="viewingDate" class="form-control" required>
                                                                    </div>

                                                                    <!-- Thông tin người dùng -->
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Tên của bạn</label>
                                                                        <input type="text" class="form-control" value="${USER.fullName}" readonly>
                                                                    </div>

                                                                    <div class="mb-3">
                                                                        <label class="form-label">Số điện thoại</label>
                                                                        <input type="text" class="form-control" value="${USER.phoneNumber}" readonly>
                                                                    </div>

                                                                    <div class="text-end">
                                                                        <button type="submit" class="btn btn-primary">Xác nhận đặt lịch</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Room modal END -->
                                            </c:forEach>

                                            <!-- Map modal START -->
                                            <div class="modal fade" id="mapmodal" tabindex="-1" aria-labelledby="mapmodalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                                    <div class="modal-content">
                                                        <!-- Title -->
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="mapmodalLabel">View Our Hotel Location</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <!-- Map -->
                                                        <div class="modal-body p-0">
                                                            <iframe class="w-100" height="400"
                                                                    src="https://maps.google.com/maps?q=${house.address}&z=15&output=embed"
                                                                    style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                                                            </iframe>

                                                        </div>
                                                        <!-- Button -->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-sm btn-primary mb-0"><i class="bi fa-fw bi-pin-map-fill me-2"></i>View In Google Map</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <!-- Map modal END -->
                                        </div>
                                    </div>
                                    <!-- Card body END -->
                                </div>
                                <!-- Room END -->

                                <!-- Customer Review START -->
                                <div class="card bg-transparent">
                                    <!-- Card header -->
                                    <div class="card-header border-bottom bg-transparent px-0 pt-0">
                                        <h3 class="card-title mb-0">Customer Review</h3>
                                    </div>

                                    <!-- Card body START -->
                                    <div class="card-body pt-4 p-0">
                                        <!-- Progress bar and rating START -->
                                        <div class="card bg-light p-4 mb-4">
                                            <div class="row g-4 align-items-center">
                                                <!-- Rating info -->
                                                <div class="col-md-12">
                                                    <div class="text-center">
                                                        <!-- Điểm trung bình -->
                                                        <h2 class="mb-0">${averageRating} <i class="fa-solid fa-star text-warning"></i></h2>
                                                        <p class="mb-2">Based on ${totalReviews} Reviews</p>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Progress bar and rating END -->

                                        <!-- Leave review START -->
                                        <!--                                                                                <form action="/reviews/add" method="post" class="mb-5">
                                                                                                                             Truyền roomId và userId 
                                                                                                                            <input type="hidden" name="roomId" value="1">
                                                                                                                            <input type="hidden" name="userId" value="1">
                                                                                
                                                                                                                             Rating 
                                                                                                                            <div class="form-control-bg-light mb-3">
                                                                                                                                <select class="form-select js-choice" name="rating" required>
                                                                                                                                    <option value="5">⭐️⭐️⭐️⭐️⭐️ (5/5)</option>
                                                                                                                                    <option value="4">⭐️⭐️⭐️⭐️ (4/5)</option>
                                                                                                                                    <option value="3">⭐️⭐️⭐️ (3/5)</option>
                                                                                                                                    <option value="2">⭐️⭐️ (2/5)</option>
                                                                                                                                    <option value="1">⭐️ (1/5)</option>
                                                                                                                                </select>
                                                                                                                            </div>
                                                                                
                                                                                                                             Message 
                                                                                                                            <div class="form-control-bg-light mb-3">
                                                                                                                                <textarea class="form-control" name="comment" placeholder="Nhập đánh giá của bạn" rows="3"></textarea>
                                                                                                                            </div> 
                                                                                
                                                                                                                             Button 
                                                                                                                            <button type="submit" class="btn btn-lg btn-primary mb-0">
                                                                                                                                Gửi đánh giá <i class="bi fa-fw bi-arrow-right ms-2"></i>
                                                                                                                            </button>
                                                                                                                        </form>-->


                                        <%-- Hiển thị thông báo khi thêm đánh giá thành công --%>
                                        <c:if test="${not empty message}">
                                            <div class="alert alert-success">${message}</div>
                                        </c:if>
                                        <!-- Leave review END -->

                                        <!-- Review item START -->
                                        <c:forEach var="review" items="${reviews}">
                                            <div class="card border rounded-3 shadow-sm mb-5">
                                                <div class="card-body">
                                                    <div class="d-md-flex mb-3">
                                                        <!-- Avatar -->
                                                        <div class="avatar avatar-lg me-4 flex-shrink-0">
                                                            <img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/images/avatar/09.jpg" alt="avatar">
                                                        </div>

                                                        <!-- Review Content -->
                                                        <div class="flex-grow-1">
                                                            <div class="d-flex justify-content-between">
                                                                <div>
                                                                    <h5 class="mb-1">${review.user.fullName} (${review.user.email})</h5>
                                                                    <h6 class="text-muted mb-2">${review.room.title}: ${review.room.description}</h6>
                                                                    <ul class="nav nav-divider small mb-2">
                                                                        <li class="nav-item">
                                                                            <fmt:formatDate value="${review.createdAtDate}" pattern="dd/MM/yyyy HH:mm:ss" />
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <!-- Rating -->
                                                                <div class="icon-md rounded text-bg-warning text-center d-flex align-items-center justify-content-center fs-6">
                                                                    ${review.rating}
                                                                </div>
                                                            </div>

                                                            <!-- Comment -->
                                                            <p class="mb-3">${review.comment}</p>

                                                            <!-- Review Images -->
                                                            <div class="row g-3">
                                                                <div class="col-4 col-sm-3 col-lg-2">
                                                                    <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/07.jpg" class="img-fluid rounded" alt="">
                                                                </div>
                                                                <div class="col-4 col-sm-3 col-lg-2">
                                                                    <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/08.jpg" class="img-fluid rounded" alt="">
                                                                </div>
                                                                <div class="col-4 col-sm-3 col-lg-2">
                                                                    <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/05.jpg" class="img-fluid rounded" alt="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                    <!-- Card body END -->
                                </div>
                                <!-- Customer Review END -->

                            </div>	
                        </div>
                        <!-- Content END -->

                        <!-- Right side content START -->
                        <aside class="col-xl-5 order-xl-2">
                            <div data-sticky data-margin-top="100" data-sticky-for="1199">
                                <!-- Book now START -->
                                <div class="card card-body border">

                                    <!-- Title -->
                                    <div class="d-sm-flex justify-content-sm-between align-items-center mb-3">
                                        <div>
                                            <span>Thông tin của chủ trọ</span>
                                            <h4 class="card-title mb-0">Tên chủ sở hữu: ${house.profile.owner.fullName}</h4>
                                        </div>

                                    </div>		


                                    <p class="h6 fw-light mb-4"><i class="bi bi-arrow-right me-2"></i>Email: ${house.profile.owner.email}</p>

                                    <p class="h6 fw-light mb-4"><i class="bi bi-arrow-right me-2"></i>Số điện thoại: ${house.profile.owner.phoneNumber}</p>

                                    <!-- Button -->
                                    <div class="d-grid">
                                        <a href="#room-options" class="btn btn-lg btn-primary-soft mb-0">Liên hệ</a>
                                    </div>
                                </div>
                                <!-- Book now END -->

                            </div>	
                        </aside>
                        <!-- Right side content END -->
                    </div> <!-- Row END -->
                </div>
            </section>
            <!-- =======================
            About hotel END -->

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- =======================
    Footer START -->
        <%@include file="../include/footer.jsp" %>
        <!-- =======================
    Footer END -->



    </body>

    <!-- Mirrored from stackbros.in/bookinga/landing/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:02:22 GMT -->

</html>