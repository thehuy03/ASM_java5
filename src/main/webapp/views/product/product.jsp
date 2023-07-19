<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ page isELIgnored="false" %>
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
          crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/flickity.css">
        <link rel="stylesheet" href="/css/styleUser.css">
        <link rel="stylesheet" href="/css/product.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <title>Insert title here</title>
      </head>

      <body>
        <jsp:include page="../layout/_header.jsp"></jsp:include>
        <div class="container mt-2 w-100">
          <div class="content">
            <div class="w-100 mt-2">
              <div class="sp_all float-start">
                <h5>Tổng số lượng sản phẩm: ${size}</h5>
              </div>
              <div class="sp_order float-end">
                <select  name="sort" onchange="findDM()">
                  <option value="0" selected="selected">Theo</option>
                  <option value="1" >Giá tăng</option>
                  <option value="2">Giá giảm</option>
                  <option value="3">A-Z</option>
                  <option value="4">Z-A</option>
                </select>
              </div>
            </div>
          </div>
          <br>
          <hr>
          <div class="product-list_item">
            <div class="row mt-2 p-1 pe-5 ps-5 w-auto" id="list_product">
              <c:forEach var="item" items="${items}">
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 col-xxl-2 product">
                  <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
                    <div class="card-img">
                      <img class="card-img " src="${item.images[0].imageLink}" alt="">
                    </div>
                    <div class="card-body mx-auto mt-2">
                      <div class="loopName text-center ">
                        <span><a href="">${item.productName}</a></span>
                      </div>
                      <div class="">
                        <div class="loopPrice text-center">
                          <span>
                            <fmt:formatNumber>${item.productPrice}</fmt:formatNumber>đ
                          </span>
                        </div>
                        <div class="text-center">
                          <a class="btn button btn-link" href="/product/detail?id=${item.productId}">
                            <i class="bi bi-eye"></i>
                          </a>
                          <button class="btn button btn-link">
                            <i class="bi bi-cart"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <br>
          <hr>
          <div class="row justify-content-end">
            <div class="col-3">
              <a class="btn" href="/laptop/product?p=0"><i class="bi bi-chevron-double-left"></i></a>
              <a class="btn" href="/laptop/product?p=${page.number - 1}"><i class="bi bi-chevron-left"></i></a>
              <a class="btn" href="/laptop/product?p=${page.number + 1}"><i class="bi bi-chevron-right"></i></a>
              <a class="btn" href="/laptop/product?p=${page.totalPages - 1}"><i
                  class="bi bi-chevron-double-right"></i></a>
            </div>
          </div>
        </div>
        <jsp:include page="../layout/_footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
          integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
          </script>
          <script src="/js/danhmuc.js"></script>
      </body>

      </html>