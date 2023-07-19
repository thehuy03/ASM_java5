<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="sidebarMenuLabel">Tin Học Ánh Trăng</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebarMenu"
                aria-label="Close"></button>
        </div>
        <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
            <ul class="nav flex-column">
                <h6 class="sidebar-heading px-3 mt-4 mb-1 text-body-secondary text-uppercase">
                    <span>Sản phẩm</span>
                </h6>
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2 active" href="/admin/manager-product">
                        <i class="bi bi-archive"></i>
                        Quản lý sản phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="/admin/manager-category">
                        <i class="bi bi-inboxes"></i>
                        Quản lý loại
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="/admin/manager-spec">
                        <i class="bi bi-gear"></i>
                        Quản lý thông số kỹ thuật
                    </a>
                </li>
            </ul>

            <h6
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-body-secondary text-uppercase">
                <span>Nội bộ</span>
            </h6>
            <ul class="nav flex-column mb-auto">
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="/admin/manager-account">
                        <i class="bi bi-file-earmark-person"></i>
                        Quản lý tài khoản
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="/admin/manager-producer">
                        <i class="bi bi-house-fill"></i>
                        Quản lý nhà sản xuất
                    </a>
                </li>
            </ul>

            <h6
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-body-secondary text-uppercase">
                <span>Thống kê</span>
            </h6>
            <ul class="nav flex-column mb-auto">
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="#">
                        <i class="bi bi-receipt-cutoff"></i>
                        Sản phẩm bán chạy nhất
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="/admin/statistical_two">
                        <i class="bi bi-box2"></i>
                        Sản phẩm còn trong kho
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="#">
                        <i class="bi bi-shop"></i>
                        Doanh thu của cửa hàng
                    </a>
                </li>
            </ul>

            <hr class="my-3">

            <ul class="nav flex-column mb-auto">
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="#">
                        Trang cá nhân
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="#">
                        Đăng xuất
                    </a>
                </li>
            </ul>
        </div>
    </div>