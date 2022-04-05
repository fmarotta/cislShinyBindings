var cislBinding = new Shiny.InputBinding();

$.extend(cislBinding, {

  find: function(scope) {
    return $(scope).find("input.circularSlider");
  },

  initialize: function(el){
    $(el).circularSlider();
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
