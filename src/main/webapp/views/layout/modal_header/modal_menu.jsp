<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
            <div class="offcanvas offcanvas-start" style="width: 330px;" data-bs-scroll="false" data-bs-backdrop="true"
                tabindex="-1" id="offcanvasMenu">
                <div class="offcanvas-header pb-0">
                    <div class="d-flex gap-2">
                        <a class="col-4 align-self-center px-1" href="/home">
                            <img class="navbar-logo w-100"
                                src="https://res.cloudinary.com/dz9gzy7iz/image/upload/v1686125288/moonlight-logo.png"
                                alt="hình ảnh">
                        </a>
                        <div class="col-8 d-flex flex-column">
                            <span class="h6 text-uppercase fw-bold mb-0">tin học ánh trăng</span>
                            <small>Linh kiện - phụ kiện PC chính hãng giá tốt</small>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="offcanvas-body py-0">
                    <div class="flex-shrink-0 h-100">
                        <div class="d-flex flex-column flex-shrink-0 pb-3 ps-0 h-100">
                            <div class="mb-1">
                                <a class="btn rounded border-0 collapsed">
                                    <spring:message code="nav.btnIntroduce" />
                                </a>
                            </div>
                            <div class="mb-1">
                                <a class="btn rounded border-0 collapsed">
                                    <spring:message code="nav.btnPriceList" />
                                </a>
                            </div>
                            <div class="mb-1">
                                <a class="btn rounded border-0 collapsed">
                                    <spring:message code="nav.btnContact" />
                                </a>
                            </div>
                            <div class="mb-1">
                                <a class="btn rounded border-0 collapsed">
                                    <spring:message code="nav.btnBuildConfiguration" />
                                </a>
                            </div>
                            <div class="border-top my-3"></div>

                            <ul class="list-unstyled ps-0 overflow-auto " style="height: 300px;">
                                <li class="mb-1">
                                    <button
                                        class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                                        data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                                        Linh kiện mới
                                    </button>
                                    <div class="collapse show" id="home-collapse">
                                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                            <li>
                                                <a href="#"
                                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">CPU
                                                    -
                                                    Vi Sử Lý
                                                </a>
                                            </li>
                                            <li><a href="#"
                                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Mainboard
                                                    - Bo mạch chủ
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#"
                                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">
                                                    SSD - HDD
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                            <hr>
                            <div class="d-flex justify-content-between ">
                                <c:choose>
                                    <c:when test="${ empty sessionScope.current_account}">
                                        <div class="dropdown">
                                            <a href="#"
                                                class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <img src="https://github.com/mdo.png" alt="" width="32" height="32"
                                                    class="rounded-circle me-2">
                                                <strong>Tài khoản</strong>
                                            </a>
                                            <ul class="dropdown-menu text-small shadow">
                                                <li><a class="dropdown-item" data-bs-toggle="modal"
                                                        href="#modalDangnhap">Đăng
                                                        nhập</a>
                                                </li>
                                                <li><a class="dropdown-item" href="#modalDangnhap"
                                                        data-bs-toggle="modal">Đăng
                                                        ký</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="dropdown">
                                            <a href="#"
                                                class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <img src="https://github.com/mdo.png" alt="" width="32" height="32"
                                                    class="rounded-circle me-2">
                                                <strong>${sessionScope.current_account.userName}</strong>
                                            </a>
                                            <ul class="dropdown-menu text-small shadow">
                                                <li><a class="dropdown-item" href="#">
                                                        Trang cá nhân</a>
                                                </li>
                                                <c:if test="${sessionScope.current_account.userRole}">
                                                    <li><a class="dropdown-item" href="/admin/manager-product">Admin</a>
                                                    </li>
                                                </c:if>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Sign out</a></li>
                                            </ul>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="header-action__language dropup">
                                    <button class="btn p-0" type="button" data-bs-toggle="dropdown">
                                        <i class="bi bi-globe-asia-australia"></i>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="?lang=vi">Tiếng Việt</a></li>
                                        <li><a class="dropdown-item" href="?lang=en">English</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>