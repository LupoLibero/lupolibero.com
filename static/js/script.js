/* ----------------- Start JS Document ----------------- */
var $ = jQuery.noConflict();

$(document).ready(function($) {
  var $hiddenHeader = $('.hidden-header');
  var $backToTop    = $('.back-to-top');
  var $html         = $('html, body');
  var $topBar       = $('.top-bar');
  var $header       = $('header');
  var $navbarBrand  = $('.navbar-brand');
  var offset        = 200;
  var duration      = 500;

  /*----------------------------------------------------*/
  /*	Hidder Header
  /*----------------------------------------------------*/
  var $headerHeight = $header.height();
  $hiddenHeader.css({ 'height' : $headerHeight  + "px" });

  /*----------------------------------------------------*/
  /*	Back Top Link
  /*----------------------------------------------------*/
  $(window).scroll(function() {
    if ($(this).scrollTop() > offset) {
      $backToTop.fadeIn(400);
    } else {
      $backToTop.fadeOut(400);
    }
  });
  $backToTop.on('click', function(event) {
    event.preventDefault();
    $html.animate({scrollTop: 0}, 600);
    return false;
  });

  /*----------------------------------------------------*/
  /*	Sticky Header
  /*----------------------------------------------------*/
  (function() {
    var docElem        = document.documentElement;
    var didScroll      = false;
    var changeHeaderOn = 70;

    function init() {
      window.addEventListener( 'scroll', function() {
        if( !didScroll ) {
          didScroll = true;
          setTimeout( scrollPage, 250 );
        }
      }, false );
    }

    function scrollPage() {
      var sy = scrollY();
      if ( sy >= changeHeaderOn ) {
        $topBar.stop().slideUp(300);
        $header.addClass('fixed-header');
        $navbarBrand.css({
          'padding-top':    19 + 'px',
          'padding-bottom': 19 + 'px',
        });
      }
      else {
        $topBar.stop().slideDown(300);
        $header.removeClass('fixed-header');
        $navbarBrand.css({
          'padding-top':     27 + 'px',
          'padding-bottom':  27 + 'px',
        });
      }
      didScroll = false;
    }

    function scrollY() {
      return window.pageYOffset || docElem.scrollTop;
    }

    init();
  })();
});
