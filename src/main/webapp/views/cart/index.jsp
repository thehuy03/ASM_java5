<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tin Học Ánh Trăng chuyên buôn bán linh kiện PC</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/flickity.css">
<link rel="stylesheet" href="/css/styleUser.css">
</head>
<body>
    <jsp:include page="../layout/_header.jsp"/>
    <div class="container mt-5 mx-auto row ">
        <div class="col-md-8">
            <jsp:include page="items.jsp"/>
        </div>
        <div class="col-md-4">
            <jsp:include page="total.jsp"/>
        </div>
    </div>
    <jsp:include page="../layout/_footer.jsp"></jsp:include>
<script src="/js/jquery-3.7.0.min.js"></script>
<script src="/js/jquery.bootstrap-growl.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/flickity.pkgd.min.js"></script>
<script src="/js/script.js"></script>
</body>
</html>