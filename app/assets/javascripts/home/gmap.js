// Initializing gmaps
var map;
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
  });

  var ctaLayer = new google.maps.KmlLayer({
    url: 'https://fixa-assets.s3.amazonaws.com/toronto.kml',
    map: map
  });

  // Get user location
  var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('You are here!');
      map.setCenter(pos);

    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());

    });

  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
map.setZoom(0);
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
      'Error: The Geolocation service failed.' :
      'Error: Your browser doesn\'t support geolocation.');

};


// Map activation on accordion click
var faqsMap = function() {

  var faqMap = $('#faq-accordion-map .faq-accordion h3');

  // Click
  faqMap.on('click', function(event){
    var $this = $(this);
    initMap();

  });

};

	var findsMap = function() {

		var findMap = $('#fh5co-offcanvass accordion-map a');

		// Click
		findMap.on('click', function(event){
			var $this = $(this);
			
			$('#faq-accordion-map').removeClass('active');
			$('#faq-accordion-map').find('.faq-body').slideUp(400, 'easeInOutExpo');

			if ( !$this.closest('#faq-accordion-map').find('.faq-body').is(':visible')) {
				$this.closest('#faq-accordion-map').addClass('active');
				$this.closest('#faq-accordion-map').find('.faq-body').slideDown(400, 'easeInOutExpo');
			} else {
				$this.closest('#faq-accordion-map').removeClass('active');
				$this.closest('#faq-accordion-map').find('.faq-body').slideUp(400, 'easeInOutExpo');
			}


			setTimeout(function(){
				// alert($this.closest('.faq-accordion.active').innerHeight());
				$('html, body').animate({
			        scrollTop: $this.closest('#faq-accordion-map' ).offset().top - 90
			    }, 500);
			}, 700);
			
			
			event.preventDefault();
			return false;

		});

	};

// CallBacks
$(function(){
  faqsMap();
  findsMap();
});
