<settings>
  <div class="ui form">
    <div class="required field">
      <label>トーナメント名</label>
      <input type="text" name="title" value="{tournament.title}" onchange={ updateTournament }>
    </div>
    <div class="field">
      <label>概要</label>
      <textarea rows="2" name="detail" onchange={ updateTournament } placeholder="大会の詳細など。URLを貼ると自動でリンクに変換されます。">{ tournament.detail }</textarea>
    </div>
    <div class="field">
      <label>
        <input type="checkbox" name="consolationRound" onclick={ updateTournament } checked={ tournament.consolationRound }>
        ３位決定戦を実施する
      </label>
    </div>
    <div class="field">
      <label>
        <input type="checkbox" name="scoreLess" onclick={ updateTournament } checked={ tournament.scoreLess }>
        スコアなし（勝敗のみ記録する）
      </label>
    </div>
    <div class="field">
      <label>チーム名表示幅</label>
      <input type="range" name="nameWidth" value="{tournament.nameWidth || 100}" onchange={ updateTournament } min="50" max="300" step="5">
      { tournament.nameWidth || 100 }
    </div>
    <div class="field">
      <label>スコア表示幅</label>
      <input type="range" name="scoreWidth" value="{tournament.scoreWidth || 40}" onchange={ updateTournament } min="20" max="100" step="5" disabled={ tournament.scoreLess }>
      { tournament.scoreWidth || 40 }
    </div>
  </div>


  <style>
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


    /***********************************************
    * Functions
    ***********************************************/
    updateTournament(e) {
      attribute = e.target.name
      value = (e.target.type != 'checkbox') ? e.target.value : e.target.checked
      that.tournament[attribute] = value
      obs.trigger("tournamentChanged", that.tournament)
    }
  </script>
</settings>
