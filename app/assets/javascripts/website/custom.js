$(document).on("ajaxComplete ready page:change",function() {	

  var contentHeight = $(window).height() - ($('.footer').outerHeight(true) + $('#navbar').outerHeight(true));
  $( ".mainContainer" ).css('min-height', contentHeight);

  $("#search_track").click(function(){
    $("#loader").show();
  }); 

  $('[data-toggle="tooltip"]').tooltip({html: true});

	// For Fancy Radio Button 
	if ($('.radioBtn input').length) 
	{
		$('.radioBtn label').click(function(){ 
			$('.radioBtn').each(function(){ 
				$('.radioBtn label').removeClass('active');
			});
			$('.radioBtn input:checked').each(function(){ 
				$(this).parent('label').addClass('active');
			});
		});
		$('.radioBtn input:checked').each(function(){ 
			$(this).parent('label').addClass('active');
		});
	}
});

$(document).ready(function(){

  $("#search_product").click(function(){
    $("#loader").show();
  });	

  loadScroll();
});

function loadScroll() {
  $('.scroll').jscroll({
    loadingHtml: '<img src="/assets/loading.gif" alt="Loading" />',
    autoTrigger: false
  });
}

$(window).resize(function(){
	var contentHeight = $(window).height() - ($('.footer').outerHeight(true) + $('#navbar').outerHeight(true));
	$( ".mainContainer" ).css('min-height', contentHeight);
});

function showHideDiv(divId) {
	if($('#' + divId).css('display') == 'none') {
		$('#' + divId).fadeIn(500);
	} else {
		$('#' + divId).fadeOut(500);
	}
}

function setScrollPosition(selectedId) {
  $('html,body').animate({scrollTop: ($("#" + selectedId).offset().top - 2) }, 'slow');
}

