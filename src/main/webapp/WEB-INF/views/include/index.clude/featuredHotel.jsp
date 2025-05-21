<%-- 
    Document   : featuredHotel
    Created on : Feb 28, 2025, 2:11:14 PM
    Author     : Thanh Duoc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="timtro">
    <div class="container">

        <!-- Title -->
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h2 class="mb-0">Tốt nhất</h2>
            </div>
        </div>

        <div class="row g-4">
            <!-- Hotel item -->
            <c:if test="${not empty houses}">
                <c:forEach items="${houses}" var="houses">
                    <div class="col-sm-6 col-xl-3">
                        <!-- Card START -->
                        <div class="card card-img-scale overflow-hidden bg-transparent">
                            <!-- Image and overlay -->
                            <div class="card-img-scale-wrapper rounded-3">
                                <!-- Image -->
                                <img src="assets/images/category/hotel/01.jpg" class="card-img" alt="hotel image">
                                <!-- Badge -->
                                <div class="position-absolute bottom-0 start-0 p-3">
                                    <div class="badge text-bg-dark fs-6 rounded-pill stretched-link"><i
                                            class="bi bi-geo-alt me-2"></i>${houses.address}</div>
                                </div>
                            </div>

                            <!-- Card body -->
                            <div class="card-body px-2">
                                <!-- Title -->
                                <h5 class="card-title"><a href="/boarding-house/${houses.id}" class="stretched-link">${houses.name}</a></h5>
                                <!-- Price and rating -->
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-success mb-0">Price <small class="fw-light">/starting at</small>
                                    </h6>
                                    <h6 class="mb-0">4.5<i class="fa-solid fa-star text-warning ms-1"></i></h6>
                                </div>
                            </div>
                        </div>
                        <!-- Card END -->
                    </div><!-- Hotel item -->
                </c:forEach>
            </c:if>

            <!-- Card END -->
        </div>
    </div>
</div> <!-- Row END -->
</div>
</section>