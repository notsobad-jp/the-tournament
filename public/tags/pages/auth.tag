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
    that.user = null
    that.accountLinkable = false


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
        obs.trigger("dimmerChanged", '')
        route('/mypage')
        return false
      }

      //匿名ユーザーの場合は、トーナメント作成してたらアカウント紐付け
      var docRef = db.collection("anonymousUsers").doc(user.uid)
      docRef.get().then(function(doc){
        if(doc.exists) {
          that.accountLinkable = true
        }
        obs.trigger("dimmerChanged", '')
      })
    })

    //ログイン成功
    firebase.auth().getRedirectResult().then(function(result) {
      if(result.user) {
        obs.trigger("flashChanged", {type:'success',text:'ログインしました！'})
      }
    //ログイン失敗
    }).catch(function(error) {
      // ゲストから登録済みのユーザーに紐付けようとしたとき
      if(error.code == 'auth/credential-already-in-use') {
        obs.trigger("dimmerChanged", '')
        let alertMessage = 'すでに登録済みのアカウントに、ゲストユーザーのトーナメント表を引き継ぐことはできません。ログインすると現在ゲストで作成したトーナメント表は失われますが、よろしいですか？'
        if(confirm(alertMessage)) {
          firebase.auth().signInWithCredential(error.credential).then(function(){
            obs.trigger("flashChanged", {type:'success',text:'ログインしました！'})
          })
        }else {
          obs.trigger("flashChanged", {
            type: 'error',
            text: 'ログインをキャンセルしました。現在ゲストで作成しているトーナメント表を引き継ぎたい場合、運営までお問い合わせください。',
            permanent: true
          })
          return false
        }
      // その他のエラー
      }else {
        obs.trigger("flashChanged", {
          type: 'error',
          text: '【エラー】' + error.message,
          permanent: true
        })
        console.log(error)
      }
    })


    /***********************************************
    * Functions
    ***********************************************/
    snsLogin(providerName) {
      obs.trigger("dimmerChanged", 'active')

      var provider = ""
      if(providerName=='facebook') {
        provider = new firebase.auth.FacebookAuthProvider()
      }else if(providerName=='twitter') {
        provider = new firebase.auth.TwitterAuthProvider()
      }else if(providerName=='google') {
        provider = new firebase.auth.GoogleAuthProvider()
      }

      if(that.accountLinkable) {
        that.user.linkWithRedirect(provider)
      }else {
        firebase.auth().signInWithRedirect(provider)
      }
    }

    magicAuth() {
      that.errorMessage = ''
      obs.trigger("dimmerChanged", 'active')
      var newPassword = Math.random().toString(36).slice(-12)

      if(that.accountLinkable) {
        var credential = firebase.auth.EmailAuthProvider.credential(that.refs.email.value, newPassword);
        var userPromise = firebase.auth().currentUser.linkWithCredential(credential)
      }else {
        var userPromise = firebase.auth().createUserWithEmailAndPassword(that.refs.email.value, newPassword)
      }

      //新規登録orアカウントリンク実行
      userPromise.then(function(){
        //新規ユーザーだった場合
        firebase.auth().sendPasswordResetEmail(that.refs.email.value)
        that.message = {
          type: 'success',
          text: 'ログイン用のメールを送信しました。メール内のリンクをクリックしてログインしてください。'
        }
      }).catch(function(error) {
        //アドレスが既に登録済みの場合
        if(error.code == 'auth/email-already-in-use') {
          // ゲストからの引き継ぎがある場合、確認アラートしてキャンセルを許可
          if(that.accountLinkable) {
            let alertMessage = 'すでに登録済みのアカウントに、ゲストユーザーのトーナメント表を引き継ぐことはできません。ログインすると現在ゲストで作成したトーナメント表は失われますが、よろしいですか？'
            if(!confirm(alertMessage)) {
              obs.trigger("flashChanged", {
                type: 'error',
                text: 'ログインをキャンセルしました。現在ゲストで作成しているトーナメント表を引き継ぎたい場合、運営までお問い合わせください。',
                permanent: true
              })
              return false
            }
          }
          // 簡単ログインメール送信
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
