<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

    <%@include file="include/head.jsp" %>

    <body class="has-navbar-mobile">
        <!-- Header START -->
        <%@include file="include/header.jsp" %>
        <!-- Header END -->

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
Hero Banner START -->
            <section class="pt-4 pt-lg-5 pb-5 mb-4">
                <div class="container">
                    <!-- Hero Content START -->
                    <div class="row g-4 g-lg-5 align-items-center">
                        <!-- Content -->
                        <div class="col-lg-6 position-relative mb-4 mb-md-0">
                            <!-- Badge -->
                            <span class="badge bg-success bg-opacity-10 text-success rounded-pill px-3 py-2 mb-3">
                                <i class="bi bi-star-fill me-1"></i>
                                Tin cậy #1 tại Đà Nẵng
                            </span>

                            <!-- Title -->
                            <h1 class="mb-4 display-4 fw-bold">
                                Tìm nhà trọ 
                                <span class="text-primary position-relative">
                                    gần đây
                                    <span class="position-absolute top-50 start-50 translate-middle z-index-n1 text-primary opacity-15">
                                        <svg width="182.25" height="23.73" viewBox="0 0 182.25 23.73">
                                        <path class="fill-primary opacity-5" d="M3.76.32L.24 2.64c-.21.14-.21.46 0 .6L3.76 5.56c.21.14.56.11.77-.03.21-.14.28-.39.16-.6L1.02 3.24l3.67-1.69c.21-.1.35-.3.35-.53s-.14-.43-.35-.53L.24.77C.03.67-.14.85.08.96L3.76.32z"/>
                                        </svg>
                                    </span>
                                </span>
                            </h1>

                            <!-- Description -->
                            <p class="mb-4 lead text-secondary">
                                Chúng tôi mang đến cho bạn không chỉ một chỗ trọ, mà còn một trải nghiệm hoàn hảo để tìm được nơi ở lý tưởng với mức giá phù hợp.
                            </p>

                            <!-- Features List -->
                            <div class="row g-3 mb-4">
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-md bg-success bg-opacity-10 text-success rounded-circle flex-shrink-0 me-2">
                                            <i class="bi bi-check-lg"></i>
                                        </div>
                                        <span class="fw-semibold">Giá cả minh bạch</span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-md bg-success bg-opacity-10 text-success rounded-circle flex-shrink-0 me-2">
                                            <i class="bi bi-check-lg"></i>
                                        </div>
                                        <span class="fw-semibold">Hỗ trợ 24/7</span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-md bg-success bg-opacity-10 text-success rounded-circle flex-shrink-0 me-2">
                                            <i class="bi bi-check-lg"></i>
                                        </div>
                                        <span class="fw-semibold">Xác minh chủ nhà</span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-md bg-success bg-opacity-10 text-success rounded-circle flex-shrink-0 me-2">
                                            <i class="bi bi-check-lg"></i>
                                        </div>
                                        <span class="fw-semibold">Dễ dàng đặt phòng</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex gap-3 flex-wrap">
                                <a href="#timtro" class="btn btn-primary btn-lg px-4">
                                    <i class="bi bi-search me-2"></i>
                                    Tìm ngay
                                </a>
                                <a href="#about" class="btn btn-outline-primary btn-lg px-4">
                                    Tìm hiểu thêm
                                </a>
                            </div>
                        </div>

                        <!-- Image -->
                        <div class="col-lg-6 position-relative">
                            <div class="position-relative">
                                <!-- Main Image -->
                                <img src="assets/images/bg/06.jpg" class="rounded-3 shadow-lg" alt="Nhà trọ Đà Nẵng">

                                <!-- Floating Card 1 - Support -->
                                <div class="position-absolute top-0 end-0 mt-n3 me-n3 z-index-2">
                                    <div class="card border-0 shadow-sm">
                                        <div class="card-body text-center p-3">
                                            <div class="icon-md bg-primary bg-opacity-10 text-primary rounded-circle mx-auto mb-2">
                                                <i class="bi bi-headset"></i>
                                            </div>
                                            <h6 class="mb-0 fw-bold">24/7</h6>
                                            <small class="text-muted">Hỗ trợ khách hàng</small>
                                        </div>
                                    </div>
                                </div>

                                <!-- Floating Card 2 - Rating -->
                                <div class="position-absolute bottom-0 start-0 mb-n3 ms-n3 z-index-2">
                                    <div class="card border-0 shadow-sm">
                                        <div class="card-body p-3">
                                            <div class="d-flex align-items-center">
                                                <div class="me-3">
                                                    <div class="d-flex text-warning mb-1">
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-fill"></i>
                                                        <i class="bi bi-star-fill"></i>
                                                    </div>
                                                    <small class="text-muted">500+ đánh giá</small>
                                                </div>
                                                <div>
                                                    <h6 class="mb-0 fw-bold">4.9</h6>
                                                    <small class="text-muted">Tuyệt vời</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Background decoration -->
                                <div class="position-absolute top-50 start-50 translate-middle z-index-n1">
                                    <div class="bg-primary opacity-10 rounded-circle" style="width: 300px; height: 300px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hero Content END -->
                </div>
            </section>
            <!-- =======================
Hero Banner END -->

            <!-- =======================
Search Form START -->

            <!-- =======================
Search Form END -->

            <!-- =======================
Statistics START -->
            <section class="py-5 mb-4">
                <div class="container">
                    <div class="row g-4 text-center">
                        <div class="col-sm-6 col-lg-3">
                            <div class="card border-0 bg-light h-100">
                                <div class="card-body p-4">
                                    <div class="icon-xl bg-primary bg-opacity-10 text-primary rounded-circle mx-auto mb-3">
                                        <i class="bi bi-house-fill"></i>
                                    </div>
                                    <h3 class="mb-1 text-primary">1000+</h3>
                                    <p class="mb-0">Nhà trọ có sẵn</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="card border-0 bg-light h-100">
                                <div class="card-body p-4">
                                    <div class="icon-xl bg-success bg-opacity-10 text-success rounded-circle mx-auto mb-3">
                                        <i class="bi bi-people-fill"></i>
                                    </div>
                                    <h3 class="mb-1 text-success">5000+</h3>
                                    <p class="mb-0">Khách hàng hài lòng</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="card border-0 bg-light h-100">
                                <div class="card-body p-4">
                                    <div class="icon-xl bg-warning bg-opacity-10 text-warning rounded-circle mx-auto mb-3">
                                        <i class="bi bi-star-fill"></i>
                                    </div>
                                    <h3 class="mb-1 text-warning">4.9</h3>
                                    <p class="mb-0">Đánh giá trung bình</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="card border-0 bg-light h-100">
                                <div class="card-body p-4">
                                    <div class="icon-xl bg-info bg-opacity-10 text-info rounded-circle mx-auto mb-3">
                                        <i class="bi bi-clock-fill"></i>
                                    </div>
                                    <h3 class="mb-1 text-info">24/7</h3>
                                    <p class="mb-0">Hỗ trợ khách hàng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- =======================
Statistics END -->

            <!-- =======================
Features START -->
            <section class="py-5 mb-4" id="about">
                <div class="container">
                    <!-- Title -->
                    <div class="row mb-5">
                        <div class="col-lg-8 mx-auto text-center">
                            <h2 class="mb-3">Tại sao chọn chúng tôi?</h2>
                            <p class="lead text-secondary">Chúng tôi cam kết mang đến trải nghiệm tìm kiếm và thuê nhà trọ tốt nhất tại Đà Nẵng</p>
                        </div>
                    </div>

                    <div class="row g-4 g-lg-5">
                        <!-- Feature 1 -->
                        <div class="col-lg-4">
                            <div class="text-center">
                                <div class="icon-xl bg-primary bg-opacity-10 text-primary rounded-circle mx-auto mb-4">
                                    <i class="bi bi-shield-check"></i>
                                </div>
                                <h5 class="mb-3">Uy tín & Tin cậy</h5>
                                <p class="text-secondary">Tất cả thông tin nhà trọ đều được xác minh kỹ lưỡng, đảm bảo độ chính xác và minh bạch.</p>
                            </div>
                        </div>

                        <!-- Feature 2 -->
                        <div class="col-lg-4">
                            <div class="text-center">
                                <div class="icon-xl bg-success bg-opacity-10 text-success rounded-circle mx-auto mb-4">
                                    <i class="bi bi-lightning"></i>
                                </div>
                                <h5 class="mb-3">Nhanh chóng & Tiện lợi</h5>
                                <p class="text-secondary">Tìm kiếm và đặt phòng chỉ trong vài click, tiết kiệm thời gian và công sức của bạn.</p>
                            </div>
                        </div>

                        <!-- Feature 3 -->
                        <div class="col-lg-4">
                            <div class="text-center">
                                <div class="icon-xl bg-warning bg-opacity-10 text-warning rounded-circle mx-auto mb-4">
                                    <i class="bi bi-headset"></i>
                                </div>
                                <h5 class="mb-3">Hỗ trợ 24/7</h5>
                                <p class="text-secondary">Đội ngũ chăm sóc khách hàng luôn sẵn sàng hỗ trợ bạn mọi lúc, mọi nơi.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- =======================
Features END -->

            <!-- =======================
Popular Areas START -->
            <section class="py-5 mb-4">
                <div class="container">
                    <!-- Title -->
                    <div class="row mb-4">
                        <div class="col-12 text-center">
                            <h2 class="mb-3">Khu vực phổ biến</h2>
                            <p class="text-secondary">Khám phá các khu vực có nhiều nhà trọ chất lượng nhất tại Đà Nẵng</p>
                        </div>
                    </div>

                    <div class="row g-4">
                        <!-- Area Cards -->
                        <c:forEach items="${houses}" var="house" varStatus="status">
                            <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                                <div class="card border-0 bg-light text-center h-100 position-relative overflow-hidden">
                                    <!-- Background Image -->
                                    <div class="position-absolute top-0 start-0 w-100 h-100">
                                        <img src="assets/images/category/hotel/nearby/0${(status.index % 6) + 1}.jpg" 
                                             class="w-100 h-100 object-fit-cover opacity-25" alt="${house.name}">
                                    </div>

                                    <!-- Content -->
                                    <div class="card-body p-3 position-relative z-index-2">
                                        <div class="icon-md bg-white bg-opacity-90 rounded-circle mx-auto mb-2">
                                            <i class="bi bi-geo-alt text-primary"></i>
                                        </div>
                                        <h5 class="card-title mb-1">
                                            <a href="#" class="stretched-link text-decoration-none">${house.name}</a>

                                        </h5>
                                        <h6 class="card-title mb-1">
                                            <a href="#" class="stretched-link text-decoration-none">${house.address}</a>

                                        </h6>
                                        <small class="text-muted">50+ nhà trọ</small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- =======================
Popular Areas END -->

            <!-- =======================
How It Works START -->
            <section class="py-5 mb-4">
                <div class="container">
                    <!-- Title -->
                    <div class="row mb-5">
                        <div class="col-lg-8 mx-auto text-center">
                            <h2 class="mb-3">Quy trình đơn giản</h2>
                            <p class="lead text-secondary">Chỉ 3 bước đơn giản để tìm được nhà trọ ưng ý</p>
                        </div>
                    </div>

                    <div class="row g-4 g-lg-5">
                        <!-- Step 1 -->
                        <div class="col-lg-4">
                            <div class="text-center position-relative">
                                <div class="position-relative">
                                    <div class="icon-xl bg-primary text-white rounded-circle mx-auto mb-4 position-relative z-index-2">
                                        <span class="fs-3 fw-bold">1</span>
                                    </div>
                                    <!-- Connector line -->
                                    <div class="position-absolute top-50 start-100 translate-middle-y d-none d-lg-block" style="width: 100px; height: 2px; background: linear-gradient(to right, #0d6efd, transparent);"></div>
                                </div>
                                <h5 class="mb-3">Tìm kiếm</h5>
                                <p class="text-secondary">Nhập khu vực, mức giá và yêu cầu của bạn để tìm kiếm nhà trọ phù hợp.</p>
                            </div>
                        </div>

                        <!-- Step 2 -->
                        <div class="col-lg-4">
                            <div class="text-center position-relative">
                                <div class="position-relative">
                                    <div class="icon-xl bg-success text-white rounded-circle mx-auto mb-4 position-relative z-index-2">
                                        <span class="fs-3 fw-bold">2</span>
                                    </div>
                                    <!-- Connector line -->
                                    <div class="position-absolute top-50 start-100 translate-middle-y d-none d-lg-block" style="width: 100px; height: 2px; background: linear-gradient(to right, #198754, transparent);"></div>
                                </div>
                                <h5 class="mb-3">Xem & So sánh</h5>
                                <p class="text-secondary">Xem chi tiết thông tin, hình ảnh và so sánh giá cả của các nhà trọ.</p>
                            </div>
                        </div>

                        <!-- Step 3 -->
                        <div class="col-lg-4">
                            <div class="text-center">
                                <div class="icon-xl bg-warning text-white rounded-circle mx-auto mb-4">
                                    <span class="fs-3 fw-bold">3</span>
                                </div>
                                <h5 class="mb-3">Đặt phòng</h5>
                                <p class="text-secondary">Liên hệ trực tiếp với chủ nhà hoặc đặt phòng online một cách nhanh chóng.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- =======================
How It Works END -->

            <!-- =======================
CTA Section START -->
            <section class="py-5 mb-5 bg-primary bg-opacity-10">
                <div class="container">
                    <div class="row align-items-center g-4">
                        <div class="col-lg-8">
                            <div class="text-center text-lg-start">
                                <h3 class="mb-2">Sẵn sàng tìm ngôi nhà mới?</h3>
                                <p class="mb-0 text-secondary">Hàng nghìn lựa chọn nhà trọ chất lượng đang chờ bạn khám phá</p>
                            </div>
                        </div>
                        <div class="col-lg-4 text-center text-lg-end">
                            <a href="#timtro" class="btn btn-primary btn-lg px-4">
                                <i class="bi bi-search me-2"></i>
                                Bắt đầu tìm kiếm
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- =======================
CTA Section END -->

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- =======================
Footer START -->
        <%@include file="include/footer.jsp" %>
        <!-- =======================
Footer END -->

    </body>

</html>