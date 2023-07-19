<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Name</title>
        <link rel="stylesheet" href="/css/multi-select-tag.css">
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/flickity.css">
        <link rel="stylesheet" href="/css/styleAdmin.css">
    </head>

    <body ng-app="myApp">
        <jsp:include page="layout/_header.jsp"></jsp:include>
        <div class="container-fluid" ng-controller="myCtrl">
            <div class="row">
                <div class="sidebar border border-right col-md-3 p-0 bg-body-tertiary">
                    <jsp:include page="layout/sidebar.jsp"></jsp:include>
                </div>
                <main class="col-md-9 col-lg- ms-sm-auto px-md-4">
                    <jsp:include page="form/formAccount.jsp"></jsp:include>
                </main>
            </div>
        </div>
        <jsp:include page="Notifications/Notification.jsp"></jsp:include>
        <script src="/js/jquery-3.7.0.min.js"></script>
        <script src="/js/jquery.validate.min.js"></script>
        <script src="/js/angular.min.js"></script>
        <script src="/js/jquery.bootstrap-growl.min.js"></script>
        <script src="/js/flickity.pkgd.min.js"></script>
        <script src="/js/isotope.pkgd.min.js"></script>
        <script src="/js/bootstrap.bundle.min.js"></script>
        <script src="/js/multi-select-tag.js"></script>
        <script src="/js/scriptAdmin.js"></script>
        <script src="/js/angularJSAdmin.js"></script>
    </body>

    </html>