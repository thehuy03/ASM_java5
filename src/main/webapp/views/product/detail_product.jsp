<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Insert title here</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
                    rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                    crossorigin="anonymous"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
                <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
                <link rel="stylesheet" href="/css/Detail.css">
                <link rel="stylesheet" href="/css/bootstrap.min.css">
                <link rel="stylesheet" href="/css/flickity.css">
                <link rel="stylesheet" href="/css/styleUser.css">
            </head>

            <body>
                <jsp:include page="../layout/_header.jsp"></jsp:include>
                <div class="container-lg product_detail mt-3 ">
                    <div class="container-lg mt-2">
                        <div class="content">
                            <div class="content_header">
                                <span><strong>${pro.productName}</strong></span>
                            </div>
                            <hr>
                            <div class="content_body">
                                <div class="row container-lg">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-6 col-xxl-6 py-0">
                                        <div class="row">
                                            <div class="col-12">
                                                <div id="carouselExample" class="carousel slide">
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <img src="${image[0].imageLink}" class="d-block w-100"
                                                                alt="...">
                                                        </div>
                                                        <c:forEach var="img" items="${image.subList(1, image.size())}">
                                                            <div class="carousel-item">
                                                                <img src="${img.imageLink}" class="d-block w-100"
                                                                    alt="...">
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                    <button class="carousel-control-prev z-0" type="button"
                                                        data-bs-target="#carouselExample" data-bs-slide="prev">
                                                        <span class="carousel-control-prev-icon bg-black"
                                                            aria-hidden="true"></span>
                                                        <span class="visually-hidden">Previous</span>
                                                    </button>
                                                    <button class="carousel-control-next z-0" type="button"
                                                        data-bs-target="#carouselExample" data-bs-slide="next">
                                                        <span class="carousel-control-next-icon bg-black"
                                                            aria-hidden="true"></span>
                                                        <span class="visually-hidden">Next</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <ul class="col-12 row mt-1" style="list-style-type: none;">
                                                <li class="col-6">
                                                    <div class="iconl">
                                                        <p><img class="lazyloaded" width="50" height="50"
                                                                src="//theme.hstatic.net/200000420363/1001015796/14/product_policy_1.png?v=1752">
                                                            Chính sách bảo hành</p>
                                                    </div>
                                                </li>
                                                <li class="col-6">
                                                    <div class="iconl">
                                                        <p><img class=" lazyloaded" width="50" height="50"
                                                                src="//theme.hstatic.net/200000420363/1001015796/14/product_policy_2.png?v=1752">
                                                            Cam kết chính hãng 100% </p>
                                                    </div>
                                                </li>
                                                <li class="col-6">
                                                    <div class="iconl">
                                                        <p><img class=" lazyloaded" width="50" height="50"
                                                                src="//theme.hstatic.net/200000420363/1001015796/14/product_policy_4.png?v=1752">
                                                            1900 0243
                                                        </p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class=" container-lg col-12 col-sm-12 col-md-12 col-lg-12 col-xl-6 col-xxl-6">
                                        <div class="info">
                                            <div class="price text-danger fw-bolder fs-5">
                                                <span>Giá <fmt:formatNumber>${pro.productPrice}</fmt:formatNumber>
                                                    VND</span>
                                            </div>
                                            <hr>
                                            <span class="fs-3 text-danger fw-bold">
                                                Thông số kĩ thuật:
                                            </span>
                                            <div class="info_detail overflow-y-scroll d-block mt-3"
                                                style="height: 500px;">
                                                <table class="table table-striped ">
                                                    <tbody class="">
                                                        <tr>
                                                            <td
                                                                class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                                                <Strong>Sản phẩm</Strong>
                                                            </td>
                                                            <td
                                                                class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9 col-xxl-9">
                                                                ${pro.productName}</td>
                                                        </tr>
                                                        <tr>
                                                            <td
                                                                class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                                                Hãng
                                                            </td>
                                                            <td
                                                                class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9 col-xxl-9">
                                                                ${pro.producer.producerName}</td>
                                                        </tr>
                                                        <c:forEach var="item" items="${spec}">
                                                            <tr>
                                                                <td class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 col-xxl-3">
                                                                    ${item.specKey}
                                                                </td>
                                                                <td class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9 col-xxl-9">
                                                                    ${item.specValue}
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <button class="btn col-12 text-info border-info">Thêm vào giỏ
                                                        hàng</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <hr>
                </div>
                <div class="container product_relate_to px-2">
                    <span>Sản phẩm liên quan</span>
                    <div class="carousel mt-3 bg-white " data-flickity='{ "groupCells": true }'>
                    	<c:forEach var="product" items="${product_relate}">
                    		<div class="carousel-cell col-6 col-sm-6 col-md-6 col-lg-4 col-xl-3 col-xxl-2">
	                            <a href="/product/detail?id=${product.productId}" class="relate_to">
	                                <img src="${product.images[0].imageLink}" alt="" width="100%" height="60%">
	                            </a>
	                            <a href="/product/detail?id=${product.productId}" class="name_relate">
	                                <span>${product.productName}</span>
	                            </a>
	                            <span class="price_relate text-center"><fmt:formatNumber  maxFractionDigits = "3" type="number">${product.productPrice}</fmt:formatNumber> đ</span>
                       		</div>
                    	</c:forEach>
                    </div>
                </div>
                <jsp:include page="../layout/_footer.jsp"></jsp:include>
            </body>

            </html>