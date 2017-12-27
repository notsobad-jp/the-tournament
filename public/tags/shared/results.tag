<results>
  <div>
    <virtual each={ round, roundIndex in tournament.results }>
      <div class="ui segments">
        <div class="ui attached warning visible message" onclick={ toggleSegment.bind(this, roundIndex) }>
          { roundName(Number(roundIndex)) }
          <i class="counterclockwise dropdown icon { rotated: !segmentVisible[roundIndex] }"></i>
        </div>
          <div class="ui attached segment" each={ match, matchIndex in round } if={ segmentVisible[roundIndex] }>
            <div class="ui tiny center aligned header">
              【{ matchName(Number(roundIndex), Number(matchIndex)) }】
            </div>
            <div class="ui top right attached mini blue label" if={ editable && !match.bye } onclick={ showMatchModal.bind(this, Number(roundIndex), Number(matchIndex)) }>
              編集
            </div>
            <div class="ui center aligned grid">
              <div class="row { bye: match.bye }">
                <div class="ui seven wide column { winner: match.winner==0, loser: match.winner==1 }">
                  <b>{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 0)) || '--' }</b>
                  <virtual if={ !match.bye }>
                    <div if={ match.score[0] != null && match.score[0] != ''  }>
                      <br>
                      { match.score[0] }
                    </div>
                  </virtual>
                </div>
                <div class="ui two wide column">
                  <i class="icon minus"></i>
                </div>
                <div class="ui seven wide column { winner: match.winner==1, loser: match.winner==0 }">
                  <b>{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 1)) || '--' }</b>
                  <virtual if={ !match.bye }>
                    <div if={ match.score[1] != null && match.score[1] != ''  }>
                      <br>
                      { match.score[1] }
                    </div>
                  </virtual>
                </div>
              </div>
            <div class="ui basic compact center aligned segment" if={ match.comment!='' && match.comment!=null }>
              <small>{ match.comment }</small>
            </div>
          </div>
      </div>
    </virtual>
  </div>


  <style>
    .ui.column.winner { color: #a94442; }
    .row.bye .ui.column.winner { color: #999999; }
    .ui.column.loser { color: #999999; }
    .ui.compact.segment {
      display: block;
      margin: 0;
    }
    .ui.column { word-break: break-all; }
    .ui.one.wide.column { margin: auto 0; }
    .sixteen.wide.column { margin-top: -10px; }
    .top.right.attached.label { cursor: pointer; }
    .winnerSelect { margin: 10px auto; }
    .ui.bottom.attached.label:first-child~:last-child:not(.attached) { margin-bottom: 5px !important; }

    .ui.attached.warning.message { cursor: pointer; }
  </style>


  <script>
    /***********************************************
    * Variables
    ***********************************************/
    var that = this
    that.tournament = opts.tournament
    that.editable = opts.editable
    that.segmentVisible = []
    for(var i = 0; i < Object.keys(that.tournament.results).length; i++) {
      that.segmentVisible.push(true)
    }

    that.mixin('tournamentMixin')


    /***********************************************
    * Functions
    ***********************************************/
    matchName(roundIndex, matchIndex) {
      var matchName = ''
      if(roundIndex == Object.keys(that.tournament.results).length-1) {
        matchName = (matchIndex==0) ? '決勝戦' : '3位決定戦'
      }else {
        matchName = '第' + (matchIndex+1) + '試合'
      }
      return matchName
    }

    roundName(roundIndex) {
      var roundName = ''
      if(roundIndex == Object.keys(that.tournament.results).length-1) {
        roundName = '決勝ラウンド'
      }else {
        roundName = (roundIndex+1) + '回戦'
      }
      return roundName
    }

    showMatchModal(roundIndex, matchIndex) {
      var matchSelected = {
        roundIndex: roundIndex,
        matchIndex: matchIndex
      }
      obs.trigger("matchModalChanged", matchSelected)
    }

    teamName(teamIndex) {
      return (teamIndex==null) ? '--' : that.tournament.teams[teamIndex]['name']
    }

    toggleSegment(roundIndex) {
      that.segmentVisible[roundIndex] = !that.segmentVisible[roundIndex]
      that.update()
    }

    updateWinner(e) {
      var roundIndex = Number(e.currentTarget.getAttribute('data-round-index'))
      var matchIndex = Number(e.currentTarget.getAttribute('data-match-index'))

      var targetWinner = that.tournament.results[roundIndex][matchIndex]['winner']
      var newWinner = Number(e.currentTarget.value)

      that.tournament.results[roundIndex][matchIndex]['winner'] = (targetWinner == newWinner) ? null : newWinner
      obs.trigger("tournamentChanged", that.tournament)
    }
  </script>
</results>
