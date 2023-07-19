<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <h1 class="h2 pt-3 pb-2 mb-3 border-bottom text-capitalize">Quản lý tài khoản</h1>
        <form id="form-account" action="/admin/manager-account/create" method="POST" autocomplete="off">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="categoryId" class="form-label">Số điện thoại</label>
                    <input type="text" id="userPhone" ng-model="account.phone" class="form-control shadow-none"
                        name="userPhone" value="">
                </div>
                <div class="col-sm-6">
                    <label for="categoryName" class="form-label">Họ tên</label>
                    <input type="text" id="userName" ng-model="account.name" class="form-control shadow-none"
                        name="userName" value="">
                </div>
                <div class="col-sm-6">
                    <label for="categoryName" class="form-label">Email</label>
                    <input type="text" id="userEmail" ng-model="account.email" class="form-control shadow-none"
                        name="userEmail" value="">
                </div>
                <div class="col-sm-6">
                    <label for="categoryName" class="form-label">Mật khẩu</label>
                    <div class="position-relative">
                        <input type="password" id="userPassword" ng-model="account.password"
                            class="form-control shadow-none password" name="userPassword" placeholder="Mật khẩu"
                            value="">
                        <span class="btn-show-pw position-absolute d-none">
                            <i class="bi bi-eye-slash"></i>
                        </span>
                    </div>
                </div>
                <div class="col-sm-6">
                    <label for="categoryName" class="form-label">Chức vụ</label>
                    <div class="d-flex align-items-center">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" name="userRole" type="radio"
                                ng-checked="account.role == 'true'" id="Admin">
                            <label class="form-check-label" for="Admin">
                                Admin
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" name="userRole" type="radio"
                                ng-checked="account.role == 'false'" id="User">
                            <label class="form-check-label" for="User">
                                User
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="my-4">
            <div class="d-flex gap-2">
                <button class="btn btn-success text-capitalize" id="btn-addAccount">Add</button>
                <button class="btn btn-primary text-capitalize" type="reset">Reset</button>
            </div>
        </form>

        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h5 class="text-capitalize">Danh sách tài khoản</h5>
            <form class="input-group order-1 order-md-0" action="/admin/manager-account/search" id="searchDataTable"
                autocomplete="off" ng-init="search = '${searchAccount}'">
                <input type="text" id="searchAccount" ng-model="search" class="form-control shadow-none" name="search"
                    placeholder="Tìm kiếm">
                <button class="btn btn-sm btn-outline-secondary"> <i class="bi bi-search"></i></button>
            </form>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Họ tên
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/admin/manager-account/search?name=userName&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item" href="/admin/manager-account/search?name=userName&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Email
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/admin/manager-account/search?name=userEmail&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item" href="/admin/manager-account/search?name=userEmail&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Vai trò
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item"
                                href="/admin/manager-account/search?name=userRole&sort=true">User</a>
                        </li>
                        <li><a class="dropdown-item" href="/admin/manager-account/search?name=userRole&sort=false">
                                Admin
                            </a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="table-responsive small">
            <table id="tableDataProduct" class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th class="fw-bold align-middle text-center" style="width: 5%;" scope="col">#</th>
                        <th class="fw-bold align-middle text-center" style="width: 10%;" scope="col">Số điện thoại</th>
                        <th class="fw-bold align-middle text-center" style="width: 15%;" scope="col">Họ tên</th>
                        <th class="fw-bold align-middle text-center" style="width: 25%;" scope="col">Email</th>
                        <th class="fw-bold align-middle text-center" style="width: 25%;" scope="col">Mật khẩu</th>
                        <th class="fw-bold align-middle text-center" style="width: 20%;" scope="col">Chức vụ</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="item" items="${listAccount.content}" varStatus="loop">
                        <tr class="test"
                            ng-click="editAccount('${item.userPhone}','${item.userName}','${item.userEmail}','${item.userPassword}','${item.userRole}')"
                            style="cursor: pointer;">
                            <td class="align-middle">${loop.index+1}</td>
                            <td class="align-middle">${item.userPhone} </td>
                            <td class="align-middle text-truncate">${item.userName}</td>
                            <td class="align-middle">${item.userEmail}</td>
                            <td class="align-middle">${item.userPassword}</td>
                            <td class="align-middle">${item.userRole?'Admin':'User'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <nav class="d-flex flex-column">
            <span class="m-auto mb-2">Page ${listAccount.number+1}/${listAccount.totalPages}</span>
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link ${listAccount.totalPages ==0?'disabled':''}" href="
                        /admin/manager-account/search?page=0">&#8676</a>
                </li>
                <li class="page-item">
                    <a class="page-link ${listAccount.totalPages ==0?'disabled':''}"
                        href="/admin/manager-account/search?page=${listAccount.number<=0?listAccount.totalPages-1:listAccount.number-1}">&laquo;</a>
                </li>
                <li class="page-item">
                    <a class="page-link ${listAccount.totalPages ==0?'disabled':''}"
                        href="/admin/manager-account/search?page=${listAccount.number>=listAccount.totalPages-1?0:listAccount.number+1}">&raquo;</a>
                </li>
                <li class="page-item">
                    <a class="page-link ${listAccount.totalPages ==0?'disabled':''}"
                        href="/admin/manager-account/search?page=${listAccount.totalPages-1}">&#8677</a>
                </li>
            </ul>
        </nav>