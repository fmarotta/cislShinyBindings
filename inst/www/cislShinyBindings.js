var cislBinding = new Shiny.InputBinding();


$.extend(cislBinding, {
  find: function(scope) {
    return $(scope).find(".CircularSlider");
  },
  initialize: function(el){
    $(el).circularSlider();
    $(el).data("circularSlider").$input.after(
        '<svg width="0" height="0">' +
        '<defs>' +
            '<radialGradient id="cisl-shiny-gradient" r="53%">' +
                '<stop offset="90%" stop-color="#fff" />' +
                '<stop offset="110%" stop-color="#dedede" />' +
            '</radialGradient>' +
            '</defs>' +
        '</svg>'
    )
  },
  getValue: function(el) {
    return $(el).data("circularSlider").get_value_array();
  },
  subscribe: function(el, callback) {
      $(el).data("circularSlider").onFinish = function() {
          callback(true);
      }
  }
});

Shiny.inputBindings.register(cislBinding);
