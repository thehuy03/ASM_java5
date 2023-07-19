<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/MultipleSelect.css">

</head>
	<header class="header-bg">
        <div class="d-flex align-items-center">
            <div class="p-2 w-100 text-light ps-5">Admin Manager Pages</div>
            <div class="dropdown d-flex posision-account rounded-pill ps-3 pb-2 me-3 mb-3 mt-3  flex-shrink-1">
                <i class="bi bi-person-fill fs-3 mt-2"></i>
                <a href=""
                    class="btn dropdown-toggle mt-3 mb-2 me-2 p-0 text-light link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
                    role="button" data-bs-toggle="dropdown" aria-expanded="false">Name Account</a>
                <ul class="dropdown-menu dropdown-bg">
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                    <li><a class="dropdown-item" href="#">About</a></li>
                    <li><a class="dropdown-item" href="#">Change password</a></li>
                </ul>
            </div>
        </div>
    </header>
    <div class="nav-bar p-2">
        <ul class="nav justify-content-center">
            <li class="nav-item dropdown me-3 rounded-pill">
                <a class="nav-link dropdown-toggle rounded-pill" data-bs-toggle="dropdown" href="#" role="button"
                    aria-expanded="false" aria-current="page" href="#">Produce</a>
                    <ul class="dropdown-menu shadow">
                        <li><a class="dropdown-item" href="/Product/ProductList">List Product</a></li>
                        <li><a class="dropdown-item" href="/Product/ProducerList">List Producer</a></li>
                        <li><a class="dropdown-item" href="/Product/ImageAdd">Image Store</a></li>
                        <li><a class="dropdown-item" href="/Product/SpecAdd">Specification</a></li>
                        <li><a class="dropdown-item" href="/Product/CategoryAdd">Category</a></li>
                    </ul>
                </li>
                <li class="nav-item me-3 rounded-pill">
                    <a class="nav-link rounded-pill" href="/UserManager/UserList">User Manager</a>
                </li>
                <li class="nav-item me-3 rounded-pill">
                    <a class="nav-link rounded-pill" href="/Bill/BillList">Bill</a>
                </li>
            <li class="nav-item dropdown me-3 rounded-pill">
                <a class="nav-link rounded-pill " role="button" href="/Statistical">Statistical</a>
            </li>
        </ul>
    </div>
</html>