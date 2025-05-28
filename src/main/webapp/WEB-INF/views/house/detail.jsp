<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
                    <div class="row g-2">
                        <!-- Image -->
                        <div class="col-md-6">
                            <a data-glightbox data-gallery="gallery" href="${pageContext.request.contextPath}/assets/images/gallery/14.jpg">
                                <div class="card card-grid-lg card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(${pageContext.request.contextPath}/assets/images/gallery/14.jpg); background-position: center left; background-size: cover;">
                                    <!-- Card hover element -->
                                    <div class="hover-element position-absolute w-100 h-100">
                                        <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="col-md-6">
                            <!-- Card item START -->
                            <div class="row g-2"> 
                                <!-- Image -->
                                <div class="col-12">
                                    <a data-glightbox data-gallery="gallery" href="${pageContext.request.contextPath}/assets/images/gallery/13.jpg">
                                        <div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(${pageContext.request.contextPath}/assets/images/gallery/13.jpg); background-position: center left; background-size: cover;">
                                            <!-- Card hover element -->
                                            <div class="hover-element position-absolute w-100 h-100">
                                                <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                            </div>
                                        </div>
                                    </a>	
                                </div>

                                <!-- Image -->
                                <div class="col-md-6">
                                    <a data-glightbox data-gallery="gallery" href="${pageContext.request.contextPath}/assets/images/gallery/12.jpg">
                                        <div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(${pageContext.request.contextPath}/assets/images/gallery/12.jpg); background-position: center left; background-size: cover;">
                                            <!-- Card hover element -->
                                            <div class="hover-element position-absolute w-100 h-100">
                                                <i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
                                            </div>
                                        </div>
                                    </a>	
                                </div>

                                <!-- Images -->
                                <div class="col-md-6">
                                    <div class="card card-grid-sm overflow-hidden" style="background-image:url(${pageContext.request.contextPath}/assets/images/gallery/11.jpg); background-position: center left; background-size: cover;">
                                        <!-- Background overlay -->
                                        <div class="bg-overlay bg-dark opacity-7"></div>

                                        <!-- Popup Images -->
                                        <a data-glightbox="" data-gallery="gallery" href="${pageContext.request.contextPath}/assets/images/gallery/11.jpg" class="stretched-link z-index-9"></a>
                                        <a data-glightbox="" data-gallery="gallery" href="${pageContext.request.contextPath}/assets/images/gallery/15.jpg"></a>
                                        <a data-glightbox="" data-gallery="gallery" href="${pageContext.request.contextPath}/assets/images/gallery/16.jpg"></a>

                                        <!-- Overlay text -->
                                        <div class="card-img-overlay d-flex h-100 w-100">
                                            <h6 class="card-title m-auto fw-light text-decoration-underline"><a href="#" class="text-white">View all</a></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card item END -->
                        </div>
                    </div>
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
                                                                    <!-- Image item -->
                                                                    <c:if test="${not empty roomImagesMap[room.id]}">
                                                                        <c:forEach var="image" items="${roomImagesMap[room.id]}">
                                                                            <div>
                                                                                <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/04.jpg" alt="Card image">
                                                                            </div>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                            <!-- Slider END -->

                                                            <!-- Button -->
                                                            <a href="#" class="btn btn-link text-decoration-underline p-0 mb-0 mt-1" data-bs-toggle="modal" data-bs-target="#roomDetail"><i class="bi bi-eye-fill me-1"></i>View more details</a>
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
                                                                    <!-- Button -->
                                                                    <div class="d-flex align-items-center">
                                                                        <h5 class="fw-bold mb-0 me-1"> <fmt:formatNumber value="${room.price}" currencySymbol="₫" groupingUsed="true"/> VND/Tháng</h5>
                                                                    </div>

                                                                    <!-- Price -->
                                                                    <c:if test="${room.status eq 'available'}">
                                                                        <div class="mt-3 mt-sm-0">
                                                                            <a href="#" class="btn btn-sm btn-primary mb-0">Select Room</a>    
                                                                        </div>            
                                                                    </c:if>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Room modal START -->
                                                <div class="modal fade" id="roomDetail" tabindex="-1" aria-labelledby="roomDetailLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content p-0">

                                                            <!-- Title -->
                                                            <div class="modal-header p-3">
                                                                <h5 class="modal-title mb-0" id="roomDetailLabel">Room detail</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>

                                                            <!-- Modal body -->
                                                            <div class="modal-body p-0">
                                                                <!-- Card START -->
                                                                <div class="card bg-transparent p-3">
                                                                    <!-- Slider START -->
                                                                    <div class="tiny-slider arrow-round arrow-dark overflow-hidden rounded-2">
                                                                        <div class="tiny-slider-inner rounded-2 overflow-hidden" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
                                                                            <!-- Image item -->
                                                                            <c:if test="${not empty roomImagesMap[room.id]}">
                                                                                <c:forEach var="image" items="${roomImagesMap[room.id]}">
                                                                                    <div>
                                                                                        <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/04.jpg" alt="Card image">
                                                                                    </div>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <!-- Slider END -->

                                                                    <!-- Card header -->
                                                                    <div class="card-header bg-transparent pb-0">
                                                                        <h3 class="card-title mb-0">${room.title}</h3>
                                                                    </div>

                                                                    <!-- Card body START -->
                                                                    <div class="card-body">
                                                                        <!-- Content -->
                                                                        <p>${room.description}</p>
                                                                        <div class="row">
                                                                            <h5 class="mb-0">Tiện nghi</h5>

                                                                            <!-- List -->
                                                                            <hr>
                                                                            <li class="list-group-item d-flex mb-0">
                                                                                <i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">${room.amenities}</span>
                                                                            </li>
                                                                        </div> <!-- Row END -->
                                                                    </div>
                                                                    <!-- Card body END -->
                                                                </div>
                                                                <!-- Card END -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Room item END -->
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
                                                            <iframe class="w-100" height="400" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.9663095343008!2d-74.00425878428698!3d40.74076684379132!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259bf5c1654f3%3A0xc80f9cfce5383d5d!2sGoogle!5e0!3m2!1sen!2sin!4v1586000412513!5m2!1sen!2sin"  style="border:0;" aria-hidden="false" tabindex="0"></iframe>	
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
                                        <h3 class="card-title mb-0">Customer Review1</h3>
                                    </div>

                                    <!-- Card body START -->
                                    <div class="card-body pt-4 p-0">
                                        <!-- Progress bar and rating START -->
                                        <div class="card bg-light p-4 mb-4">
                                            <div class="row g-4 align-items-center">
                                                <!-- Rating info -->
                                                <div class="col-md-4">
                                                    <div class="text-center">
                                                        <!-- Điểm trung bình -->
                                                        <h2 class="mb-0">${averageRating}</h2>
                                                        <p class="mb-2">Based on ${totalReviews} Reviews</p>

                                                        <!-- Hiển thị sao -->
                                                        <ul class="list-inline mb-0">
                                                            <!-- Sao đầy -->
                                                            <c:forEach var="i" begin="1" end="${fullStars}">
                                                                <li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
                                                                </c:forEach>

                                                            <!-- Sao nửa -->
                                                            <c:if test="${halfStar}">
                                                                <li class="list-inline-item me-0"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
                                                                </c:if>

                                                            <!-- Sao trống -->
                                                            <c:forEach var="i" begin="1" end="${emptyStars}">
                                                                <li class="list-inline-item me-0"><i class="fa-regular fa-star text-warning"></i></li>
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>



                                                <!-- Progress-bar START -->
                                                <div class="col-md-8">
                                                    <div class="card-body p-0">
                                                        <div class="row gx-3 g-2 align-items-center">
                                                            <!-- Progress bar and Rating -->
                                                            <div class="col-9 col-sm-10">
                                                                <!-- Progress item -->
                                                                <div class="progress progress-sm bg-warning bg-opacity-15">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Percentage -->
                                                            <div class="col-3 col-sm-2 text-end">
                                                                <span class="h6 fw-light mb-0">85%</span>
                                                            </div>

                                                            <!-- Progress bar and Rating -->
                                                            <div class="col-9 col-sm-10">
                                                                <!-- Progress item -->
                                                                <div class="progress progress-sm bg-warning bg-opacity-15">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Percentage -->
                                                            <div class="col-3 col-sm-2 text-end">
                                                                <span class="h6 fw-light mb-0">75%</span>
                                                            </div>

                                                            <!-- Progress bar and Rating -->
                                                            <div class="col-9 col-sm-10">
                                                                <!-- Progress item -->
                                                                <div class="progress progress-sm bg-warning bg-opacity-15">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Percentage -->
                                                            <div class="col-3 col-sm-2 text-end">
                                                                <span class="h6 fw-light mb-0">60%</span>
                                                            </div>

                                                            <!-- Progress bar and Rating -->
                                                            <div class="col-9 col-sm-10">
                                                                <!-- Progress item -->
                                                                <div class="progress progress-sm bg-warning bg-opacity-15">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Percentage -->
                                                            <div class="col-3 col-sm-2 text-end">
                                                                <span class="h6 fw-light mb-0">35%</span>
                                                            </div>

                                                            <!-- Progress bar and Rating -->
                                                            <div class="col-9 col-sm-10">
                                                                <!-- Progress item -->
                                                                <div class="progress progress-sm bg-warning bg-opacity-15">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Percentage -->
                                                            <div class="col-3 col-sm-2 text-end">
                                                                <span class="h6 fw-light mb-0">15%</span>
                                                            </div>
                                                        </div> <!-- Row END -->
                                                    </div>
                                                </div>
                                                <!-- Progress-bar END -->
                                            </div>
                                        </div>
                                        <!-- Progress bar and rating END -->

                                        <!-- Leave review START -->
                                        <!--                                        <form action="/reviews/add" method="post" class="mb-5">
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
                                            <hr>
                                            <div class="d-md-flex my-4">
                                                <!-- Avatar -->
                                                <div class="avatar avatar-lg me-3 flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/images/avatar/09.jpg" alt="avatar">
                                                </div>
                                                <!-- Text -->
                                                <div>
                                                    <div class="d-flex justify-content-between mt-1 mt-md-0">
                                                        <div>

                                                            <h5 class="me-3 mb-0">${review.user.fullName} (${review.user.email})</h5>
                                                            <h6 class="me-3 mb-0">${review.room.title}: ${review.room.description}</h6>
                                                            <!-- Info -->
                                                            <ul class="nav nav-divider small mb-2">
                                                                <li class="nav-item"><fmt:formatDate value="${review.createdAtDate}" pattern="dd/MM/yyyy HH:mm:ss" /></li>

                                                            </ul>
                                                        </div>
                                                        <!-- Review star -->
                                                        <div class="icon-md rounded text-bg-warning fs-6">${review.rating}</div>
                                                    </div>

                                                    <p class="mb-2">${review.comment}</p>

                                                    <!-- Images -->
                                                    <div class="row g-4">
                                                        <div class="col-4 col-sm-3 col-lg-2">
                                                            <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/07.jpg" class="rounded" alt="">
                                                        </div>
                                                        <div class="col-4 col-sm-3 col-lg-2">
                                                            <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/08.jpg" class="rounded" alt="">
                                                        </div>
                                                        <div class="col-4 col-sm-3 col-lg-2">
                                                            <img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/05.jpg" class="rounded" alt="">
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