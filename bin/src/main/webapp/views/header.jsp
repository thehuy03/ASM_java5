<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header id="insHeaderPage" class="mb-2">
	<div class="top-bar w-100">
		<div class="top-bar-carousel-cell w-100">
			<img
				data-flickity-lazyload="https://file.hstatic.net/200000420363/file/head_web-01_63c4830e65d34c0db7b875066850ed7b.png"
				alt="hình ảnh" class="top-bar-carousel-cell-image img-fluid">
		</div>
	</div>
	<div id="headerPage" class="container-md">
		<div class="header-page__wrapper navbar navbar-expand-lg">
			<div class="container-fluid px-0">
				<a class="navbar-brand" href="#">
					<img class="navbar-logo"
						src="https://theme.hstatic.net/200000420363/1000988446/14/logo.png?v=2262" alt="hình ảnh">
				</a>
				<div class="header-search">
					<div class="frmSearch">
						<form class="d-flex" id="searchFRM" role="search">
							<div class="input-group">
								<input class="form-control" type="text" placeholder="Search" aria-label="Search">
								<button class="btn btn-danger" type="submit">
									<i class="bi bi-search"></i> <span class="d-none d-lg-inline">Tìm Kiếm</span>
								</button>
							</div>
							<div id="ajaxSearchResults" class="d-none"></div>
						</form>
					</div>
				</div>
				<div class="header-action d-flex column-gap-5">
					<div class="header-action__account d-flex d-none d-lg-flex position-relative">
						<a href="#" class="ppp text-decoration-none link-dark align-self-center stretched-link">
							<i class="bi bi-person-fill"></i>
						</a>
						<ul class="list-group list-group-flush">
							<li class="list-group-item border-0">Đăng nhập/Đăng ký</li>
							<li class="list-group-item fw-bold">Tài khoản</li>
						</ul>
						<div class="header-account__dropdown position-absolute p-2 shadow z-1 bg-white">
							<ul class="list-group list-group-flush">
								<li class="list-group-item border-0 m-2"><a href="#" class="btn btn-login">Đăng
										nhập</a></li>
								<li class="list-group-item border-0 m-2"><a href="#" class="btn btn-login">Đăng ký</a>
								</li>
								<li class="list-group-item border-0 m-2"><a
										class="btn btn-google btn-login fw-bold d-flex gap-2">
										<i class="bi bi-google"></i> <span>Sign in with Google</span>
									</a></li>
								<li class="list-group-item border-0 m-2"><a
										class="btn btn-facebook btn-login fw-bold d-flex gap-2">
										<i class="bi bi-facebook"></i> <span>Sign in with Facebook</span>
									</a></li>
							</ul>
						</div>
					</div>
					<div class="header-action__cart d-flex position-relative">
						<a href="<c:url value="./cart/index.jsp"/>" class="text-decoration-none link-dark stretched-link">
							<i class="bi bi-cart d-block position-relative"> <span
								class="position-absolute z-1 badge rounded-pill bg-danger"> 3 <span
									class="visually-hidden">quantity in cart</span>
							</span>
							</i>
						</a>
						<ul class="list-group list-group-flush align-self-center">
							<li class="list-group-item fw-bold d-none d-sm-inline">Giỏ hàng</li>
						</ul>
					</div>
				</div>
				<button class="navbar-toggler border-0 p-0" type="button">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
		<div class="header-page__nav row">
			<div class="nav-sidebar col-3 px-0 d-none d-lg-block position-relative">
				<div class="nav-sidebar__head d-flex justify-content-center rounded rounded-2 gap-2 px-2">
					<i class="bi bi-list fw-bold"></i> <span
						class="text-uppercase align-self-center fw-bold text-center">danh mục sản phẩm</span>
				</div>
				<div class="nav-sidebar__dropdown shadow-sm d-none position-absolute z-1 w-100 bg-white">
					<div class="list-group list-group-flush position-relative">
						<div class="list-group-item list-group-item-action border-bottom">
							<a href="#"
								class="list-group-item-link text-decoration-none text-dark d-flex column-gap-2 py-1">
								<i class="bi bi-motherboard"></i> <span class="align-self-center text-capitalize">linh
									kiện mới</span> <i class="bi bi-caret-right-fill ms-auto"></i>
							</a>
							<div class="mainChild position-absolute top-0 start-100 d-none shadow-lg z-1 bg-white">
								<div class="main-child__content px-3" style="width: 990px; height: 650px;">
									<div class="main-child__wrapper row row-cols-4 w-100 mt-3">
										<div class="main-child__item col">
											<span class="fw-bold d-block py-1">CPU - bộ vi sử lý</span>
											<div class="list-group list-group-flush">
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 13 </a>
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 12 </a>
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 11 </a>
											</div>
										</div>
										<div class="main-child__item col">
											<span class="fw-bold d-block py-1">Mainboard - Bo mạch chủ</span>
											<div class="list-group list-group-flush">
												<a href="#" class="list-group-item border-0 px-0 py-2"> Mainboard Intel </a>
												<a href="#" class="list-group-item border-0 px-0 py-2"> Mainboard AMD </a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="list-group-item list-group-item-action border-bottom">
							<a href="#"
								class="list-group-item-link text-decoration-none text-dark d-flex column-gap-2 py-1 stretched-link">
								<i class="bi bi-laptop"></i> <span class="align-self-center text-capitalize">Laptop
									chính hãng</span> <i class="bi bi-caret-right-fill ms-auto"></i>
							</a>
							<div class="mainChild position-absolute top-0 start-100 d-none shadow-lg z-1 bg-white"
								style="transform: translate(0, -51.2px);">
								<div class="main-child__content px-3" style="width: 990px; height: 650px;">
									<div class="main-child__wrapper row row-cols-4 w-100 mt-3">
										<div class="main-child__item col">
											<span class="fw-bold d-block py-1">laptop theo hãng</span>
											<div class="list-group list-group-flush">
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 13 </a>
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 12 </a>
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 11 </a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="list-group-item list-group-item-action border-bottom">
							<a href="#"
								class="list-group-item-link text-decoration-none text-dark d-flex column-gap-2 py-1 stretched-link">
								<i class="bi bi-motherboard"></i> <span class="align-self-center text-capitalize">linh
									kiện mới</span> <i class="bi bi-caret-right-fill ms-auto"></i>
							</a>
							<div class="mainChild position-absolute top-0 start-100 d-none shadow-lg z-1 bg-white"
								style="transform: translate(0, calc(-51.2px * 2));">
								<div class="main-child__content px-3" style="width: 990px; height: 650px;">
									<div class="main-child__wrapper row row-cols-4 w-100 mt-3">
										<div class="main-child__item col">
											<span class="fw-bold d-block py-1">CPU - bộ vi sử lý</span>
											<div class="list-group list-group-flush">
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 13 </a>
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 12 </a>
												<a href="#" class="list-group-item border-0 px-0 py-2"> Intel thế hệ 11 </a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="nav-main__menu col-9 d-none d-lg-block">
				<div class="nav-navbar nav justify-content-around rounded rounded-2">
					<a class="nav-link py-1 d-flex gap-2" href="#">
						<i class="bi bi-buildings"></i>Giới Thiệu
					</a>
					<a class="nav-link py-1 d-flex gap-2" href="#">
						<i class="bi bi-cash-stack"></i>Bảng giá
					</a>
					<a class="nav-link py-1 d-flex gap-2" href="#">
						<i class="bi bi-envelope"></i>Liên Hệ
					</a>
					<a class="nav-link py-1 d-flex gap-2" href="#">
						<i class="bi bi-sliders"></i>Xây dựng cấu hình
					</a>
				</div>
			</div>
		</div>
	</div>
</header>
