if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

// JQuery Validation UI for Twitter Bootstrap
function highlightErrorField(element, errorClass, validClass) {
    $(element).parents('div.control-group').addClass('error')
}

function unhighlightErrorField(element, errorClass, validClass) {
    $(element).parents('div.control-group').removeClass('error')
}
