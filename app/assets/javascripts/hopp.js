var clock = null;

var all_done = function () {
  $.mobile.changePage( "../end", { transition: "flip"});
};

$(document).ready(function () {
  $(document).on('datebox', '#mydate', function (e, passed) {
    console.log('datebox');
    if ( passed.method === 'close' ) {
      clearTimeout(clock);

      var parts = $(this).val().split(':');

      var duration = parseInt(parts[0]) * 60 + parseInt(parts[1]);
      clock = setTimeout(all_done, duration * 1000); // Wait duration (in milliseconds);

      // navigate to first hop
    $.mobile.changePage( "/content/1", { transition: "flip"});

    //and bind duration to the window
      window.counterTime = duration;
      update_timer(); // kick things off
    };
  });
});

$(document).ready(function() {
  // Bind the swipeHandler callback function to the swipe event
  $(window).on( "swipeleft", swipeHandler );

  // Callback function references the target and refreshes the page
  function swipeHandler( event ){
    if (window.counterTime) {
      $.mobile.changePage('/content/' + window.counterTime, {reloadPage: true})
    }
  }
});

$(document).off('click', '.bookmark').on('click', '.bookmark', function(event) {
  var $this = $(this);
  $.ajax({
    type: 'post',
    url: '/bookmarks',
    data: {
        url: window.current_url
    }
  }).done(function () {
    // Update the button.
    $this.find('.ui-btn-text').text('Hoppmarked')
    $this.find('.ui-icon .ui-icon-star').css('background-color', 'yellow');
  });
});


$(document).on('click', '#go-right', function () {
  $(window).trigger('swipeleft');
  return false;
});

var update_timer = function () {
  window.counterTime = window.counterTime - 1;
  var str = parseInt(window.counterTime / 60) + " minutes " + window.counterTime % 60 + " seconds";
  $('#timer').text(str);
  if (window.counterTime > 0) {
      setTimeout(update_timer, 1000);
  }
}