# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# This controls the navbar toggle in user show.html.erb
# Navbar
$ ->
  $(".navbar-expand-toggle").click ->
    $(".app-container").toggleClass "expanded"
    $(".navbar-expand-toggle").toggleClass "fa-rotate-90"

  $(".navbar-right-expand-toggle").click ->
    $(".navbar-right").toggleClass "expanded"
    $(".navbar-right-expand-toggle").toggleClass "fa-rotate-90"

# $ ->
#   $('select').select2();

# Bootstrap Toggle
$ ->
  $('.toggle-checkbox').bootstrapSwitch({
    size: "small"
    });


# Match Height
$ ->
  $('.match-height').matchHeight();


$ ->
  $(".side-menu .nav .dropdown").on 'show.bs.collapse', ->
    $(".side-menu .nav .dropdown .collapse").collapse('hide')
    




    
    
    