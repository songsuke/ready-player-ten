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
        self._displayImage();
        timeLeft--;
        document.getElementById("countDown").textContent = timeLeft;
        self._updateTimerField(timeLeft);
        if(timeLeft <= 1) {
          clearInterval(downloadTimer);
          self._setupCountdownTimer(11);
        }
      },1000);
    },
    _displayImage: function() {
      var amountOfImages = this.elemImages.length;
      this.position = (this.position === amountOfImages - 1) ? 0 : this.position + 1;
      this.elemImages[this.position].setAttribute('style', 'display:block');

      if (this.position === 0 && this.elemImages.length !== 1) {
        this.elemImages[amountOfImages - 1].setAttribute('style', 'display:none');
      } else if (this.elemImages.length !== 1) {
        this.elemImages[this.position - 1].setAttribute('style', 'display:none');
      }

      var blobId = this.elemImages[this.position].dataset.blobId;
      this._updateBlobField(blobId);
    },
    _updateTimerField: function(timeLeft) {
      var elemTimer = document.getElementById('play_timer');
      elemTimer.value = timeLeft;
    },
    _updateBlobField: function(blobId) {
      document.getElementById('play_blob').value = blobId;
    },
    _verifyLoadedImages: function() {
      var amount = parseInt(document.getElementById('image-amount').dataset.amount);
      return (amount === this.elemImages.length)
    },
    init: function () {
      var self = this;
      this.position = -1;
      this.elemImages = document.getElementsByClassName('display-image');
      var playContent = document.getElementById("plays-content");

      if (!playContent) return

      var ensureImagesAreLoaded = function() {

        if (self._verifyLoadedImages()) {
          self._setupCountdownTimer(11);
        } else {
          setTimeout(ensureImagesAreLoaded, 0);
        }
      };
      ensureImagesAreLoaded();
    }
  };
}(window));
