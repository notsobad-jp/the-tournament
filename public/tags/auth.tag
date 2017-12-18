<auth>
  <div class="ui padded basic segment">
    <br><br>
    <div class="ui three column center aligned stackable grid">
      <div class="ui column">
        <div class="ui center aligned basic segment">
            <i class="icons">
              <i class="purple inverted mail circular huge icon"></i>
              <i class="horizontally flipped wizard huge icon"></i>
            </i>
            <h1 class="ui header">
              Magic Login
              <div class="sub header">
                入力したメールアドレスに、ログイン用URLがメールで届きます。
              </div>
            </h1>
          <div class="ui action fluid input">
            <input type="text" ref="email" placeholder="メールアドレス">
            <button class="ui pink right labeled icon button" onclick={ magicAuth }>
              <i class="send icon"></i>
              送信
            </button>
          </div>
          <div if={ message } class="ui visible left aligned basic segment { message.type } message">{ message.text }</div>
        </div>
      </div>
    </div>
    <br><br>
  </div>


  <script>
    var that = this

    firebase.auth().onAuthStateChanged(function(user) {
      that.user = user
    })

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
