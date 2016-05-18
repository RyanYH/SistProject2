	$(document).ready(function() {
		$('.star').click(function() {
			if ($(this).attr('src').match("images/night.png")) {
				$(this).attr('src', "images/shape.png");
			} else {
				$(this).attr('src', "images/night.png");
			}
		});
		$('.toggle').click(function() {
			// Switches the forms
			$('.form').animate({
				height : "toggle",
				'padding-top' : 'toggle',
				'padding-bottom' : 'toggle',
				opacity : "toggle"
			}, "slow");
		});
	});
	window.alert = function() {
	};
	var defaultCSS = document.getElementById('bootstrap-css');
	function changeCSS(css) {
		if (css)
			$('head > link')
					.filter(':first')
					.replaceWith(
							'<link rel="stylesheet" href="'+ css +'" type="text/css" />');
		else
			$('head > link').filter(':first').replaceWith(defaultCSS);
	}
	$(document).ready(function() {
		var iframe_height = parseInt($('html').height());
		window.parent.postMessage(iframe_height, 'http://bootsnipp.com');
	});
	$('.fab').hover(function() {
		$(this).toggleClass('active');
	});
	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})