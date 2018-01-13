<bracket-header>
  <!--
  <div class="ui transparent fluid icon input { error: tournament.title == '' }">
    <input id="nameInput" type="text" name="title" placeholder="トーナメント名*" value={ tournament.title } onchange={ updateTournament }>
    <i class="icon write"></i>
  </div>
  <div class="ui divider"></div>
  -->
  <div class="ui two column grid">
    <div class="ui left aligned column">
      <div class="ui icon mini primary buttons">
        <div class="ui icon button { disabled: Object.keys(tournament.teams).length >= 128 }" onclick={ addRound }>
          <i class="icon plus"></i>
        </div>
        <div class="ui icon button { disabled: Object.keys(tournament.teams).length <= 4 }" onclick={ removeRound }>
          <i class="icon minus"></i>
        </div>
      </div>
      <small>
        参加者数
        <span class="ui circular mini label">
          { Object.keys(tournament.teams).length }
        </span>
      </small>
    </div>
    <div class="ui right aligned column">
      <div class="ui mini basic button { primary: !showBye }" onclick={ toggleShowBye }>
          <i class="icon { unhide: !showBye, hide: showBye }"></i>
          { (!showBye) ? '空白試合を表示' : '空白試合を隠す' }
      </div>
    </div>
  </div>


  <style>
    small { margin-left: 10px; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.tournament = opts.tournament
    that.showBye = false


    /***********************************************
    * Functions
    ***********************************************/
    toggleShowBye(e) {
      that.showBye = !that.showBye
      obs.trigger('showByeChanged', that.showBye)
    }

    addRound() {
      that.addTeams(that.tournament, 1, true)
      obs.trigger("tournamentChanged", that.tournament)
    }
    removeRound() {
      that.removeTeams(that.tournament, 1, true)
      obs.trigger("tournamentChanged", that.tournament)
    }
  </script>
</bracket-header>
