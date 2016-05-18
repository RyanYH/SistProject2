$(function() {
	$('.navbar-toggle-sidebar').click(function() {
		$('.navbar-nav').toggleClass('slide-in');
		$('.side-body').toggleClass('body-slide-in');
		$('#search').removeClass('in').addClass('collapse').slideUp(200);
	});

	$('#search-trigger').click(function() {
		$('.navbar-nav').removeClass('slide-in');
		$('.side-body').removeClass('body-slide-in');
		$('.search-input').focus();
	});
});

// <--------------------------------->

$('.nav-tabs-dropdown').each(function(i, elm) {

	$(elm).text($(elm).next('ul').find('li.active a').text());
});

$('.nav-tabs-dropdown').on('click', function(e) {

	e.preventDefault();
	$(e.target).toggleClass('open').next('ul').slideToggle();

});

$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
	e.target // newly activated tab
	e.relatedTarget // previous active tab
})

$(function() {
	$('.nav-tabs-sticky').stickyTabs();
});

function homeTab() {
	location.href = "home.do";
	$("#side-menu").empty();
}
function socialTab() {
	location.href = "social.do";
	$("#side-menu").empty();
}
function tipTab() {
	location.href = "tip.do";
	$("#side-menu").empty();
}
function itemTab() {
	location.href = "bestitem.do";
	$("#side-menu").empty();
}
function adminTab() {
	location.href = "admin.do";
	$("#side-menu").empty();
}
function mypageTab() {
	location.href = "mypage.do";
	$("#side-menu").empty();
	var id = $("#idbox").val();
	$("#side-menu").append(
			'<li><a href=\"#delete.do?id=' + id + '\">　　탈퇴하기　　</a></li>');
}
