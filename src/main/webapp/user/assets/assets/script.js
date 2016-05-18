jQuery(document).ready(function($) {

	$(".scroll a, .navbar-brand, .gototop,.explore").click(function(event) {
		event.preventDefault();
		$('html,body').animate({
			scrollTop : $(this.hash).offset().top
		}, 600, 'swing');
		$(".scroll li").removeClass('active');
		$(this).parents('li').toggleClass('active');
	});
});

var wow = new WOW({
	boxClass : 'wowload', // animated element css class (default is wow)
	animateClass : 'animated', // animation css class (default is animated)
	offset : 0, // distance to the element when triggering the animation (default is 0)
	mobile : true, // trigger animations on mobile devices (default is true)
	live : true
// act on asynchronously loaded content (default is true)
});
wow.init();

$('.carousel').swipe({
	swipeLeft : function() {
		$(this).carousel('next');
	},
	swipeRight : function() {
		$(this).carousel('prev');
	},
	allowPageScroll : 'vertical'
});

// map

google.maps.event.addDomListener(window, 'load', init);
var map;
function init() {
	var mapOptions = { //@37.5530836,126.9364692
		center : new google.maps.LatLng(37.5530836, 126.9364692),
		zoom : 16,
		zoomControl : true,
		zoomControlOptions : {
			style : google.maps.ZoomControlStyle.DEFAULT,
		},
		disableDoubleClickZoom : true,
		mapTypeControl : true,
		mapTypeControlOptions : {
			style : google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
		},
		scaleControl : true,
		scrollwheel : false,
		panControl : true,
		streetViewControl : true,
		draggable : true,
		overviewMapControl : true,
		overviewMapControlOptions : {
			opened : false,
		},
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		styles : [ {
			"stylers" : [ {
				"visibility" : "off"
			} ]
		}, {
			"featureType" : "road",
			"stylers" : [ {
				"visibility" : "on"
			}, {
				"color" : "#ffffff"
			} ]
		}, {
			"featureType" : "road.arterial",
			"stylers" : [ {
				"visibility" : "on"
			}, {
				"color" : "#fee379"
			} ]
		}, {
			"featureType" : "road.highway",
			"stylers" : [ {
				"visibility" : "on"
			}, {
				"color" : "#fee379"
			} ]
		}, {
			"featureType" : "landscape",
			"stylers" : [ {
				"visibility" : "on"
			}, {
				"color" : "#f3f4f4"
			} ]
		}, {
			"featureType" : "water",
			"stylers" : [ {
				"visibility" : "on"
			}, {
				"color" : "#7fc8ed"
			} ]
		}, {}, {
			"featureType" : "road",
			"elementType" : "labels",
			"stylers" : [ {
				"visibility" : "off"
			} ]
		}, {
			"featureType" : "poi.park",
			"elementType" : "geometry.fill",
			"stylers" : [ {
				"visibility" : "on"
			}, {
				"color" : "#83cead"
			} ]
		}, {
			"elementType" : "labels",
			"stylers" : [ {
				"visibility" : "off"
			} ]
		}, {
			"featureType" : "landscape.man_made",
			"elementType" : "geometry",
			"stylers" : [ {
				"weight" : 0.9
			}, {
				"visibility" : "off"
			} ]
		} ],
	}
	var mapElement = document.getElementById('map');
	var map = new google.maps.Map(mapElement, mapOptions); //@37.5530836,126.9364692
	var locations = [ [ 'SIST', 'Seoul', '121 1212 2121', 'info@coffee.com',
			'coffee.com', 37.5530836, 126.9364692,
			'https://mapbuildr.com/assets/img/markers/solid-pin-blue.png' ] ];
	for (i = 0; i < locations.length; i++) {
		if (locations[i][1] == 'undefined') {
			description = '';
		} else {
			description = locations[i][1];
		}
		if (locations[i][2] == 'undefined') {
			telephone = '';
		} else {
			telephone = locations[i][2];
		}
		if (locations[i][3] == 'undefined') {
			email = '';
		} else {
			email = locations[i][3];
		}
		if (locations[i][4] == 'undefined') {
			web = '';
		} else {
			web = locations[i][4];
		}
		if (locations[i][7] == 'undefined') {
			markericon = '';
		} else {
			markericon = locations[i][7];
		}
		marker = new google.maps.Marker(
				{
					icon : markericon,
					position : new google.maps.LatLng(locations[i][5],
							locations[i][6]),
					map : map,
					title : locations[i][0],
					desc : description,
					tel : telephone,
					email : email,
					web : web
				});
		if (web.substring(0, 7) != "http://") {
			link = "http://" + web;
		} else {
			link = web;
		}
		bindInfoWindow(marker, map, locations[i][0], description, telephone,
				email, web, link);
	}
	function bindInfoWindow(marker, map, title, desc, telephone, email, web,
			link) {
		var infoWindowVisible = (function() {
			var currentlyVisible = false;
			return function(visible) {
				if (visible !== undefined) {
					currentlyVisible = visible;
				}
				return currentlyVisible;
			};
		}());
		iw = new google.maps.InfoWindow();
		google.maps.event
				.addListener(
						marker,
						'click',
						function() {
							if (infoWindowVisible()) {
								iw.close();
								infoWindowVisible(false);
							} else {
								var html = "<div style='color:#000;background-color:#fff;padding:5px;width:150px;'><h4>"
										+ title
										+ "</h4><p>"
										+ desc
										+ "<p><p>"
										+ telephone
										+ "<p><a href='mailto:"
										+ email
										+ "' >"
										+ email
										+ "<a><a href='"
										+ link
										+ "'' >"
										+ web
										+ "<a></div>";
								iw = new google.maps.InfoWindow({
									content : html
								});
								iw.open(map, marker);
								infoWindowVisible(true);
							}
						});
		google.maps.event.addListener(iw, 'closeclick', function() {
			infoWindowVisible(false);
		});
	}
}
/*function layer_open(el) {
	var temp = $('#' + el);
	var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		temp.fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height())
		temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
	else
		temp.css('top', '0');
	if (temp.outerWidth() < $(document).width())
		temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
	else
		temp.css('left', '-250px');
	temp.find('a.cbtn').click(function(e) {
		if (bg) {
			$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
		} else {
			temp.fadeOut();
		}
		e.preventDefault();
	});
	$('.layer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('.layer').fadeOut();
		e.preventDefault();
	});
}
}*/