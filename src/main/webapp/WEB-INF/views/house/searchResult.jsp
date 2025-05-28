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
                            <div class="vstack gap-4">

                                <!-- Card item START -->
                                <c:choose>
                                    <c:when test="${not empty housesResult}">
                                        <c:forEach items="${housesResult}" var="house">
                                            <div class="card shadow p-2">
                                                <div class="row g-0">
                                                    <!-- Card img -->
                                                    <div class="col-md-5 position-relative">



                                                        <!-- Slider START -->
                                                        <div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2">
                                                            <div class="tiny-slider-inner" data-autoplay="false" data-arrow="true" data-dots="false" data-items="1">
                                                                <!-- Image item -->
                                                                <div><img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/04.jpg" alt="Card image"></div>

                                                                <!-- Image item -->
                                                                <div><img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/02.jpg" alt="Card image"></div>

                                                                <!-- Image item -->
                                                                <div><img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/03.jpg" alt="Card image"></div>

                                                                <!-- Image item -->
                                                                <div><img src="${pageContext.request.contextPath}/assets/images/category/hotel/4by3/01.jpg" alt="Card image"></div>
                                                            </div>
                                                        </div>
                                                        <!-- Slider END -->
                                                    </div>

                                                    <!-- Card body -->
                                                    <div class="col-md-7">
                                                        <div class="card-body py-md-2 d-flex flex-column h-100 position-relative">

                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item me-0 small">${houseRatings[house.id]} <i class="fa-solid fa-star text-warning"></i></li>

                                                            </ul>

                                                            <!-- Title -->
                                                            <h5 class="card-title mb-1"><a href="/boarding-house/${house.id}">${house.name}</a></h5>
                                                            <small><i class="bi bi-geo-alt me-2"></i>${house.address}</small>
                                                            <!-- Amenities -->
                                                            <ul class="nav nav-divider mt-3">
                                                                <li class="nav-item">Air Conditioning</li>
                                                                <li class="nav-item">Wifi</li>
                                                                <li class="nav-item">Kitchen</li>
                                                                <li class="nav-item"><a href="#" class="mb-0 text-primary">More+</a></li>
                                                            </ul>

                                                            <!-- List -->
                                                            <ul class="list-group list-group-borderless small mb-0 mt-2">

                                                            </ul>

                                                            <!-- Price and Button -->
                                                            <div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">

                                                                <!-- Price -->
                                                                <div class="mt-3 mt-sm-0">
                                                                    <a href="/boarding-house/${house.id}" class="btn btn-sm btn-dark mb-0 w-100">Xem chi tiết</a>    
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