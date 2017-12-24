<match-modal>
  <div class="ui page dimmer active" onclick={ hideModal }></div>
  <div class="ui tiny modal active">
    <i class="close icon" onclick={ hideModal }></i>
    <div class="header">
      試合名
    </div>
    <div class="content">
          <div class="ui center aligned grid form">
            <div class="row">
              <div class="ui seven wide column secondary segment">
                <h5 class="ui tiny header">{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 0)) || '--' }</h5>
                <div>
                  <label>
                    <input type="radio" name="match_{roundIndex}_{matchIndex}" data-round-index={ roundIndex } data-match-index={ matchIndex } value={ 0 } checked={ 0 == match['winner'] } onclick={ updateWinner } disabled={ match.bye }>
                    勝ち
                  </label>
                </div>
                <br>
                <div>
                  <input type="text" data-round-index={ roundIndex } data-match-index={ matchIndex } data-team-order={ 0 } value={ match.score[0] } onchange={ updateScore } placeholder="スコア" disabled={ match.bye }>
                </div>
              </div>
              <div class="ui two wide middle aligned column">
                <i class="icon minus"></i>
              </div>
              <div class="ui seven wide column secondary segment">
                <h5 class="ui tiny header">{ teamName(getTeamIndex(tournament, roundIndex, matchIndex, 1)) || '--' }</h5>
                <div>
                  <label>
                    <input type="radio" name="match_{roundIndex}_{matchIndex}" data-round-index={ roundIndex } data-match-index={ matchIndex } value={ 1 } checked={ 1 == match['winner'] } onclick={ updateWinner } disabled={ match.bye }>
                    勝ち
                  </label>
                </div>
                <br>
                <div>
                  <input type="text" data-round-index={ roundIndex } data-match-index={ matchIndex } data-team-order={ 1 } value={ match.score[1] } oninput={ updateScore } placeholder="スコア" disabled={ match.bye }>
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
      <div class="ui primary left floated small button">
        更新
      </div>
      <div class="ui basic left floated small button" onclick={ hideModal }>
        キャンセル
      </div>
      <div class="ui right icon red basic small button">
        <i class="icon trash"></i>
        削除
      </div>
    </div>
  </div>


  <style>
    .ui.tiny.modal { top: auto; }
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
    var that = this
    that.tournament = opts.tournament
    that.match = opts.match.result
    that.roundIndex = opts.match.roundIndex
    that.matchIndex = opts.match.matchIndex

    that.mixin('tournamentMixin')

    teamName(teamIndex) {
      return (teamIndex==null) ? '--' : that.tournament.teams[teamIndex]['name']
    }

    hideModal() {
      that.parent.matchSelected = null
      that.parent.update()
    }
  </script>
</match-modal>
