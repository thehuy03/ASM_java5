<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <h1 class="h2 pt-3 pb-2 mb-3 border-bottom text-capitalize">Quản lý loại</h1>
        <form id="form-loai" action="/admin/manager-category/create" method="POST" autocomplete="off">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="categoryId" class="form-label">Mã loại</label>
                    <input type="text" id="categoryId" ng-model="cate.id" class="form-control shadow-none"
                        name="categoryId" value="">
                </div>
                <div class="col-sm-6">
                    <label for="categoryName" class="form-label">Tên loại</label>
                    <input type="text" id="categoryName" ng-model="cate.name" class="form-control shadow-none"
                        name="categoryName" value="">
                </div>
            </div>

            <hr class="my-4">
            <div class="d-flex gap-2">
                <button class="btn btn-success text-capitalize" id="btn-addCategory">Add</button>
                <button class="btn btn-danger text-capitalize" id="btn-delCategory">Delete</button>
                <button class="btn btn-primary text-capitalize" type="reset">Reset</button>
            </div>
        </form>

        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h5 class="text-capitalize">Danh sách loại</h5>
            <form class="input-group order-1 order-md-0" action="/admin/manager-category/search" id="searchDataTable"
                autocomplete="off" ng-init="search = '${searchCate}'">
                <input type="text" id="searchCate" ng-model="search" class="form-control shadow-none" name="search"
                    placeholder="Tìm kiếm">
                <button class="btn btn-sm btn-outline-secondary"> <i class="bi bi-search"></i></button>
            </form>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Mã
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item"
                                href="/admin/manager-category/search?name=categoryId&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item"
                                href="/admin/manager-category/search?name=categoryId&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Tên
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item"
                                href="/admin/manager-category/search?name=categoryName&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item"
                                href="/admin/manager-category/search?name=categoryName&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="table-responsive small">
            <table id="tableDataProduct" class="table table-hover table-striped table-sm ">
                <thead>
                    <tr>
                        <th class="fw-bold align-middle text-center" scope="col">#</th>
                        <th class="fw-bold align-middle text-center" scope="col">Mã loại</th>
                        <th class="fw-bold align-middle text-center" scope="col">Tên loại</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${listCate.content}" varStatus="loop">
                        <tr class="test" ng-click="editCate('${item.categoryId}','${item.categoryName}')"
                            style="cursor: pointer;">
                            <td class="align-middle text-center">${loop.index+1}</td>
                            <td class="align-middle text-center">${item.categoryId}</td>
                            <td class="align-middle text-center">${item.categoryName}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav class="d-flex flex-column">
                <span class="m-auto mb-2">Page ${listCate.number+1}/${listCate.totalPages}</span>
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link ${listCate.totalPages ==0?'disabled':''}" href="
                            /admin/manager-category/search?page=0">&#8676</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listCate.totalPages ==0?'disabled':''}"
                            href="/admin/manager-category/search?page=${listCate.number<=0?listCate.totalPages-1:listCate.number-1}">&laquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listCate.totalPages ==0?'disabled':''}"
                            href="/admin/manager-category/search?page=${listCate.number>=listCate.totalPages-1?0:listCate.number+1}">&raquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listCate.totalPages ==0?'disabled':''}"
                            href="/admin/manager-category/search?page=${listCate.totalPages-1}">&#8677</a>
                    </li>
                </ul>
            </nav>
        </div>