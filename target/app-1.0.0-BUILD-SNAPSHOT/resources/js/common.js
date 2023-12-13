$(document).ready(function() {
    $(document).on('click', '.top_btn a', function() {
        event.preventDefault();
        if($(window).scrollTop() != 0) {
            $('html, body').animate({
                scrollTop: 0
            }, 500);
        }
    });

    $(window).scroll(function() {
        if($(window).scrollTop() < 100) {
            $('.header').css({
                top: 0,
                boxShadow: "0px 2px 3px 0px #05ccc5"
            });
        }
    });

    $(window).on('mousewheel DOMMouseScroll', function(){
        if(event.wheelDelta < 0) {
            $('.header').css({
                top: -$('.header').height(),
                boxShadow: "none"
            });
        }
        else if(event.wheelDelta > 0) {
            $('.header').css({
                top: 0,
                boxShadow: "0px 2px 3px 0px #05ccc5"
            });
        }
    });

    $('.nav > ul').on('mousewheel DOMMouseScroll', function(){
        if(event.wheelDelta < 0) {
            $('.nav > ul').scrollLeft($('.nav > ul').scrollLeft() + 20);
        }
        else if(event.wheelDelta > 0) {
            $('.nav > ul').scrollLeft($('.nav > ul').scrollLeft() - 20);
        }

        return false;
    });
    

});
