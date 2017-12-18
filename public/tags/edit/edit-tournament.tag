<edit-tournament>
  <div class="ui stackable centered padded grid" if={ tournament }>
    <div class="ui one wide computer only dark column" data-is="menu" device="computer"></div>
    <div class="ui one wide tablet mobile only dark column" data-is="menu" device="mobile"></div>

    <div class="ui five wide secondary column">
      <form class="ui form">
        <div class="ui basic segment active tab" data-tab="settings">
          <settings tournament={ tournament }></settings>
        </div>
        <div class="ui basic segment tab" data-tab="teams">
          <teams tournament={ tournament }></teams>
        </div>
        <div class="ui basic segment tab" data-tab="results">
          <h3 class="ui tiny header">試合結果の登録</h3>
          <results tournament={ tournament } editable={ true }></results>
        </div>
        <div class="ui basic segment tab" data-tab="share">
          <share tournament={ tournament }></share>
        </div>
      </form>
    </div>

    <div class="ui ten wide column">
      <div class="ui basic segment">
        <bracket tournament={ tournament } editable={ true }></bracket>
      </div>
      <br><br>
    </div>
  </div>

  <div class="ui bottom fixed borderless menu">
    <div class="item">
      <button class="ui red small button" onclick={ saveTournament } disabled={ JSON.stringify(tournament) == JSON.stringify(originalTournament) }>保存する</button>
    </div>

    <div class="right menu">
      <a href="/tournaments/{ opts.id }" class="item">
        <i class="icon remove"></i>
        閉じる
      </a>
    </div>
  </div>


  <style>
    /* メニューまわり */
    .ui.secondary.column, .ui.secondary.grid { background-color: #F3F4F5 !important; }
    .ui.one.wide.column { padding: 0 !important; }
    .ui.dark.column { background-color: #2D3E4F !important; }

    .ui.ten.wide.column { min-height: calc(100vh - 45px) }
    .ui.menu.fixed { z-index: 999; }

    /*  PCではカラム別にスクロール */
    @media screen and (min-width: 481px) {
      .five.wide.column, .ten.wide.column {
        height: 100vh !important;
        margin-bottom: 30px !important;
        overflow: scroll !important;
      }
    }
    /*  スマホでは編集カラムをデフォルト非表示 */
    @media screen and (max-width: 480px) {
      .five.wide.secondary.column {
         padding: 0 !important;
         display: none;
       }
    }
  </style>


  <script>
    var that = this

    firebase.auth().onAuthStateChanged(function(user) {
      that.user = user
    })

    // Footer表示制御
    obs.trigger("footerVisibility", false)
    that.on('unmount', function() {
      obs.trigger("footerVisibility", true)
    })

    obs.on("tournamentChanged", function(tournament) {
      that.tournament = tournament
      that.update()
    })

    obs.trigger("dimmerChanged", 'active')
    var docRef = db.collection("tournaments").doc(opts.id)
    docRef.get().then(function(doc){
      if(doc.exists) {
        that.tournament = doc.data()
        that.originalTournament = doc.data()
        that.update()
        obs.trigger("dimmerChanged", '')
      }else {
        alert('ごめんなさい、トーナメント表の取得に失敗しました…。URLを再度ご確認ください。')
        obs.trigger("dimmerChanged", '')
        route('/')
      }
    })

    saveTournament() {
      obs.trigger("dimmerChanged", 'active')
      var docRef = db.collection("tournaments").doc(opts.id)
      that.tournament['updatedAt'] = new Date()
      docRef.set(that.tournament)
      .then(function(docRef) {
        that.originalTournament = JSON.parse(JSON.stringify(that.tournament))
        that.message = { type: 'success', text: 'トーナメントデータを保存しました' }
      })
      .catch(function(error) {
        that.message = { type: 'error', text: 'トーナメント作成に失敗しました…' }
      })
      .then(function(){
        obs.trigger("dimmerChanged", '')
        that.update()
      })
    }

    removeTournament(e) {
      var ok = confirm('データを削除します。本当によろしいですか？')
      if(!ok) { return false }

      obs.trigger("dimmerChanged", 'active')
      db.collection("tournaments").doc(opts.id).delete().then(function() {
        obs.trigger("dimmerChanged", '')
        route('/mypage')
      })
    }

    $(function(){
      $('.ui.checkbox').checkbox()
    })
  </script>
</edit-tournament>
