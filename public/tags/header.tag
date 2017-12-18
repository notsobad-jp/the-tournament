<header>
  <div class="ui grid">
    <div class="computer only row">
      <div class="ui borderless fluid menu">
        <a href="/" class="header item">
          <h2>
            <img class="ui image" src="/img/logo_w.png">
          </h2>
        </a>
        <div class="label item">
          <span class="ui left pointing pink mini label">
            アルファ版
          </span>
        </div>

        <div class="right menu">
          <div class="link item" onclick={ createAndRedirectToTournament }>
            <i class="icon plus"></i>
            トーナメント表作成
          </div>
          <a class="item" href="/mypage">
            <i class="user icon"></i>
            マイページ
          </a>

          <!--
          <div class="ui simple dropdown item">
            <i class="content icon"></i>
            <div class="menu">
              <a class="item" href="/mypage">
                <i class="icon folder"></i>
                マイページ
              </a>
              <a class="item" onclick={signOut} if={ user && !user.isAnonymous }>
                <i class="icon sign out"></i>
                ログアウト
              </a>
              <a class="item" href='/signin' if={ !user || user.isAnonymous }>
                <i class="icon sign in"></i>
                簡単ログイン
              </a>
            </div>
          </div>
          -->
        </div>
      </div>
    </div>

    <div class="mobile tablet only row">
      <div class="ui borderless fluid menu">
        <a href="/" class="header item">
          <h2>
            <img class="ui image" src="/img/logo_w.png">
          </h2>
        </a>
        <div class="label item">
          <span class="ui left pointing pink mini label">
            アルファ版
          </span>
        </div>
        <div class="item menu-title"></div>
        <div class="right menu">
          <div class="ui simple dropdown item">
            <i class="content icon"></i>
            <div class="menu">
              <div class="header">
                { (user && !user.isAnonymous) ? user.email : 'ゲストユーザー' }
              </div>
              <div class="divider"></div>
              <div class="item" onclick={ createAndRedirectToTournament }>
                <i class="icon plus"></i>
                トーナメント表を作る
              </div>
              <a class="item" href="/mypage">
                <i class="icon user"></i>
                マイページ
              </a>
              <!--
              <a class="item" onclick={signOut} if={ user && !user.isAnonymous }>
                <i class="icon sign out"></i>
                ログアウト
              </a>
              <a class="item" href='/signin' if={ !user || user.isAnonymous }>
                <i class="icon sign in"></i>
                簡単ログイン
              </a>
              -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <style>
    .ui.fluid.menu { margin-bottom: -1px; }

    .header.item {
      background-color: #333 !important;
      padding: 5px 25px !important;
    }
    .header.item img { height: 20px; }

    .label.item { padding-left: 0 !important; }
  </style>


  <script>
    var that = this
    obs.on("mixinMounted", function() {
      that.mixin('tournamentMixin')
    })

    firebase.auth().onAuthStateChanged(function(user) {
      if(user) {
        that.user = user
        that.update()
      }else {
        firebase.auth().signInAnonymously()
      }
    })

    signOut() {
      firebase.auth().signOut()
      obs.trigger("flashChanged", {type:'success',text:'ログアウトしました'})
      route('/')
    }

    createAndRedirectToTournament() {
      obs.trigger("dimmerChanged", 'active')
      that.createTournament(that.user.uid).then(function(id){
        route('tournaments/' + id + '/edit')
      })
    }

    $(function(){
      $('.ui.dropdown').dropdown()
    })
  </script>
</header>
