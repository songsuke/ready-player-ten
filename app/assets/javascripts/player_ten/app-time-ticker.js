(function (window) {
  'use strict';

  if (!window.PlayerTen) {
    window.PlayerTen = {};
  }
  var PlayerTen = window.PlayerTen;
  PlayerTen.App = window.PlayerTen.App || {};

  PlayerTen.App.TimeTicker = {
    _setupCountdownTimer: function(timeLeft) {
      var self = this;
      var downloadTimer = setInterval(function() {
        timeLeft--;
        document.getElementById("countDown").textContent = timeLeft;
        self._displayImage();
        self._updateTimerField(timeLeft);
        if(timeLeft <= 1) {
          clearInterval(downloadTimer);
          self._setupCountdownTimer(11);
        }
      },1000);
    },
    _displayImage: function() {
      var elemImages = document.getElementsByClassName('image-data');
      var amountOfImages = elemImages.length;
      this.position = (this.position === amountOfImages - 1) ? 0 : this.position + 1;
      document.getElementById("displayImage").src = elemImages[this.position].dataset.imageUrl;
      var blobId = elemImages[this.position].dataset.blobId;
      this._updateBlobField(blobId);
    },
    _updateTimerField: function(timeLeft) {
      var elemTimer = document.getElementById('play_timer');
      elemTimer.value = timeLeft;
    },
    _updateBlobField: function(blobId) {
      document.getElementById('play_blob').value = blobId;
    },
    init: function () {
      this.position = -1;
      this._setupCountdownTimer(11);
    }
  };
}(window));
