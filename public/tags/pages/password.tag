<password>
  <div class="ui padded basic segment">
    <br><br>
    <div class="ui center aligned stackable grid">
      <div class="ui six wide column">
        <div class="ui basic padded segment">
          <h3 class="ui header">
            <i class="icon key"></i>
            パスワードでログイン
          </h3>
          <br>

          <form class="ui form">
            <div class="field">
              <input ref="email" type="text" name="email" placeholder="E-mail">
            </div>
            <div class="field">
              <input ref="password" type="password" name="password" placeholder="password">
            </div>
            <button class="ui left floated primary button" type="submit" onclick={ signin }>ログイン</button>
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
      if(!user.isAnonymous) {
        route('/mypage')
        return false
      }
      obs.trigger("dimmerChanged", '')
    })


    /***********************************************
    * Functions
    ***********************************************/
    signin(e) {
      e.preventDefault()
      firebase.auth().signInWithEmailAndPassword(that.refs.email.value, that.refs.password.value).then(function(){
        obs.trigger("flashChanged", {type:'success',text:'ログインしました'})
      }).catch(function(error) {
        obs.trigger("flashChanged", {type:'error', text: error.message})
        console.log(error)
      });
    }
  </script>
</password>
