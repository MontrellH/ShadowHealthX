// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
$(document).ready(function(){
    console.log('Working');
    // var buttonState=Boolean(localStorage.getItem("button-state"));
    // $(".good_dog_btn").attr('disabled',buttonState);

});


$(function() {
	$('[data-popup-open]').on('click', function(e) {
		var targeted_popup_class = jQuery(this).attr('data-popup-open');
		$('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
        e.preventDefault();
        $('.before-content').addClass('content'); //adding frosted glass effect
        $('.login-form-container').css('visibility', 'hidden');
        $('.registration-popup').css("display","block");
    });

    $('.login-form-input').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })
    });

    function showValidate(input) {
        var thisAlert = $(input).parent();
        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();
        $(thisAlert).removeClass('alert-validate');
    }

    var input = $('.login-form-input-validate .login-form-input');
    $('.login-form-exclusive').on('submit',function(){
        var check = true;
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }
        if(check == true) {
            $.post('/sessions');
        }
        return check;
    });


    $('.login-form .login-form-input').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    $('.signup-form-select').on('click',function(){
        var selectedOption = $(this).val();
        if(selectedOption == "sh") {
            $('.po-form').css('display','none');
            $('.sh-form').css('display','block');
        } else if(selectedOption == "po") {
            $('.sh-form').css('display','none');
            $('.po-form').css('display','block');
        } else if(selectedOption == "in") {
            $('.sh-form').css('display','none');
            $('.po-form').css('display','none');
        }
    });

    $('.signup-form-shelter-city').on('focusout',function(){
        var cityname = $(this).val();
        $.ajax({
            type: "get",
            url: "/shelter_manipulations",
            data: {
                city: cityname
            },
            success:function(data) {
                console.log(data);
                var i;
                var $select = $("#shelter_name");
                console.log($select);
                $.each(data, function(i, el) {
                    console.log(el);
                    $select.append($("<option />", { text: el.name }));
                });
            }
          });
        $('.signup-form-shelter-container').css('display','block');
    });

//     $('.good_dog_btn').on('click',function(){
//        $(this).attr("disabled", true);
//        localStorage.setItem("button-state", 'true');
// });


});
