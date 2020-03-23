$(document).ready(function () {
    $(window).scroll(function () {
        if ($(window).scrollTop() > 300) {
            $('nav').addClass('black');
        } else {
            $('nav').removeClass('black');
        }
    });
    $('.menu, .overlay').click(function () {
        $('.menu').toggleClass('clicked');
        $('#nav').toggleClass('show');
    });
})

$('.carousel').carousel({
    interval: 2000
})


