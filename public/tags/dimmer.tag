<dimmer>
  <div class="ui page dimmer {state}">
    <div class="ui indeterminate huge text loader">Loading</div>
  </div>


  <script>
    var that = this

    obs.on("dimmerChanged", function(state) {
      that.state = state
      that.update()
    })
  </script>
</dimmer>
