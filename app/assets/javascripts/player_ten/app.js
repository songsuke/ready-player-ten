var ready;

ready = function () {
  'use strict';

  if (!window.PlayerTen) {
    window.PlayerTen = {};
  }

  var PlayerTen = window.PlayerTen;
    PlayerTen.Init = (function () {
      PlayerTen.App.TimeTicker.init();
    })();
};
document.addEventListener("turbolinks:load", function() {
  ready()
});
