<match-modal>
  <virtual if={ match }>
    <div class="ui page dimmer active" onclick={ hideModal }></div>
    <div class="ui tiny modal active">
      <i class="close icon" onclick={ hideModal }></i>
      <div class="header">
        <i class="icon browser"></i>
        試合結果の編集
      </div>
      <div class="content">
        <div class="ui center aligned grid form">
          <div class="row">
            <input type="text" value={ match.label || roundName() + matchName() } onchange={ updateLabel }>
          </div>

          <div class="row">
            <div class="ui seven wide column secondary segment">
              <h5 class="ui tiny header">{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 0)) || '--' }</h5>
              <div>
                <label>
                  <input type="radio" name="winner" value={ 0 } checked={ 0 == match['winner'] } onclick={ updateWinner } disabled={ match.bye }>
                  勝ち
                </label>
              </div>
              <br>
              <div>
                <input type="text" data-team-order={ 0 } value={ match.score[0] } onchange={ updateScore } placeholder="スコア" disabled={ match.bye }>
              </div>
            </div>
            <div class="ui two wide middle aligned column">
              <i class="icon minus"></i>
            </div>
            <div class="ui seven wide column secondary segment">
              <h5 class="ui tiny header">{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 1)) || '--' }</h5>
              <div>
                <label>
                  <input type="radio" name="winner" value={ 1 } checked={ 1 == match['winner'] } onclick={ updateWinner } disabled={ match.bye }>
                  勝ち
                </label>
              </div>
              <br>
              <div>
                <input type="text" data-team-order={ 1 } value={ match.score[1] } onchange={ updateScore } placeholder="スコア" disabled={ match.bye }>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="sixteen wide column">
              <div class="ui field">
                <textarea rows="2" name="comment"  placeholder="試合の詳細など。URLを入力すると自動でリンクになります。" onchange={ updateComment } disabled={ match.bye }>{ tournament.results[roundIndex][matchIndex].comment }</textarea>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="actions">
        <div class="ui primary left floated small button" onclick={ updateResult }>
          更新
        </div>
        <div class="ui basic left floated small button" onclick={ hideModal }>
          キャンセル
        </div>
        <div class="ui right icon red basic small button" onclick={ removeResult }>
          <i class="icon trash"></i>
          削除
        </div>
      </div>
    </div>
  </virtual>


  <style>
    .ui.tiny.modal { top: 10%; }
    @media only screen and (min-width: 1200px) {
      .ui.tiny.modal {
        width: 450px;
        margin: 0 0 0 -225px;
      }
    }
    .ui.tiny.modal .grid { margin: 0; }
    .sixteen.wide.column { padding: 0 !important; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.tournament = opts.tournament


    /***********************************************
    * Observables
    ***********************************************/
    obs.on("matchModalChanged", function(matchSelected) {
      that.roundIndex = matchSelected.roundIndex
      that.matchIndex = matchSelected.matchIndex
      that.match = that.tournament.results[that.roundIndex][that.matchIndex]
      that.update()
    })

    // unmount処理
    that.on('unmount', function() {
      obs.off('matchModalChanged')
    })


    /***********************************************
    * Functions
    ***********************************************/
    hideModal() {
      that.match = null
      that.update()
    }

    matchName() {
      var matchName = ''
      if(that.roundIndex == Object.keys(that.tournament.results).length-1) {
        matchName = (that.matchIndex==0) ? '決勝戦' : '3位決定戦'
      }else {
        matchName = '第' + (that.matchIndex+1) + '試合'
      }
      return matchName
    }

    removeResult() {
      that.tournament.results[that.roundIndex][that.matchIndex]['winner'] = null
      that.match = null
      obs.trigger("tournamentChanged", that.tournament)
    }

    roundName() {
      var roundName = ''
      if(that.roundIndex == Object.keys(that.tournament.results).length-1) {
        roundName = ''
      }else {
        roundName = (that.roundIndex+1) + '回戦 '
      }
      return roundName
    }

    showModal(matchSelected) {
      that.roundIndex = matchSelected.roundIndex
      that.matchIndex = matchSelected.matchIndex
      that.match = JSON.parse(JSON.stringify(that.tournament.results[that.roundIndex][that.matchIndex]))
      that.update()
    }

    teamName(teamIndex) {
      return (teamIndex==null) ? '--' : that.tournament.teams[teamIndex]['name']
    }

    updateComment(e) {
      that.match.comment = e.currentTarget.value
    }

    updateResult() {
      that.tournament.results[that.roundIndex][that.matchIndex] = that.match
      that.match = null
      obs.trigger("tournamentChanged", that.tournament)
    }

    updateScore(e) {
      var teamOrder = Number(e.currentTarget.getAttribute('data-team-order'))
      that.match.score[teamOrder] = e.currentTarget.value
    }

    updateLabel(e) {
      that.match.label = e.currentTarget.value
      console.log(that.match.label)
      console.log(e.currentTarget.value)
    }

    updateWinner(e) {
      that.match.winner = Number(e.currentTarget.value)
    }
  </script>
</match-modal>
