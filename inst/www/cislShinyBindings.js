var shinyCislBinding = new Shiny.InputBinding();

$.extend(shinyCislBinding, {
  find: function(scope) {
    return $(scope).find(".CircularSlider");
  },
  initialize: function(el){
    $(el).circularSlider();
    $(el).data("circularSlider").$input.after(
        '<svg width="0" height="0">' +
        '<defs>' +
            '<radialGradient id="cisl-shiny-gradient" r="52%">' +
                '<stop offset="90%" stop-color="#fff" />' +
                '<stop offset="110%" stop-color="#dedede" />' +
            '</radialGradient>' +
            '</defs>' +
        '</svg>'
    );
  },
  getValue: function(el) {
    return $(el).data("circularSlider").get_value_array();
  },
  setValue: function(el, value) {
    $(el).data("circularSlider").update_slider_value(value[0], value[1]);
  },
  subscribe: function(el, callback) {
    $(el).data("circularSlider").onFinish = function() {
      callback();
    }
  },
  unsubscribe: function(el) {
    $(el).data("circularSlider").onFinish = null;
  }
});

Shiny.inputBindings.register(shinyCislBinding);

Shiny.addCustomMessageHandler("updateCisl", function(m) {
  $("#" + m.id).data("circularSlider").update_slider_value(m.value[0], m.value[1]);
  Shiny.setInputValue(m.id, m.value);
});
