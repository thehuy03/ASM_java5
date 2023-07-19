<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <div class="position-fixed top-0 end-50 p-3" style="transform: translate(50%,20%);">
        <div id="toast-success" class="toast" style="width: 368px;">
            <div class="toast-header">
                <i class="bi bi-check-circle-fill text-success me-2" style="font-size: 1.5rem;"></i>
                <strong class="me-auto">Tin Học Ánh Trăng</strong> <small></small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body bg-white d-flex px-2">
                <span class="fw-lighter toast-title me-auto align-self-center"></span>
            </div>
        </div>
    </div>
    <div class="position-fixed top-0 end-50 p-3" style="transform: translate(50%,20%);">
        <div id="toast-update" class="toast" style="width: 368px;">
            <div class="toast-header">
                <i class="bi bi-exclamation-octagon-fill text-warning me-2" style="font-size: 1.5rem;"></i>
                <strong class="me-auto">Tin Học Ánh Trăng</strong> <small></small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body bg-white d-flex px-2">
                <span class="fw-lighter toast-title me-auto align-self-center"></span>
                <button type="button" id="btn-update" class="btn btn-primary p-1" style="font-size: 1rem;">
                    Cập nhật
                </button>
            </div>
        </div>
    </div>
    <div class="position-fixed top-0 end-50 p-3" style="transform: translate(50%,20%);">
        <div id="toast-warning" class="toast">
            <div class="toast-header">
                <i class="bi bi-exclamation-diamond-fill text-danger me-2" style="font-size: 1.5rem;"></i>
                <strong class="me-auto">Tin Học Ánh Trăng</strong> <small></small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body bg-white">
                <span class="fw-lighter toast-title"></span>
            </div>
        </div>
    </div>