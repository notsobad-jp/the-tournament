<bracket>
  <virtual if={ editable }>
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
    <br><br>
  </virtual>

  <div class="bracket { skipConsolation: !tournament.consolationRound, scoreLess: tournament.scoreLess, showBye: showBye, editable: editable }">
    <div class="block left">
      <div class="round { final: isFinalRound(roundIndex) }" each={ round, roundIndex in tournament.results }>
        <div class="match { matchClass(roundIndex, matchIndex) }" each={ match, matchIndex in round } data-round-index={ roundIndex } data-match-index={ matchIndex } onclick={ (roundIndex != 0 && match['bye']) ? "" : "this.classList.toggle('selected');" } style="flex: { matchFlex(roundIndex, matchIndex) }">
          <div class="teamContainer" style="top: { teamContainerPosition(roundIndex, matchIndex) }px;">
            <div class="team { teamClass(match, i) }" data-teamid={ teamIndex } each={ teamIndex, i in matchTeamIndexes(roundIndex, matchIndex) }>
              <span class="winnerSelect" if={ editable }>
                <input type="radio" name="winner_{ roundIndex }_{ matchIndex }" data-round-index={ roundIndex } data-match-index={ matchIndex } value={ i } checked={ i == match['winner'] } onclick={ updateWinner } disabled={ match.bye }>
              </span>

              <div class="name { (editable) ? 'ui transparent input' : '' }" style="width:{tournament.nameWidth}px;">
                <span class="f16" if={ teamIndex != null && tournament.teams[teamIndex]['country'] }>
                  <span class="flag { tournament.teams[teamIndex]['country'] }"></span>
                </span>
                <input type="text" if={ editable } data-teamid={ teamIndex } value={ teamName(teamIndex) } onchange={ updateTeamName }>
                <span if={ !editable }>{ teamName(teamIndex) }</span>
              </div>

              <div class="score { (editable) ? 'ui transparent input' : '' }" style="width:{tournament.scoreWidth}px;">
                <input type="text" if={ editable } data-round-index={ roundIndex } data-match-index={ matchIndex } data-team-order={ i } value={ match.score[i] } onchange={ updateScore }>
                <span if={ !editable }>{ match.score[i] }</span>
              </div>

              <i class="icon link remove circle" if={ editable && roundIndex==0 && teamName(teamIndex)!='' } onclick={ removeTeam } data-teamid={ teamIndex }></i>
            </div>
          </div>

          <div class="lineContainer">
            <div style="flex-grow:{ lineFlex(roundIndex, matchIndex)[0] }">
              <div></div>
              <div></div>
            </div>
            <div style="flex-grow:{ lineFlex(roundIndex, matchIndex)[1] }">
              <div></div>
              <div></div>
            </div>
          </div>

          <div class="popupContainer" if={ !editable }>
            <div class="popupContent" onclick="event.stopPropagation();">
              <h3 class="popupTitle">
                { (roundIndex == Object.keys(tournament.results).length-1) ? '' : roundName(Number(roundIndex)) }
                { matchName(Number(roundIndex), Number(matchIndex)) }
              </h3>
              <div class="popupTeamContainer">
                <virtual each={ i in [0,1] }>
                  <div class="popupTeam { teamClass(match, i) }" each={ teamIndex in [getTeamIndex(tournament, roundIndex, matchIndex, i)] }>
                    <div class="popupName">
                      { teamName(teamIndex) }
                    </div>
                    <div class="popupScore">
                      { match.score[i] }
                    </div>
                  </div>
                  <div class="popupSpacer" if={ i == 0 }>
                    -
                  </div>
                </virtual>
              </div>
              <div id="popup_{ roundIndex }_{ matchIndex }" class="popupComment" onshow={ setRawHtml(roundIndex+"_"+matchIndex, match.comment) }>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <style>
    /* 編集用レイアウト */
    .name input, .score input { height: 25px; }
    .score input { text-align: center !important; }
    .winnerSelect {
      height: 25px;
      width: 25px;
      line-height: 25px;
      background: rgba(255,255,255,0.4);
      padding: 0 5px;
    }
    .editable.bracket .match.selected:after { display: none; }
    .editable.bracket .match { cursor: default; }

    /* team削除ボタン */
    .icon.link.remove.circle {
      color: #999;
      position: absolute;
      right: -20px;
    }

    /* 敗者うすくしない */
    .match:not(.final):not(.consolation) .team.loser:not(.highlight) {
      opacity: 1;
    }

    /* その他 */
    small { margin-left: 10px; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.tournament = opts.tournament
    that.editable = opts.editable
    that.showBye = false


    /***********************************************
    * Functions
    ***********************************************/
    setRawHtml(matchId, content) {
      if(!content || content == '') { return false }

      setTimeout(function(){
        let popup = document.getElementById('popup_'+ matchId)
        let detail = that.escapeHTML(content)
        detail = detail.replace(/\r?\n/g, '<br>')
        detail = that.autoLink(detail)
        popup.innerHTML = detail
      }, 0)
    }

    autoLink(str) {
      var regexp_url = /((h?)(ttps?:\/\/[a-zA-Z0-9.\-_@:/~?%&;=+#',()*!]+))/g; // ']))/;
      var regexp_makeLink = function(all, url, h, href) {
        return '<a href="h' + href + '" target="_blank">' + url + '</a>';
      }
      return str.replace(regexp_url, regexp_makeLink);
    }

    escapeHTML(string) {
      if(typeof string !== 'string') {
        return string;
      }
      return string.replace(/[&'`"<>]/g, function(match) {
        return {
          '&': '&amp;',
          "'": '&#x27;',
          '`': '&#x60;',
          '"': '&quot;',
          '<': '&lt;',
          '>': '&gt;',
        }[match]
      });
    }



    isFinalRound(roundIndex) {
      return roundIndex == Object.keys(that.tournament.results).length - 1
    }

    matchTeamIndexes(roundIndex, matchIndex) {
      return {
        0: that.getTeamIndex(that.tournament, roundIndex, matchIndex, 0),
        1: that.getTeamIndex(that.tournament, roundIndex, matchIndex, 1)
      }
    }

    updateScore(e) {
      var roundIndex = Number(e.currentTarget.getAttribute('data-round-index'))
      var matchIndex = Number(e.currentTarget.getAttribute('data-match-index'))
      var teamOrder = Number(e.currentTarget.getAttribute('data-team-order'))
      that.tournament.results[roundIndex][matchIndex]['score'][teamOrder] = e.currentTarget.value
      obs.trigger("tournamentChanged", that.tournament)
    }

    updateTeamName(e) {
      var teamIndex = Number(e.currentTarget.getAttribute('data-teamid'))
      that.tournament.teams[teamIndex]['name'] = e.currentTarget.value
      that.updateByeGames(that.tournament)

      obs.trigger("tournamentChanged", that.tournament)
    }

    updateTournament(e) {
      attribute = e.target.name
      value = (e.target.type != 'checkbox') ? e.target.value : e.target.checked
      that.tournament[attribute] = value
      obs.trigger("tournamentChanged", that.tournament)
    }

    updateWinner(e) {
      var roundIndex = Number(e.currentTarget.getAttribute('data-round-index'))
      var matchIndex = Number(e.currentTarget.getAttribute('data-match-index'))

      var targetWinner = that.tournament.results[roundIndex][matchIndex]['winner']
      var newWinner = Number(e.currentTarget.value)

      that.tournament.results[roundIndex][matchIndex]['winner'] = (targetWinner == newWinner) ? null : newWinner
      obs.trigger("tournamentChanged", that.tournament)
    }

    teamName(teamIndex) {
      return (teamIndex==null) ? '--' : that.tournament.teams[teamIndex]['name']
    }

    matchClass(roundIndex, matchIndex) {
      var matchClass = ""

      // 決勝ラウンド
      if(roundIndex == Object.keys(that.tournament.results).length - 1) {
        if(matchIndex==0) {
          matchClass = 'final'
        }else {
          matchClass = 'consolation'
        }
      // それ以外
      }else {
        if( that.highlightMatch(roundIndex, 1) == matchIndex ) {
          matchClass = 'highlightFirst'
        }else if( that.highlightMatch(roundIndex, 2) == matchIndex ) {
          matchClass = 'highlightSecond'
        }
      }

      /* bye/skipチェック */
      var result = that.tournament.results[roundIndex][matchIndex]
      if(result['bye'] && result['winner']!=null) {
        matchClass += ' bye'
      }else if(result['bye'] && result['winner']==null) {
        matchClass += ' skip'
      }
      /* next-byeチェック */
      var pairMatchIndex = (matchIndex%2==0) ? matchIndex + 1 : matchIndex - 1
      var pairResult = that.tournament.results[roundIndex][pairMatchIndex]
      if(pairResult['bye'] && pairResult['winner']==null) {
        matchClass += ' next-bye'
      }

      return matchClass
    }

    /*  matchのflex = (round:0でskipじゃない子試合の数) を算出 */
    matchFlex(roundIndex, matchIndex) {
      /* １回戦と決勝ラウンドはスキップ */
      if(roundIndex==0 || roundIndex==Object.keys(that.tournament.results).length-1) {
        return "0 0 auto"
      }

      var start = matchIndex * Math.pow(2, roundIndex)
      var end = start + Math.pow(2, roundIndex) - 1

      var count = 0
      for(var i = start; i <= end; i++) {
        var res = that.tournament.results[0][i]
        if(!res['bye'] || res['winner']!=null) { count += 1 }
      }
      return count + " 1 " + count * 65 + "px"
    }

    /* 配列で、上半分・下半分のlineContainerのflex-grow値を返す */
    lineFlex(roundIndex, matchIndex) {
      var res = that.tournament.results[roundIndex][matchIndex]
      // １回戦とskip試合は1:1
      if(roundIndex==0 || (res['bye'] && res['winner']==null)) {
        return [1, 1]
      // byeのとき、子試合と同じ比率
      }else if(res['bye'] && res['winner'] != null) {
        // 勝った方の子試合に合わせるので、matchIndex*2にres['winner']を足す
        return that.lineFlex(roundIndex - 1, matchIndex * 2 + res['winner'])
      }

      var children = that.childrenMatchCount(roundIndex, matchIndex)
      return [Math.max(children[0], 1), Math.max(children[1], 1)]
    }

    /* 配列で、上半分・下半分それぞれの空じゃない子どもの数を返す */
    childrenMatchCount(roundIndex, matchIndex) {
      var count = [0,0]

      /* １回戦はスキップ */
      if(roundIndex==0) { return count }
      /* 3位決定戦 */
      if(roundIndex==Object.keys(that.tournament.results).length-1 && matchIndex==1 ) {
        return count
      }

      var start = matchIndex * Math.pow(2, roundIndex)
      var end = start + Math.pow(2, roundIndex) - 1
      var middle = Math.floor((end - start) / 2) + start

      for(var i = start; i <= middle; i++) {
        var res = that.tournament.results[0][i]
        if(!res['bye'] || res['winner']!=null) { count[0] += 1 }
      }
      for(var i = middle+1; i <= end; i++) {
        var res = that.tournament.results[0][i]
        if(!res['bye'] || res['winner']!=null) { count[1] += 1 }
      }

      return count
    }

    calcMatchPosition(roundIndex, matchIndex) {
      /* １回戦はスキップ */
      if(roundIndex==0) { return 0 }
      /* 3位決定戦は決勝と同じだけずらす */
      if(roundIndex==Object.keys(that.tournament.results).length-1 && matchIndex==1 ) {
        matchIndex = 0
      }

      var count = that.childrenMatchCount(roundIndex, matchIndex)
      return count[0] - count[1]
    }

    teamContainerPosition(roundIndex, matchIndex) {
      var position = that.calcMatchPosition(roundIndex, matchIndex)
      return position * 32
    }

    teamClass(match, teamOrder) {
      if(match.winner==null) { return '' }
      return (match.winner == teamOrder) ? 'winner' : 'loser'
    }

    /* 優勝/準優勝ハイライトの対象match(ラウンドごと)  e.g. 優勝者ID=13の場合、round:1 →（ 13 / 2**1 ).ceil = 7 */
    highlightMatch(roundIndex, rank) {
      // that.tournament.results
      var targetTeamIndex = that.finalTeam(rank)
      if(targetTeamIndex==null) {
        return null
      }
      return Math.floor( targetTeamIndex / Math.pow(2, Number(roundIndex)+1) )
    }

    /* 優勝・準優勝チームのIDを返す */
    finalTeam(rank) {
      var finalRoundIndex = Object.keys(that.tournament.results).length - 1
      var finalMatch = that.tournament.results[finalRoundIndex][0]

      if(finalMatch['winner']==null) {
        return null
      }

      var targetIndex = (rank==1) ? finalMatch['winner'] : 1 - finalMatch['winner']
      var teamIndex = that.getTeamIndex(that.tournament, finalRoundIndex, 0, targetIndex)
      return teamIndex
    }

    /* hoverでハイライト */
    highlightTeam(e) {
      var teams = document.getElementsByClassName('team');
      e.currentTarget.classList.add("highlight");  // idがないブロック(TBDなど)も一応ハイライトされるように

      var teamid = e.currentTarget.dataset.teamid;
      var selectedTeams = document.querySelectorAll('[data-teamid="'+ teamid +'"]');
      for (var j = 0; j < selectedTeams.length; j++) {
        selectedTeams[j].classList.add("highlight");

        // winnerの場合はmatchにもhighlightつけてlineContainerをハイライト
        if(selectedTeams[j].classList.contains('winner')) {
          var match = selectedTeams[j].parentNode.parentNode;
          match.classList.add("highlight");
        }
      }
    }
    resetHighlight(e) {
      var teams = document.getElementsByClassName('team');
      for (var k = 0; k < teams.length; k++) {
        teams[k].classList.remove("highlight");

        var match = teams[k].parentNode.parentNode;
        match.classList.remove("highlight");
      }
    }

    teamClass(match, teamOrder) {
      if(match.winner==null) { return '' }
      return (match.winner == teamOrder) ? 'winner' : 'loser'
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

    matchName(roundIndex, matchIndex) {
      var matchName = ''
      if(roundIndex == Object.keys(that.tournament.results).length-1) {
        matchName = (matchIndex==0) ? '決勝戦' : '3位決定戦'
      }else {
        matchName = '第' + (matchIndex+1) + '試合'
      }
      return matchName
    }

    removeTeam(e) {
      var teamIndex = e.currentTarget.getAttribute('data-teamid')
      that.tournament.teams[teamIndex] = { name: '' }
      that.updateByeGames(that.tournament)

      obs.trigger("tournamentChanged", that.tournament)
    }

    toggleShowBye(e) {
      that.showBye = !that.showBye
      that.update()
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
</bracket>
