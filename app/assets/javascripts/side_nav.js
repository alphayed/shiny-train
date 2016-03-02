// Highlights sidemenu list items in _nav.html.erb
$(document).ready(function(){
  $('.side-menu .navbar .side-menu-container .nav li').click(function(){
    $('.side-menu .navbar .side-menu-container .nav li').removeClass("active");
    $(this).addClass("active");
});
});

// Fix double tap issue on ios devices
$(document).ready(function() {
  $('#side-menu > a').on('click touchstart', function(e) {
    var el = $(this);
    var link = el.attr('href');
    window.location = link;
  });
});
// $navbar-nav.on('touchstart mouseenter focus', function(e) {
//   if(e.type == 'touchstart') {
//     // Don't trigger mouseenter even if they hold
//     e.stopImmediatePropagation();
//     // If $item is a link (<a>), don't go to said link on mobile, show menu instead
//     e.preventDefault();
//   }
// });
