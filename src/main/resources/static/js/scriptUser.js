// start code Flickity top-bar
var elemTopBar = document.querySelector(".top-bar");
var flkty = new Flickity(elemTopBar, {
  prevNextButtons: false,
  pageDots: false,
  contain: true,
  lazyLoad: true,
});
// end code Flickity top-bar

// start code Flickity itemSlide-carousel
var elemItemSlideCarousel = document.querySelector(".itemSlide-carousel");
var flkty = new Flickity(elemItemSlideCarousel, {
  pageDots: false,
  contain: true,
  lazyLoad: true,
  draggable: true,
  autoPlay: 2000,
});
// end code Flickity itemSlide-carousel

// start code Flickity itemSlide-carousel
var elem = document.querySelector(".homeProduct-content-carousel");
var flkty = new Flickity(elem, {
  pageDots: false,
  contain: true,
  groupCells: true,
  autoPlay: 2000,
});
// end code Flickity itemSlide-carousel

// start Jquery
$(document).ready(function () {
  // showpassword form dangnhap
  $(".btn-show-pw").on("click", "i", function () {
    if (!$(this).hasClass("bi-eye-slash")) {
      $(this)
        .toggleClass("bi-eye bi-eye-slash")
        .closest("div")
        .children("input")
        .prop("type", "password");
    } else {
      $(this)
        .toggleClass("bi-eye bi-eye-slash")
        .closest("div")
        .children("input")
        .prop("type", "text");
    }
  });

  // change icon showpassword
  $(".btn-show-pw")
    .on("mouseenter", function () {
      $(this).toggleClass("d-block");
    })
    .on("mouseleave", function () {
      $(this).toggleClass("d-none");
    });

  // validate phone
  $.validator.addMethod(
    "phone",
    function (value) {
      return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(value);
    },
    "Điện thoại chưa đúng đinh dạng"
  );

  // validate email
  $.validator.addMethod(
    "email",
    function (value) {
      return /[^@]+@[^@]+\.[a-zA-Z]{2,6}/.test(value);
    },
    "Vui lòng nhập đúng đinh dạng abc@domain.tld"
  );

  // validate form dangky
  $("#form-dangky").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      userPhone: {
        required: true,
        phone: true,
      },
      userName: {
        required: true,
        minlength: 6,
      },
      userEmail: {
        required: true,
        email: true,
      },
      userPassword: {
        required: true,
        minlength: 6,
      },
      confirmPassword: {
        required: true,
        equalTo: "#form-dangky input[name='userPassword']",
      },
    },
    messages: {
      userPhone: {
        required: "vui lòng nhập số điện thoại",
      },
      userName: {
        required: "Vui lòng nhập tên",
        minlength: "vui lòng nhập trên 6 kí tự",
      },
      userEmail: {
        required: "Vui lòng nhập gmail",
      },
      userPassword: {
        required: "Vui lòng nhập password",
        minlength: "vui lòng nhập trên 6 kí tự",
      },
      confirmPassword: {
        required: "Vui lòng nhập lại mật khẩu",
        equalTo: "Mật khẩu không trùng khớp",
      },
    },
  });

  // validate form dangnhap
  $("#form-dangnhap").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      userPhone: {
        required: true,
        phone: true,
      },
      userPassword: {
        required: true,
        minlength: 6,
      },
    },
    messages: {
      userPhone: {
        required: "vui lòng nhập số điện thoại",
      },
      userPassword: {
        required: "Vui lòng nhập password",
        minlength: "vui lòng nhập trên 6 kí tự",
      },
    },
  });
});

// ajax form dangky
$("#form-dangky").on("submit", function (event) {
  event.preventDefault();
  if ($("#form-dangky").valid()) {
    $("#btn-dangky").text("Vui lòng chờ...").attr("disabled", true);
    console.log($("#form-dangky input[name='userPhone]'").val());
    $.ajax({
      url: "/user/register",
      method: "POST",
      data: {
        userPhone: $("#form-dangky input[name='userPhone']").val(),
        userName: $("#form-dangky input[name='userName']").val(),
        userEmail: $("#form-dangky input[name='userEmail']").val(),
        userPassword: $("#form-dangky input[name='userPassword']").val(),
      },
      success: function (resultText) {
        bootstrapToast(
          "#toast-success",
          "Xin chào, tài khoản " + resultText.userPhone + " đã được kích hoạt",
          2000
        );

        // wait toast
        $("#btn-dangky").text("đăng ký").attr("disabled", false);
        $("#form-dangky input").val("");

        // Login fast
        $("label[for='btn-login']").on("click", function (event) {
          $("#form-dangnhap")
            .find("input[name='userPhone']")
            .val(resultText.userPhone)
            .end()
            .find("input[name='userPassword']")
            .val(resultText.userPassword);
        });
      },
      error: function (jqXHR, textStatus) {
        if (textStatus == "error") {
          bootstrapToast(
            "#toast-warning",
            "Xin chào, số điện thoại bạn vừa đăng ký đã tồn tại",
            2000
          );

          // wait toast
          $("#btn-dangky").text("đăng ký").attr("disabled", false);
        }
      },
    });
  }
});

// modalDangnhap show when login unsuccessful
$(".userErr").each(function () {
  if ($(this).text().length > 0) {
    bootstrap.Modal.getOrCreateInstance($("#modalDangnhap")).show();
  }
});

function getDateNow() {
  let date = new Date();
  let dateString =
    (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) +
    "/" +
    (date.getMonth() + 1 < 10
      ? "0" + (date.getMonth() + 1)
      : date.getMonth() + 1) +
    "/" +
    date.getUTCFullYear() +
    " " +
    (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) +
    ":" +
    (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) +
    ":" +
    (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
  return dateString;
}

function bootstrapToast(element, text, delay) {
  let option = {
    animation: true,
    delay: delay,
  };
  $(element).find(".toast-title").text(text);
  $(element).find("small").text(getDateNow());
  bootstrap.Toast.getOrCreateInstance($(element), option).show();
}

// end Jquery
