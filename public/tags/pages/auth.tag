<auth>
  <div class="ui padded basic segment">
    <br><br>
    <div class="ui center aligned stackable grid">
      <div class="ui six wide column">
        <div class="ui basic padded segment">
          <h3 class="ui header">
            <i class="icon mail"></i>
            メールアドレスでログイン
          </h3>
          <br>

          <div class="ui action fluid input">
            <input type="text" ref="email" placeholder="メールアドレス">
            <button class="ui pink right labeled icon button" onclick={ magicAuth }>
              <i class="send icon"></i>
              送信
            </button>
          </div>
          <br>
          <p><small>入力したメールアドレスに、ログイン用URLが届きます。</small></p>
          <div if={ message } class="ui visible left aligned basic segment { message.type } message">{ message.text }</div>
        </div>
      </div>

      <div class="ui vertical divider">OR</div>

      <div class="ui six wide column">
        <div class="ui basic padded segment">
          <h3 class="ui header">
            <i class="icon user"></i>
            SNSアカウントでログイン
          </h3>
          <br>

          <div class="ui facebook fluid large button" onclick={ snsLogin.bind(this, 'facebook') }>
            <i class="icon facebook"></i>
            Facebookでログイン
          </div>
          <br>
          <div class="ui twitter fluid large button" onclick={ snsLogin.bind(this, 'twitter') }>
            <i class="icon twitter"></i>
            Twitterでログイン
          </div>
          <br>
          <div class="ui google plus fluid large button" onclick={ snsLogin.bind(this, 'google') }>
            <i class="icon google"></i>
            Googleでログイン
          </div>
          <br>
          <p><small>※もちろん勝手に投稿したりしませんのでご安心ください。</small></p>
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


    /***********************************************
    * Observables
    ***********************************************/
    firebase.auth().onAuthStateChanged(function(user) {
      that.user = user
    })


    /***********************************************
    * Functions
    ***********************************************/
    snsLogin(providerName) {
      var provider = ""
      if(providerName=='facebook') {
        provider = new firebase.auth.FacebookAuthProvider()
      }else if(providerName=='twitter') {
        provider = new firebase.auth.TwitterAuthProvider();
      }else if(providerName=='google') {
        provider = new firebase.auth.GoogleAuthProvider();
      }
      firebase.auth().signInWithRedirect(provider);
    }

    magicAuth() {
      that.errorMessage = ''
			obs.trigger("dimmerChanged", 'active')
      var newPassword = Math.random().toString(36).slice(-12)

      firebase.auth().createUserWithEmailAndPassword(that.refs.email.value, newPassword).then(function(){
        //新規ユーザーの場合
        firebase.auth().sendPasswordResetEmail(that.refs.email.value)
        firebase.auth().signOut()
        that.message = {
          type: 'success',
          text: 'ログイン用のメールを送信しました。メール内のリンクをクリックしてログインしてください。'
        }
      }).catch(function(error) {
        //アドレスが既に登録済みの場合
        if(error.code == 'auth/email-already-in-use') {
          firebase.auth().sendPasswordResetEmail(that.refs.email.value)
          that.message = {
            type: 'success',
            text: 'ログイン用のメールを送信しました。メール内のリンクをクリックしてログインしてください。'
          }
        //validationエラーなど
        }else {
          that.message = {
            type: 'error',
            text: error.message
          }
        }
      }).then(function(){
        that.update()
			  obs.trigger("dimmerChanged", '')
      })
    }
  </script>
</auth>
