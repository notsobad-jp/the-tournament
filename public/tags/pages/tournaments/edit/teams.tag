<teams>
  <div>
    <div class="ui tiny header">参加者の登録</div>

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
        <div class="ui mini basic button { primary: tabSelected('simple') }" onclick={ toggleMenuTab }>
            <i class="icon exchange }"></i>
            { (tabSelected('simple')) ? '詳細情報を表示する' : 'シンプル表示に戻す' }
        </div>
      </div>
    </div>
    <br><br>

    <div class="ui tab { active: tabSelected('simple') }">
      <div class="ui form">
        <textarea name="teams" onchange={ updateTeams } style="line-height:22px; height:{ calcTextareaHeight() }px; max-height:256em;">{ teamText() }</textarea>
      </div>
    </div>

    <div class="ui tab { active: tabSelected('detail') }">
      <div class="ui segments">
        <div class="ui clearing segment" each={ team, teamIndex in tournament.teams }>
          <i class="flag { team.country }" if={ team.country }></i>
          { team.name || '--' }
          <span if={ team.group }>（{ team.group }）</span>
          <a href={ team.url } target="_blank" if={ team.url && team.url != '' }>
            <i class="icon external"></i>
          </a>

          <button class="ui mini primary right floated icon button" data-teamid={ teamIndex } onclick={ showTeamModal }>
            <i class="icon setting"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
  <team-modal ref="team_modal" tournament={ tournament }></team-modal>


  <style>
    small { margin-left: 10px; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.tournament = opts.tournament
    that.selectedTab = 'simple'


    /***********************************************
    * Functions
    ***********************************************/
    addRound() {
      that.addTeams(that.tournament, 1, true)
      obs.trigger("tournamentChanged", that.tournament)
    }

    calcTextareaHeight() {
      var teamsCount = Object.keys(that.tournament.teams).length
      var lineHeight = 22
      return teamsCount * lineHeight + 70
    }

    changeMenuTab(tab) {
      that.selectedTab = tab
    }

    removeRound() {
      that.removeTeams(that.tournament, 1, true)
      obs.trigger("tournamentChanged", that.tournament)
    }

    showTeamModal(e) {
      e.preventDefault()
      var teamIndex = e.currentTarget.getAttribute('data-teamid')
      var teamModal = that.refs.team_modal
      teamModal.showModal(teamIndex)
    }

    tabSelected(tab) {
      return tab == that.selectedTab
    }

    teamText() {
      text = ''
      for( key in that.tournament.teams ) {
        text += that.tournament.teams[key]['name'] + '\n'
      }
      return text
    }

    toggleMenuTab() {
      that.selectedTab = (that.selectedTab=='simple') ? 'detail' : 'simple'
    }

    /* 詳細入力モード */
    updateTeam(e) {
      var teamIndex = Number(e.currentTarget.getAttribute('data-teamid'))
      var attribute = e.currentTarget.getAttribute('name')
      that.tournament.teams[teamIndex][attribute] = e.currentTarget.value

      if(attribute=='name') {
        that.updateByeGames(that.tournament)
      }
      obs.trigger("tournamentChanged", that.tournament)
    }

    /* テキスト入力モード */
    updateTeams(e) {
      teams = e.target.value.trim().split('\n')

      var oldTeamCount = Object.keys(that.tournament.teams).length
      var oldRoundCount = Math.ceil(Math.log10(oldTeamCount) /Math.log10(2))

      var newRoundCount = Math.ceil(Math.log10(teams.length) / Math.log10(2))
      var newTeamCount = Math.pow(2, newRoundCount)

      var roundCountDiff = newRoundCount - oldRoundCount
      if(roundCountDiff > 0) {
        that.addTeams(that.tournament, roundCountDiff, false)
      }else if(roundCountDiff < 0) {
        that.removeTeams(that.tournament, Math.abs(roundCountDiff))
      }

      for(var i=0; i<newTeamCount; i++) {
        that.tournament.teams[i]['name'] = teams[i] || ''
      }
      that.updateByeGames(that.tournament)

      obs.trigger("tournamentChanged", that.tournament)
    }
  </script>
</teams>
