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

      // Replace this with moment.js?
      var duration = parseInt(parts[0]) * 60 + parseInt(parts[1]);
      var duration_milliseconds = duration * 100;
      console.log( $(this).val(), duration, duration_milliseconds);
      clock = setTimeout(all_done, duration * 1000); // Wait duration (in milliseconds);

      // navigate to first hop -- check how to navigate within jqM
     $.mobile.changePage( "/content/1", { transition: "flip"});

    }
  });
});

$(document).ready(function() {
  // Bind the swipeHandler callback function to the swipe event
  $(".content").on( "swipeleft", swipeHandler );

  // Callback function references the target and refreshes the page
  function swipeHandler( event ){
    $.mobile.changePage('/content/' + Math.random(), {reloadPage: true})
  }
});
