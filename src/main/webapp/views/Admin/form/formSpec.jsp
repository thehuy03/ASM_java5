<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <h1 class="h2 pt-3 pb-2 mb-3 border-bottom text-capitalize">Quản lý thông số kỹ thuật</h1>
        <form id="form-thongsokythuat" action="/admin/manager-spec/create" method="POST" autocomplete="off">
            <div class="row g-3">
                <input type="text" class="d-none" ng-model="spec.id" name="specId">
                <div class="col-sm-6">
                    <label for="specKey" class="form-label">Key thông số kỹ thuật</label>
                    <input type="text" id="specKey" ng-model="spec.key" class="form-control shadow-none" name="specKey">
                </div>
                <div class="col-sm-6">
                    <label for="specValue" class="form-label">Giá trị thông số kỹ thuật</label>
                    <input type="text" id="specValue" ng-model="spec.value" class="form-control shadow-none"
                        name="specValue">
                </div>
            </div>

            <hr class="my-4">
            <div class="d-flex gap-2">
                <button class="btn btn-success text-capitalize" id="btn-addSpec">Add</button>
                <button class="btn btn-danger text-capitalize" id="btn-delSpec">Delete</button>
                <button class="btn btn-primary text-capitalize" type="reset">Reset</button>
            </div>
        </form>

        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h5 class="text-capitalize">Danh sách thông số kỹ thuận</h5>
            <form class="input-group order-1 order-md-0" action="/admin/manager-spec/search" id="searchDataTable"
                autocomplete="off" ng-init="search = '${searchSpec}'">
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
                        <li><a class="dropdown-item" href="/admin/manager-spec/search?name=specId&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item" href="/admin/manager-spec/search?name=specId&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Key
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/admin/manager-spec/search?name=specKey&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item" href="/admin/manager-spec/search?name=specKey&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Giá trị
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/admin/manager-spec/search?name=specValue&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item" href="/admin/manager-spec/search?name=specValue&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="table-responsive small">
            <table id="tableDataProduct" class="table table-hover table-striped table-sm">
                <thead>
                    <tr>
                        <th class="fw-bold align-middle text-center" scope="col">#</th>
                        <th class="fw-bold align-middle text-center" scope="col">Mã thông số</th>
                        <th class="fw-bold align-middle text-center" scope="col">Key thông số</th>
                        <th class="fw-bold align-middle text-center" scope="col">Giá trị thông số</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${listSpec.content}" varStatus="loop">
                        <tr ng-click="editSpec('${item.specId}','${item.specKey}','${item.specValue}')"
                            style="cursor: pointer;">
                            <td class="align-middle text-center">${loop.index+1}</td>
                            <td class="align-middle text-center">${item.specId}</td>
                            <td class="align-middle text-center">${item.specKey}</td>
                            <td class="align-middle text-center">${item.specValue}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav class="d-flex flex-column">
                <span class="m-auto mb-2">Page ${listSpec.number+1}/${listSpec.totalPages}</span>
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link ${listSpec.totalPages ==0?'disabled':''}" href="
                            /admin/manager-spec/search?page=0">&#8676</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listSpec.totalPages ==0?'disabled':''}"
                            href="/admin/manager-spec/search?page=${listSpec.number<=0?listSpec.totalPages-1:listSpec.number-1}">&laquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listSpec.totalPages ==0?'disabled':''}"
                            href="/admin/manager-spec/search?page=${listSpec.number>=listSpec.totalPages-1?0:listSpec.number+1}">&raquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listSpec.totalPages ==0?'disabled':''}"
                            href="/admin/manager-spec/search?page=${listSpec.totalPages-1}">&#8677</a>
                    </li>
                </ul>
            </nav>
        </div>