(function() {
  $(document).ready(function() {
    if ($(window).width() > 768) {
      $.stellar({
        horizontalScrolling: false,
        verticalScrolling: true,
        hideDistantElements: false,
        responsive: true
      });
    }
    $('#show-gifs').click(function(e) {
      e.preventDefault();
      $('#gif').removeClass('hidden');
      $('#webm').addClass('hidden');
      return $('#gif img').each(function() {
        var img;
        img = $(this).attr('data-src');
        return $(this).attr('src', img);
      });
    });
    return $('#show-webms').click(function(e) {
      e.preventDefault();
      $('#webm').removeClass('hidden');
      return $('#gif').addClass('hidden');
    });
  });

}).call(this);
