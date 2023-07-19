<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="modal fade" id="modalDangnhap" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content container">
                <div class="row position-relative">
                    <button type="button"
                        class="btn btn-lg bg-white opacity-100 rounded-circle btn-close position-absolute start-100 top-0 translate-middle"
                        data-bs-dismiss="modal"></button>
                    <div class="col-md-7 p-5">
                        <div class="mb-3">
                            <h4 class="fw-semibold">Xin chào,</h4>
                            <div class="nav">
                                <a class="nav-link active px-1" href="#dangnhap" data-bs-toggle="list">Đăng
                                    nhập</a>
                                <span class="align-self-center">hoặc</span>
                                <a class="nav-link px-1" href="#dangky" data-bs-toggle="list">Tạo tài
                                    khoản</a>
                            </div>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane show active" id="dangnhap">
                                <form action="/user/login" method="POST" id="form-dangnhap">
                                    <div class="mb-3">
                                        <input type="text" name="userPhone" value="${param.userPhone}"
                                            class="form-control border-0 border-bottom border-danger rounded-0"
                                            placeholder="Số điện thoại">
                                    </div>
                                    <div class="mb-3 d-flex flex-column">
                                        <div class="position-relative">
                                            <input type="password" name="userPassword" value="${param.userPassword}"
                                                class="form-control password border-0 border-bottom border-danger rounded-0"
                                                placeholder="Mật khẩu">
                                            <span class="text-danger userErr">${param.userErr}</span>
                                            <span class="btn-show-pw position-absolute d-none">
                                                <i class="bi bi-eye-slash"></i>
                                            </span>

                                        </div>
                                        <div class="ms-auto">
                                            <a href="#" class="text-decoration-none">
                                                <small>Quên mật khẩu?</small>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="mb-3 d-grid">
                                        <button id="btn-login" class="btn text-bg-danger text-uppercase p-2">
                                            đăng nhập
                                        </button>
                                    </div>
                                    <hr class="my-4">
                                </form>
                            </div>
                            <div class="tab-pane" id="dangky">
                                <form id="form-dangky" method="POST">
                                    <div class="mb-3">
                                        <input type="text" name="userPhone"
                                            class="form-control border-0 border-bottom border-danger rounded-0"
                                            placeholder="Số điện thoại">
                                    </div>
                                    <div class="mb-3">
                                        <input type="text" name="userName"
                                            class="form-control border-0 border-bottom border-danger rounded-0"
                                            placeholder="Họ tên">
                                    </div>
                                    <div class="mb-3">
                                        <input type="text" name="userEmail"
                                            class="form-control border-0 border-bottom border-danger rounded-0"
                                            placeholder="Email">
                                    </div>
                                    <div class="position-relative mb-3">
                                        <input type="password" name="userPassword"
                                            class="form-control password border-0 border-bottom border-danger rounded-0"
                                            placeholder="Mật khẩu">
                                        <span class="btn-show-pw position-absolute d-none">
                                            <i class="bi bi-eye-slash"></i>
                                        </span>
                                    </div>
                                    <div class="position-relative mb-3">
                                        <input type="password" name="confirmPassword"
                                            class="form-control password border-0 border-bottom border-danger rounded-0"
                                            placeholder="Xác nhận mật khẩu">
                                        <span class="btn-show-pw position-absolute d-none">
                                            <i class="bi bi-eye-slash"></i>
                                        </span>
                                    </div>
                                    <div class="mb-3 d-grid">
                                        <button id="btn-dangky" class="btn text-bg-danger text-uppercase p-2">
                                            đăng ký
                                        </button>
                                    </div>
                                    <hr class="my-4">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-5 d-none d-md-block"><img
                            src="https://theme.hstatic.net/200000420363/1001015796/14/banner_login.png?v=1737"
                            alt="hình ảnh" class="w-100">
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../notification.jsp"></jsp:include>
    </div>