$(function() {
		/* BOOTSNIPP FULLSCREEN FIX */
		if (window.location == window.parent.location) {
			$('#back-to-bootsnipp').removeClass('hide');
		}

		$('[data-toggle="tooltip"]').tooltip();

		$('#fullscreen').on('click', function(event) {
			event.preventDefault();
			window.parent.location = "http://bootsnipp.com/iframe/4l0k2";
		});
		$('a[href="#cant-do-all-the-work-for-you"]').on('click',
				function(event) {
					event.preventDefault();
					$('#cant-do-all-the-work-for-you').modal('show');
				})

		$('[data-command="toggle-search"]').on('click', function(event) {
			event.preventDefault();
			$(this).toggleClass('hide-search');

			if ($(this).hasClass('hide-search')) {
				$('.c-search').closest('.row').slideUp(100);
			} else {
				$('.c-search').closest('.row').slideDown(100);
			}
		})

		$('#contact-list').searchable({
			searchField : '#contact-list-search',
			selector : 'li',
			childSelector : '.col-xs-12',
			show : function(elem) {
				elem.slideDown(100);
			},
			hide : function(elem) {
				elem.slideUp(100);
			}
		})
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
