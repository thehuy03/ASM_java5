<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <h1 class="h2 pt-3 pb-2 mb-3 border-bottom text-capitalize">Quản lý sản phẩm</h1>
            <form action="/admin/manager-product/create" method="POST" enctype="multipart/form-data">
                <form class="" autocomplete="off">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="productId" class="form-label">Mã sản phẩm</label>
                            <input type="text" id="productId" ng-model="product.id" class="form-control shadow-none"
                                name="productId" value="">
                        </div>
                        <div class="col-sm-6">
                            <label for="productName" class="form-label">Tên sản phẩm</label>
                            <input type="text" id="productName" ng-model="product.name" class="form-control shadow-none"
                                name="productName" value="">
                        </div>
                        <div class="col-sm-4 col-6">
                            <label for="productQuantity" class="form-label">Số lượng</label>
                            <input type="number" id="productQuantity" ng-model="product.quantity"
                                class="form-control shadow-none" name="productQuantity" value="">
                        </div>
                        <div class="col-sm-4 col-6">
                            <label for="productPrice" class="form-label">Giá</label>
                            <input type="number" ng-model="product.price" id="productPrice"
                                class="form-control shadow-none" name="productPrice" value="">
                        </div>
                        <div class="col-sm-4">
                            <label for="category" class="form-label">Loại</label>
                            <select class="form-select" name="category" id="category" ng-model="product.categoryId">
                                <c:forEach var="cate" items="${cates}">
                                    <option value="${cate.categoryId}">${cate.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="category" class="form-label">Nhà sản xuất</label>
                            <select class="form-select" name="producer" id="producer" ng-model="product.producerId">
                                <c:forEach var="item" items="${producer}">
                                    <option value="${item.producerId}">${item.producerName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6">  
                            <label  class="form-label">Thông số kỹ thuật</label>
                            <select class="form-select " name="specs" id="specs" multiple ng-model="product.abc">
                                <c:forEach var="cate" items="${specList}">
                                    <option class="form-label" value="${cate.specId}" >
                                        ${cate.specKey}:${cate.specValue}</option>
                                </c:forEach>
                            </select>
                            
                        </div>
                        <div class="col-sm-12">
                            <label for="images" class="form-label">Ảnh</label>
                            <input type="file" name="imgUpload" class="form-control" multiple
                                onchange="loadFiles(event)">
                        </div>
                        <div id="carousel-cell"></div>
                        <div class="col-sm-12">
                            <div class="image-select mt-3 bg-white flex-wrap" ng-if="product.images.length!==0">
                                <img class="col-6 col-sm-6 col-md-6 col-lg-4 col-xl-3 col-xxl-2" ng-repeat="image in product.images" ng-src="{{ image }}" width="100%" height="60%">
                            </div>
                        </div>
                    </div>
                    <hr class="my-4">

                    <div class="d-flex gap-2">
                        <button class=" btn btn-success text-capitalize" id="addPro">Thêm</button>
                        <button class="btn btn-warning text-capitalize" id="updatePro">Update</button>
                        <button class="btn btn-danger text-capitalize" id="deletePro">Delete</button>
                        <button class="btn btn-primary text-capitalize" id="resetPro">Reset</button>
                    </div>
                </form>
            </form>
            <div
                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h5>Section title</h5>
                <form class="input-group order-1 order-md-0" id="searchDataTable">
                    <input type="text" id="search" class="form-control shadow-none" name="search"
                        placeholder="Tìm kiếm">
                    <button class="btn btn-sm btn-outline-secondary"> <i class="bi bi-search"></i></button>
                </form>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="dropdown me-2">
                        <button type="button" data-bs-toggle="dropdown"
                            class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                            Số lượng
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Còn hàng</a></li>
                            <li><a class="dropdown-item" href="#">Hết hàng</a></li>
                        </ul>
                    </div>
                    <div class="dropdown me-2">
                        <button type="button" data-bs-toggle="dropdown"
                            class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                            Giá
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Tăng dần</a></li>
                            <li><a class="dropdown-item" href="#">Giảm dần</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="table-responsive small">
                <table id="tableDataProduct" class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th class="fw-bold align-middle text-center" scope="col">#</th>
                            <th class="fw-bold align-middle text-center" scope="col">Ảnh</th>
                            <th class="fw-bold align-middle text-center" scope="col">Mã</th>
                            <th class="fw-bold align-middle text-center" scope="col">Tên</th>
                            <th class="fw-bold align-middle text-center" scope="col">Giá</th>
                            <th class="fw-bold align-middle text-center" scope="col">NSX</th>
                            <th class="fw-bold align-middle text-center" scope="col">Số lượng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="item" items="${listPro.content}" varStatus="loop">
                        <tr ng-click="editProduct('${item.productId}','${item.productName}','${item.productPrice}','${item.productQuantity}','${item.producer.producerId}','${item.category.categoryId}')"
                            style="cursor: pointer;">
                            <td class="align-middle text-center">${loop.index+1}</td>
                            <td class="align-middle text-center"> <img src="${item.images[0].imageLink}" alt=""
                                    width="100px" class="p-2"> </td>
                            <td class="align-middle text-center">${item.productId}</td>
                            <td class="align-middle text-center">${item.productName}</td>
                            <td class="align-middle text-center">
                                <fmt:formatNumber>${item.productPrice}</fmt:formatNumber>
                            </td>
                            <td class="align-middle text-center">${item.producer.producerName}</td>
                            <td class="align-middle text-center">${item.productQuantity}</td>
                        </tr>
                        </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </div>
            <nav class="d-flex flex-column">
                <span class="m-auto mb-2">Page ${listPro.number+1}/${listPro.totalPages}</span>
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link ${listPro.totalPages ==0?'disabled':''}" href="
                /admin/manager-product?page=0">&#8676</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listPro.totalPages ==0?'disabled':''}"
                            href="/admin/manager-product?page=${listPro.number<=0?listPro.totalPages-1:listPro.number-1}">&laquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listPro.totalPages ==0?'disabled':''}"
                            href="/admin/manager-product?page=${listPro.number>=listPro.totalPages-1?0:listPro.number+1}">&raquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listPro.totalPages ==0?'disabled':''}"
                            href="/admin/manager-product?page=${listPro.totalPages-1}">&#8677</a>
                    </li>
                </ul>
            </nav>