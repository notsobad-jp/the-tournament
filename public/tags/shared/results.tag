<results>
  <div>
    <virtual each={ round, roundIndex in tournament.results }>
      <div class="ui segments">
        <div class="ui attached warning visible message" onclick={ toggleSegment }>
          { roundName(Number(roundIndex)) }
          <i class="counterclockwise dropdown icon"></i>
        </div>
          <div class="ui attached segment" each={ match, matchIndex in round }>
            <div if={ !editable } class="ui tiny center aligned header">
              【{ matchName(Number(roundIndex), Number(matchIndex)) }】
            </div>
            <div if={ editable } class="ui top attached bottom pointing label">
              <h5 class="ui tiny center aligned header">【{ matchName(Number(roundIndex), Number(matchIndex)) }】</h5>
            </div>

            <div class="ui center aligned grid">
              <div class="row { bye: match.bye }">
                <div class="ui seven wide column { winner: match.winner==0, loser: match.winner==1 }">
                  <b>{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 0)) || '--' }</b>
                  <virtual if={ !match.bye }>
                    <div if={ !editable && match.score[0] != null && match.score[0] != ''  }>
                      <br>
                      { match.score[0] }
                    </div>
                    <div if={ editable }>
                      <div class="winnerSelect" if={ editable }>
                        <label>
                          <input type="radio" name="match_{roundIndex}_{matchIndex}" data-round-index={ roundIndex } data-match-index={ matchIndex } value={ 0 } checked={ 0 == match['winner'] } onclick={ updateWinner } disabled={ match.bye }>
                          勝ち
                        </label>
                      </div>
                      <input type="text" data-round-index={ roundIndex } data-match-index={ matchIndex } data-team-order={ 0 } value={ match.score[0] } onchange={ updateScore } placeholder="スコア" disabled={ match.bye }>
                    </div>
                  </virtual>
                </div>
                <div class="ui one wide column">
                  <i class="icon minus"></i>
                </div>
                <div class="ui seven wide column { winner: match.winner==1, loser: match.winner==0 }">
                  <b>{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 1)) || '--' }</b>
                  <virtual if={ !match.bye }>
                    <div if={ !editable && match.score[1] != null && match.score[1] != ''  }>
                      <br>
                      { match.score[1] }
                    </div>
                    <div if={ editable }>
                      <div class="winnerSelect" if={ editable }>
                        <label>
                          <input type="radio" name="match_{roundIndex}_{matchIndex}" data-round-index={ roundIndex } data-match-index={ matchIndex } value={ 1 } checked={ 1 == match['winner'] } onclick={ updateWinner } disabled={ match.bye }>
                          勝ち
                        </label>
                      </div>
                      <input type="text" data-round-index={ roundIndex } data-match-index={ matchIndex } data-team-order={ 1 } value={ match.score[1] } oninput={ updateScore } placeholder="スコア" disabled={ match.bye }>
                    </div>
                  </virtual>
                </div>
              </div>
              <div if={ editable && !match.bye } class="sixteen wide column">
                <textarea rows="2" name="comment"  placeholder="試合の詳細など。URLを入力すると自動でリンクになります。" onchange={ updateComment }>{ tournament.results[roundIndex][matchIndex].comment }</textarea>
              </div>
            </div>
            <div class="ui basic compact center aligned segment" if={ !editable && match.comment!='' && match.comment!=null }>
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
    var that = this
    that.tournament = opts.tournament
    that.editable = opts.editable
    that.mixin('tournamentMixin')

    roundName(roundIndex) {
      var roundName = ''
      if(roundIndex == Object.keys(that.tournament.results).length-1) {
        roundName = '決勝ラウンド'
      }else {
        roundName = (roundIndex+1) + '回戦'
      }
      return roundName
    }

    matchName(roundIndex, matchIndex) {
      var matchName = ''
      if(roundIndex == Object.keys(that.tournament.results).length-1) {
        matchName = (matchIndex==0) ? '決勝戦' : '3位決定戦'
      }else {
        matchName = '第' + (matchIndex+1) + '試合'
      }
      return matchName
    }

    teamName(teamIndex) {
      return (teamIndex==null) ? '--' : that.tournament.teams[teamIndex]['name']
    }

    updateWinner(e) {
      var roundIndex = Number(e.currentTarget.getAttribute('data-round-index'))
      var matchIndex = Number(e.currentTarget.getAttribute('data-match-index'))

      var targetWinner = that.tournament.results[roundIndex][matchIndex]['winner']
      var newWinner = Number(e.currentTarget.value)

      that.tournament.results[roundIndex][matchIndex]['winner'] = (targetWinner == newWinner) ? null : newWinner
      obs.trigger("tournamentChanged", that.tournament)
    }

    updateScore(e) {
      var roundIndex = Number(e.currentTarget.getAttribute('data-round-index'))
      var matchIndex = Number(e.currentTarget.getAttribute('data-match-index'))
      var teamOrder = Number(e.currentTarget.getAttribute('data-team-order'))

      that.tournament.results[roundIndex][matchIndex]['score'][teamOrder] = e.currentTarget.value
      obs.trigger("tournamentChanged", that.tournament)
    }

    updateComment(e) {
      var roundIndex = Number(e.currentTarget.getAttribute('data-round-index'))
      var matchIndex = Number(e.currentTarget.getAttribute('data-match-index'))

      that.tournament.results[roundIndex][matchIndex]['comment'] = e.target.value
      obs.trigger("tournamentChanged", that.tournament)
    }

    updateBye(e) {
      var roundIndex = Number(e.currentTarget.getAttribute('data-round-index'))
      var matchIndex = Number(e.currentTarget.getAttribute('data-match-index'))

      that.tournament.results[roundIndex][matchIndex]['bye'] = $(e.currentTarget).prop("checked")
      console.log(that.tournament.results[roundIndex][matchIndex])
      obs.trigger("tournamentChanged", that.tournament)
    }

    toggleSegment(e) {
      $(e.target).parent('.segments').children('.segment').toggle()
      $(e.target).children('i').toggleClass('rotated')
    }
  </script>
</results>
