<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="nav nav-tabs justify-content-center" id="myTab"
	role="tablist">
	<li class="nav-item" role="presentation">
		<button class="nav-link ${TabReport=='1'?'active':''}"
			onclick="location.href=window.location.href.split('?')[0]+'?TabReport=1'"
			id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
			type="button" role="tab" aria-controls="home-tab-pane">Best
			selling product</button>
	</li>
	<li class="nav-item" role="presentation">
		<button class="nav-link ${TabReport=='2'?'active':''}"
			onclick="location.href=window.location.href.split('?')[0]+'?TabReport=2'"
			id="profile-tab" data-bs-toggle="tab"
			data-bs-target="#profile-tab-pane" type="button" role="tab"
			aria-controls="profile-tab-pane">Store revenue</button>
	</li>
	<li class="nav-item" role="presentation">
		<button class="nav-link ${TabReport=='3'?'active':''}"
			onclick="location.href=window.location.href.split('?')[0]+'?TabReport=3'"
			id="contact-tab" data-bs-toggle="tab"
			data-bs-target="#contact-tab-pane" type="button" role="tab"
			aria-controls="contact-tab-pane">Product statistics</button>
	</li>
</ul>
<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade ${TabReport=='1'?'show active':''}"
		id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
		tabindex="1">
		<%@include file="BestSell.jsp"%>
	</div>
	<div class="tab-pane fade ${TabReport=='2'?'show active':''}"
		id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab"
		tabindex="2">
		<%@include file="StoreRevenue.jsp"%>
	</div>
	<div class="tab-pane fade ${TabReport=='3'?'show active':''}"
		id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab"
		tabindex="3">
		<%@include file="ProductStatistics.jsp"%>
	</div>
</div>