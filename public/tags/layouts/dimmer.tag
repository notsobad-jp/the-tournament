<dimmer>
  <div class="ui page dimmer {state}">
    <div class="ui indeterminate huge text loader">Loading</div>
  </div>


  <script>
    var that = this

    obs.on("dimmerChanged", function(state) {
      that.state = state
      that.update()

      /* どんなに長くても10秒経ったらdimmer閉じる */
      if(state=='active') {
        setTimeout(function(){
          that.state = ''
          that.update()
        }, 10000)
      }
    })
  </script>
</dimmer>
