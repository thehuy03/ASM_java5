<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="card">
    <div class="card-body">
        <div class="row d-flex justify-content-md-between mx-2">		
            <a href="#" class="button col-md-6 btn btn-colour-1">TIẾP TỤC MUA SẢN PHẨM</a>
            <a href="#" class="button col-md-6 btn btn-outline">THANH TOÁN</a>
        </div>
        <div class="form-floating">
          Chú thích
          <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
          <label for="floatingTextarea"></label>
        </div>
    </div>
</div>


<style >
  .quantity > input{
    width: 50px;
  }

  .button{
    width: 150px;
      font-size: 9px;
      font-weight: null;
  }
  
  .text{
    font-size: 12px;
  }
  
  .btn-outline {
    color: #4fbfa8;
    background-color: #ffffff;
    border-color: #4fbfa8;
    font-weight: bold;
    letter-spacing: 0.05em;
  }
  
  .btn-outline {
    color: #ff0000;
    background-color: #ffffff;
    border-color: #ff0000;
    font-weight: bold;
    border-radius: 30px;
  }
  
  .btn-outline:hover,
  .btn-outline:active,
  .btn-outline:focus,
  .btn-outline.active {
    background: #ff0000;
    color: #ffffff;
    border-color:#ff0000;
    border-radius: 30px;
  
  }
   
  .btn-colour-1 {
    color: #fff;
    background-color: #e10f0f;
    border-color: #e10f0f;
    font-weight: bold;
    letter-spacing: 0.05em;
    border-radius: 30px;
  }
  
  .btn-colour-1:hover,
  .btn-colour-1:active,
  .btn-colour-1:focus,
  .btn-colour-1.active {
    /* let's darken #004E64 a bit for hover effect */
    background: #ff0000;
    color: #ffffff;
    border-color: #ff0000;
  }
  
  </style>