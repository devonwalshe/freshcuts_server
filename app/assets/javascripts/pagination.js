var bind_scroll = function() {
  console.log('bind setup');
  if ($('.search-pagination').size() > 0) {
    return $(window).on('scroll', function() {
      //console.log('scrolling function')
      var more_results_url = $('.pagination .next a').attr('href') + "&search_type=scroll";
      if (more_results_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 30))) {
        $('.pagination').html('<div class="loading_spinner"><img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />Loading more results</div>');
        $.getScript(more_results_url);
      }
      return;
    });
  }
};

$(document).ready(function(){
    console.log("document ready");
    bind_scroll();

});
