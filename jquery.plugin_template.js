(function($) {
  $.fn.plugin = function(options) {
    var opts = $.extend({}, $.fn.plugin.defaults, options);
    return this.each(function() {
      $this = $(this);
      // ...
    });
  };

  function private_function() {
  };

  // plugin defaults
  $.fn.plugin.defaults = {
  };

  // define and expose our format function
  $.fn.plugin.public_function = function() {
  };

})(jQuery);
