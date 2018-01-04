<flash>
  <div class="ui message {flash.type}" if={ flash }>
    <i class="close icon" onclick={ close }></i>
    <div class="header">{flash.text}</div>
  </div>


  <style>
    .ui.message {
      width: 100%;
      position: absolute;
      z-index: 100;
      border-radius: 0;
    }
    .ui.message .header {
      font-size: 1em !important;
      font-weight: 300;
    }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this


    /***********************************************
    * Observables
    ***********************************************/
    obs.on("flashChanged", function(obj) {
      that.flash = obj
      that.update()
      that.close(3000)
    })


    /***********************************************
    * Functions
    ***********************************************/
    close(ms=0) {
      setTimeout(function(){
        that.flash = null
        that.update()
      }, ms)
    }
  </script>
</flash>
