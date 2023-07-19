<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <table class="table table-light border-danger table-bordered table-striped">
        <thead>
            <tr>
                <th scope="col">Mã</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Số lượt mua</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${RpVdLike}">
            <tr>
                <th scope="row">${i.id}</th>
                <td>${i.title}</td>
                <td>${i.getFavorites().size()}</td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
            <th colspan="5" class="position-relative">
                <span>10 sản phẩm</span>
            </th>
        </tfoot>
    </table>
