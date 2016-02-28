// Highlights sidemenu list items in _nav.html.erb
$(document).ready(function(){
  $('.side-menu .navbar .side-menu-container .nav li').click(function(){
    $('.side-menu .navbar .side-menu-container .nav li').removeClass("active");
    $(this).addClass("active");
});
});

// Fixed double tap issue on ios devices
$(document).ready(function() {
  $('a').on('click touchend', function(e) {
    var el = $(this);
    var link = el.attr('href');
    window.location = link;
  });
});
