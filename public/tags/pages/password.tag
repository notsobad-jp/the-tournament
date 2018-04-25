<password>
  <div class="ui padded basic segment">
    <br><br>
    <div class="ui center aligned stackable grid">
      <div class="ui six wide column">
        <h3 class="ui header">
          <i class="icon key"></i>
          パスワードログイン
        </h3>
        <br>
        <div class="ui pointing secondary menu">
          <a class="item { active: activeTab == 'login' }" data-tab="login" onclick={ changeTab }>ログイン</a>
          <a class="item { active: activeTab == 'setting' }" data-tab="setting" onclick={ changeTab }>パスワード設定</a>
        </div>

        <!-- ログイン -->
        <div class="ui tab clearing segment { active: activeTab == 'login' }">
          <div class="ui warning message" if={ user && !user.isAnonymous }>
            <i class="icon circle warning"></i>
            すでにログインしています
          </div>

          <form class="ui form">
            <div class="field">
              <input ref="email" type="text" name="email" placeholder="E-mail" disabled={ user && !user.isAnonymous }>
            </div>
            <div class="field">
              <input ref="password" type="password" name="password" placeholder="password" disabled={ user && !user.isAnonymous }>
            </div>
            <button class="ui left floated primary button" type="submit" disabled={ user && !user.isAnonymous } onclick={ signin }>ログイン</button>
          </form>
        </div>

        <!-- パスワード設定 -->
        <div class="ui tab clearing segment { active: activeTab == 'setting' }">
          <div class="ui warning message" if={ !user || user.isAnonymous }>
            <i class="icon circle warning"></i>
            ログインしてください
          </div>

          <form class="ui form">
            <div class="field">
              <input ref="newPassword" type="password" name="newPassword" placeholder="新しいパスワード" disabled={ !user || user.isAnonymous }>
            </div>
            <button class="ui left floated red button" type="submit" disabled={ !user || user.isAnonymous } onclick={ updatePassword }>設定</button>
          </form>
        </div>
      </div>
    </div>
    <br><br>
  </div>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.user = null
    that.activeTab = 'login'


    /***********************************************
    * Observables
    ***********************************************/
    that.on('mount', function() {
      obs.trigger("dimmerChanged", 'active')
    })

    that.on('unmount', function() {
      authUnsubscribe()
    })

    //匿名ユーザー情報を取得して、アカウント紐付けが必要か判別
    var authUnsubscribe = firebase.auth().onAuthStateChanged(function(user) {
      that.user = user
      obs.trigger("dimmerChanged", '')
      that.update()
    })


    /***********************************************
    * Functions
    ***********************************************/
    changeTab(e) {
      that.activeTab = e.currentTarget.getAttribute('data-tab')
    }

    signin(e) {
      e.preventDefault()
      obs.trigger("dimmerChanged", 'active')

      firebase.auth().signInWithEmailAndPassword(that.refs.email.value, that.refs.password.value).then(function(){
        obs.trigger("flashChanged", {type:'success',text:'ログインしました'})
        route('/mypage')
      }).catch(function(error) {
        obs.trigger("flashChanged", {type:'error', text: error.message, permanent: true})
        console.log(error)
      }).then(function(){
        obs.trigger("dimmerChanged", '')
      });
    }

    updatePassword(e) {
      e.preventDefault()
      obs.trigger("dimmerChanged", 'active')

      that.user.updatePassword(that.refs.newPassword.value).then(function() {
        obs.trigger("flashChanged", {type:'success',text:'パスワードを変更しました！'})
      }).catch(function(error) {
        obs.trigger("flashChanged", {type:'error', text: error.message, permanent: true})
        console.log(error)
      }).then(function(){
        obs.trigger("dimmerChanged", '')
      });
    }
  </script>
</password>
