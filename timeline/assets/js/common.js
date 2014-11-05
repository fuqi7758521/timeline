$(function() {
		toastr.options = {
	  			 "closeButton": true,
				  "debug": false,
				  "positionClass": "toast-top-right",
				  "onclick": null,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "2000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "slideDown",
				  "hideMethod": "slideUp"
		};
	    var msg = $("#msg").val();
	    if(msg != ''){
			toastr.warning(msg);
		}
	    
	    // Focus state for append/prepend inputs
	    $('.input-group').on('focus', '.form-control', function () {
	      $(this).closest('.input-group, .form-group').addClass('focus');
	    }).on('blur', '.form-control', function () {
	      $(this).closest('.input-group, .form-group').removeClass('focus');
	    });
	    
	});