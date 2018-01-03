<mixin>
	<script>
    var that = this
    that.on('mount', function(){
      obs.trigger("mixinMounted", true)
    })

    var tournamentMixin = {
      /* チーム数増減 */
      addTeams: function(tournament, roundCountDiff, withTeamName) {
        // add teams
        var oldTeamsCount = Object.keys(tournament.teams).length
        var newTeamsCount = oldTeamsCount * Math.pow(2,roundCountDiff)
        for(var i = oldTeamsCount + 1; i <= newTeamsCount; i++ ) {
          var name = (withTeamName) ? "Player"+i : ''
          tournament.teams.push({name: name})
        }

        // add results
        var oldRoundNum = Math.ceil(Math.LOG2E * Math.log(oldTeamsCount))  //=> return 3 rounds for 8 players (2**3=8)
        // 元々存在していたラウンドに、試合数が足りない分を追加
        for(var i = 1; i<= oldRoundNum; i++) {
          var oldMatchCount = oldTeamsCount / Math.pow(2,i)     //=> return 4 mathes for 8 players 1st round
          var newMatchCount = newTeamsCount / Math.pow(2,i) //=> return 8 matches for new 16 players 1st round

          for(var j = oldMatchCount + 1; j <= newMatchCount; j++) {
            tournament.results[i-1][j-1] = {"score": {0:null, 1:null}, "comment": null, "winner": null}
          }
        }
        // 新たに追加されるラウンドの試合を追加（決勝ラウンド除く）
        for(var i = oldRoundNum + 1; i<= oldRoundNum + roundCountDiff - 1; i++) {
          var newMatchCount = newTeamsCount / Math.pow(2,i) //=> return 8 matches for new 16 players 1st round

          tournament.results[i-1] = {}
          for(var j = 1; j <= newMatchCount; j++) {
            tournament.results[i-1][j-1] = {"score": {0:null, 1:null}, "comment": null, "winner": null}
          }
        }
        // 決勝ラウンド追加（決勝・3位決定戦）
        tournament.results[oldRoundNum+roundCountDiff-1] = [{"score": {0:null, 1:null}, "comment": null, "winner": null}, {"score": {0:null, 1:null}, "comment": null, "winner": null}]
      },


      /* トーナメントのIDだけ取得して新規作成画面に遷移 */
      createAndRedirectToTournament: function() {
        let newTnmtRef = db.collection("tournaments").doc()
        route('tournaments/' + newTnmtRef.id + '/edit')
      },


      /* 勝ち上がりチーム情報の取得 */
      getTeamIndex: function(tournament, roundIndex, matchIndex, teamOrder) {
        var isConsolation = (roundIndex == Object.keys(tournament.results).length - 1) && (matchIndex == 1)
        // 1回戦
        if(roundIndex==0) {
          teamIndex = ( matchIndex * 2 ) + teamOrder
          return teamIndex
        // 2回戦以降
        }else {
          prevMatchIndex = (isConsolation) ? teamOrder : ( matchIndex * 2 ) + teamOrder
          prevResult = tournament.results[roundIndex-1][prevMatchIndex]
          // 前の試合が終了している場合：遡って勝利チームを取得
          if(prevResult['winner']!=null) {
            prevWinnerIndex = (isConsolation) ? 1 - prevResult['winner'] : prevResult['winner']
            return tournamentMixin.getTeamIndex(tournament, roundIndex-1, prevMatchIndex, prevWinnerIndex)
          // 前の試合が終了していない場合
          }else {
            return null
          }
        }
      },


      removeTeams: function(tournament, roundCountDiff) {
        // remove teams
        var oldTeamsCount = Object.keys(tournament.teams).length
        var newTeamsCount = oldTeamsCount / Math.pow(2,roundCountDiff)
        tournament.teams.splice(newTeamsCount, oldTeamsCount-newTeamsCount)

        // remove results
        var oldRoundNum = Math.ceil(Math.LOG2E * Math.log(oldTeamsCount))  //=> return 3 rounds for 8 players (2**3=8)
        var newRoundNum = oldRoundNum - roundCountDiff

        // 残すラウンドの不要になる試合を削除
        for(var i = 1; i<= newRoundNum; i++) {
          var newMatchCount = Math.max(newTeamsCount / Math.pow(2,i), 2) //=> return 4 matches for 16→8 players 1st round
          tournament.results[i-1] = tournament.results[i-1].splice(0, newMatchCount)
        }
        // 3位決定戦をリセット
        tournament.results[newRoundNum-1][1] = {"score": {0:null, 1:null}, "comment": null, "winner": null}
        // 不要になるラウンドをまるごと削除
        for(var i = newRoundNum+1; i<=oldRoundNum; i++) {
          delete tournament.results[i-1]
        }
      },


      setMetatags: function(meta) {
        let title = (meta) ? meta.title + ' | THE TOURNAMENT' : '【アルファ版】THE TOURNAMENT | 簡単・便利な無料のトーナメント表作成サービス'
        let description = (meta) ? meta.description : "圧倒的に使いやすい、無料トーナメント表作成ツールの決定版！Webブラウザだけで簡単におしゃれなトーナメント表を作成できます。"
        let keywords = 'トーナメント表,作成,THE TOURNAMENT,トーナメント'
        if(meta) {
          keywords = keywords + ',' + meta.keyword
        }

        document.title = title
        document.getElementById('description').setAttribute('content', description)
        document.getElementById('keywords').setAttribute('content', keywords)
        document.getElementById('og-title').setAttribute('content', title)
        document.getElementById('og-description').setAttribute('content', description)
        document.getElementById('og-url').setAttribute('content', location.href)
      },


      /* seed設定 */
      updateByeGame: function(tournament, teamIndex) {
        var team = tournament.teams[teamIndex]
        var matchIndex = Math.floor(teamIndex/2)

        if(team['name']=='') {
          var pairTeam = (teamIndex%2==0) ? tournament.teams[teamIndex+1] : tournament.teams[teamIndex-1]
          if(pairTeam['name']=='') {
            var winner = null  //相手もbyeのとき
          }else {
            var winner = (teamIndex%2==0) ? 1 : 0
          }
          tournament.results[0][matchIndex] = {
            winner: winner,
            bye: true,
            score: {0: null, 1: null},
            comment: null
          }
        }else {
          tournament.results[0][matchIndex]['bye'] = false
        }
        return tournament.results
      },


      updateByeGames: function(tournament) {
        for(var roundIndex = 0; roundIndex < Object.keys(tournament.results).length; roundIndex++) {
          for(var matchIndex = 0; matchIndex < Object.keys(tournament.results[roundIndex]).length; matchIndex++) {
            // FIXME: ３位決定戦はとりあえずスキップ
            if(roundIndex==Object.keys(tournament.results).length-1 && matchIndex==1) { continue }

            // １回戦は参加者名からbye/skipを判定
            if(roundIndex==0) {
              var teams = [
                tournament.teams[matchIndex*2],
                tournament.teams[matchIndex*2+1],
              ]
              if(teams[0]['name']=='' && teams[1]['name']=='') {
                tournament.results[roundIndex][matchIndex]['bye'] = true
                tournament.results[roundIndex][matchIndex]['winner'] = null
              }else if(teams[0]['name']=='') {
                tournament.results[roundIndex][matchIndex]['bye'] = true
                tournament.results[roundIndex][matchIndex]['winner'] = 1
              }else if(teams[1]['name']=='') {
                tournament.results[roundIndex][matchIndex]['bye'] = true
                tournament.results[roundIndex][matchIndex]['winner'] = 0
              }else {
                tournament.results[roundIndex][matchIndex]['bye'] = false
              }
            // 2回戦以降は前のラウンドの試合結果から判定
            }else {
              var prevResults = [
                tournament.results[roundIndex-1][matchIndex*2],
                tournament.results[roundIndex-1][matchIndex*2+1]
              ]
              var prevSkip_0 = prevResults[0]['bye'] && prevResults[0]['winner']==null
              var prevSkip_1 = prevResults[1]['bye'] && prevResults[1]['winner']==null

              if(prevSkip_0 && prevSkip_1) {
                tournament.results[roundIndex][matchIndex]['bye'] = true
                tournament.results[roundIndex][matchIndex]['winner'] = null
              }else if(prevSkip_0) {
                tournament.results[roundIndex][matchIndex]['bye'] = true
                tournament.results[roundIndex][matchIndex]['winner'] = 1
              }else if(prevSkip_1) {
                tournament.results[roundIndex][matchIndex]['bye'] = true
                tournament.results[roundIndex][matchIndex]['winner'] = 0
              }else {
                tournament.results[roundIndex][matchIndex]['bye'] = false
              }
            }
          }
        }
        return tournament
      }
    }
    riot.mixin('tournamentMixin', tournamentMixin)
	</script>
</mixin>
