<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <h1 class="h2 pt-3 pb-2 mb-3 border-bottom text-capitalize">Quản lý nhà sản xuất</h1>
        <form id="form-producer" method="POST" autocomplete="off">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="producerId" class="form-label">Mã nhà sản xuất</label>
                    <input type="text" id="producerId" class="form-control shadow-none" name="producerId"
                        ng-model="producer.id">
                </div>
                <div class="col-sm-6">
                    <label for="producerName" class="form-label">Tên nhà sản xuất</label>
                    <input type="text" id="producerName" class="form-control shadow-none" name="producerName"
                        ng-model="producer.name">
                </div>
                <div class="col-sm-6">
                    <label for="producerEmail" class="form-label">Email</label>
                    <input type="email" id="producerEmail" class="form-control shadow-none" name="producerEmail"
                        ng-model="producer.email">
                </div>
                <div class="col-sm-6">
                    <label for="producerPhone" class="form-label">Số điện thoại</label>
                    <input type="text" id="producerPhone" class="form-control shadow-none" name="producerPhone"
                        ng-model="producer.phone">
                </div>
            </div>

        <hr class="my-4">

        <div class="d-flex gap-2">
            <button class=" btn btn-success text-capitalize" id="btn-saveProducer">Add</button>
            <button class="btn btn-danger text-capitalize" id="btn-deleteProducer">Delete</button>
            <button class="btn btn-primary text-capitalize" type="reset">Reset</button>
        </div>
    </form>

        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h5 class="text-capitalize">Danh sách nhà sản xuất</h5>
            <form class="input-group order-1 order-md-0" action="/admin/manager-producer/search" id="searchDataTable"
                autocomplete="off" ng-init="search = '${searchProducer}'">
                <input type="text" id="searchProducer" ng-model="search" class="form-control shadow-none" name="search"
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
                                href="/admin/manager-producer/search?name=producerId&sort=true">Tăng
                                dần</a></li>
                        <li><a class="dropdown-item"
                                href="/admin/manager-producer/search?name=producerId&sort=false">Giảm
                                dần</a></li>
                    </ul>
                </div>
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Tên
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/admin/manager-producer/search?name=producerName&sort=true">A->Z</a></li>
                        <li><a class="dropdown-item" href="/admin/manager-producer/search?name=producerName&sort=false">Z->A</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="table-responsive small">
            <table id="tableDataProduct" class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th class="fw-bold align-middle text-center" scope="col">#</th>
                        <th class="fw-bold align-middle text-center" scope="col">Mã</th>
                        <th class="fw-bold align-middle text-center" scope="col">Tên</th>
                        <th class="fw-bold align-middle text-center" scope="col">Email</th>
                        <th class="fw-bold align-middle text-center" scope="col">Số điện thoại</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${listProducer.content}" varStatus="loop">
                        <tr style="cursor: pointer;"
                            ng-click="editProducer('${item.producerId}','${item.producerName}','${item.producerEmail}','${item.producerPhone}')">
                            <td class="align-middle text-center">${loop.index+1}</td>
                            <td class="align-middle text-center">${item.producerId}</td>
                            <td class="align-middle text-center">${item.producerName}</td>
                            <td class="align-middle text-center">${item.producerEmail}</td>
                            <td class="align-middle text-center">${item.producerPhone}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav class="d-flex flex-column">
                <span class="m-auto mb-2">Page ${listProducer.number+1}/${listProducer.totalPages}</span>
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link ${listProducer.totalPages ==0?'disabled':''}" href="
                            /admin/manager-producer/search?page=0">&#8676</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listProducer.totalPages ==0?'disabled':''}"
                            href="/admin/manager-producer/search?page=${listProducer.number<=0?listProducer.totalPages-1:listProducer.number-1}">&laquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listProducer.totalPages ==0?'disabled':''}"
                            href="/admin/manager-producer/search?page=${listProducer.number>=listProducer.totalPages-1?0:listProducer.number+1}">&raquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${listProducer.totalPages ==0?'disabled':''}"
                            href="/admin/manager-producer/search?page=${listProducer.totalPages-1}">&#8677</a>
                    </li>
                </ul>
            </nav>
        </div>