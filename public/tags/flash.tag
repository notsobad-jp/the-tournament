<flash>
  <div id="flasher" if={flash}>
    <div class="ui attached message {flash.type}">
      <i class="close icon" onclick={ close }></i>
      <div class="header">{flash.text}</div>
    </div>
  </div>


  <style>
    #flasher {
      width: 100%;
      position: fixed;
      z-index: 100;
    }
    .ui.message .header {
      font-size: 1em !important;
      font-weight: 300;
    }
  </style>


  <script>
    var that = this

    close(ms=0) {
      setTimeout(function(){
        $('#flasher').transition('fade')
        that.flash = null
        that.update()
      }, ms)
    }

    obs.on("flashChanged", function(obj) {
      that.flash = obj
      that.update()
      that.close(3000)
    })
  </script>
</flash>
