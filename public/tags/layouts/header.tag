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
            ベータ版
          </span>
        </div>

        <div class="right menu">
          <div class="link item" onclick={ createAndRedirectToTournament }>
            <i class="icon plus"></i>
            トーナメント表作成
          </div>
          <a class="item" href="/mypage">
            <virtual if={ user && user.photoURL }>
              <img class="ui avatar image" src={ user.photoURL }>
            </virtual>
            <virtual if={ !user || !user.photoURL }>
              <i class="user icon"></i>
            </virtual>
            { (user && !user.isAnonymous) ? user.displayName || user.email : 'ゲストユーザー' }
          </a>

          <div class="ui dropdown item { active: menuOpened, visible: menuOpened }" onclick={ toggleMenu }>
            <i class="content icon { rotated: menuOpened }"></i>
            <div class="menu { transition: menuOpened, visible: menuOpened }">
              <div class="header">
                { (user && !user.isAnonymous) ? user.displayName || user.email : 'ゲストユーザー' }
              </div>
              <div class="divider"></div>
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
        <div class="item menu-title"></div>
        <div class="right menu">
          <div class="ui dropdown item { active: menuOpened, visible: menuOpened }" onclick={ toggleMenu }>
            <i class="content icon { rotated: menuOpened }"></i>
            <div class="menu { transition: menuOpened, visible: menuOpened }">
              <div class="header">
                <virtual if={ user && user.photoURL }>
                  <img class="ui avatar image" src={ user.photoURL }>
                </virtual>
                { (user && !user.isAnonymous) ? user.displayName || user.email : 'ゲストユーザー' }
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
              <a class="item" onclick={signOut} if={ user && !user.isAnonymous }>
                <i class="icon sign out"></i>
                ログアウト
              </a>
              <a class="item" href='/signin' if={ !user || user.isAnonymous }>
                <i class="icon sign in"></i>
                ログイン
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <style>
    .grid { margin: 0 !important; }
    .row { padding: 0 !important; }
    .ui.fluid.menu {
      margin-bottom: -1px;
      border: none;
      border-radius: 0;
      z-index: 3;
    }
    .header.item {
      background-color: #333 !important;
      padding: 5px 25px !important;
      border-radius: 0 !important;
    }
    .header.item img { height: 20px; }
    .icon.content { transition: all 300ms 0s ease; }
    .label.item { padding-left: 0 !important; }
    .right.menu .item {
      padding-top: 0px;
      padding-bottom: 0px;
    }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.menuOpened = false


    /***********************************************
    * Observables
    ***********************************************/
    firebase.auth().onAuthStateChanged(function(user) {
      if(user) {
        that.user = user
        that.update()
      }else {
        firebase.auth().signInAnonymously()
      }
    })


    /***********************************************
    * Functions
    ***********************************************/
    /* トーナメントのIDだけ取得して新規作成画面に遷移 */
    createAndRedirectToTournament() {
      let newTnmtRef = db.collection("tournaments").doc()
      route('tournaments/' + newTnmtRef.id + '/edit')
    }

    signOut() {
      firebase.auth().signOut()
      obs.trigger("flashChanged", {type:'success',text:'ログアウトしました'})
      route('/')
    }

    toggleMenu() {
      that.menuOpened = !that.menuOpened
    }
  </script>
</header>
