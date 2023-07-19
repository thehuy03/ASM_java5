<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error 404</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/Error.css">
    </head>

    <body>
        <section class="container-fluid px-0">
            <article id="insMain" class="container-md">
                <span class='error-num'>4</span>
                <div class='eye'></div>
                <span class='error-num'>4</span>
                <p class='sub-text'>Xin lỗi! Hiện tại chúng tôi không tìm thấy trang này. <i>Vui lòng</i> quay lại trang
                    chủ.</p>
                <a href='/home'>Go back</a>
            </article>
        </section>
        <script src="/js/jquery-3.7.0.min.js"></script>
        <script src="/js/bootstrap.bundle.min.js"></script>
        <script>
            $('body').mousemove(function (event) {
                var e = $('.eye');
                var x = (e.offset().left) + (e.width() / 2);
                var y = (e.offset().top) + (e.height() / 2);
                var rad = Math.atan2(event.pageX - x, event.pageY - y);
                var rot = (rad * (180 / Math.PI) * -1) + 180;
                e.css({
                    '-webkit-transform': 'rotate(' + rot + 'deg)',
                    'transform': 'rotate(' + rot + 'deg)'
                });
            });
        </script>
    </body>

    </html>