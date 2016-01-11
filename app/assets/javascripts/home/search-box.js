($(function() {
    $("#search-box").hide();
    $(".element").click(function() {
      $(".element").toggleClass("hover");
      $("#search-box").slideToggle();
    });
}));