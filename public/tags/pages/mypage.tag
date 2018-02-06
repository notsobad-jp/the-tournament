<mypage>
  <div if={ user }>
    <breadcrumb breads={ breads }></breadcrumb>

    <div class="ui stackable padded centered grid">
      <div class="ui eleven wide column">
        <div class="ui secondary pointing menu">
          <div class="ui active item">
            <i class="icon folder"></i>
            作成済みトーナメント表
          </div>
        </div>
        <tournament-list editable={ true } user={ user }></tournament-list>
        <div class="ui hidden divider"></div>
      </div>


      <div class="ui four wide computer only column">
        <div class="ui center aligned segment">
          <img class="ui tiny circular bordered centered image" src={ user.photoURL } alt={ user.displayName || user.email } if={ user && user.photoURL }>
          <i class="user huge circular icon" if={ !user || !user.photoURL }></i>
          <h1 class="ui small header">
            { ( user && !user.isAnonymous ) ? user.displayName || user.email : 'ゲストユーザー' }
            <div class="subheader">
              <i class="small icon { userIcon() }" if={ userIcon() }></i>
            </div>
          </h1>

          <div class="ui basic button" onclick={signOut} if={ user && !user.isAnonymous }>
            <i class="icon sign out"></i>
            ログアウト
          </div>
          <a class="ui basic button" href='/signin' if={ !user || user.isAnonymous }>
            <i class="icon sign in"></i>
            簡単ログイン
          </a>
        </div>
        <div class="ui hidden divider"></div>
      </div>


      <div class="ui four wide mobile tablet only column">
        <div class="ui feed secondary segment">
          <div class="event">
            <div class="label">
              <img src={ user.photoURL } alt={ user.displayName || user.email } if={ user && user.photoURL }>
              <i class="user small circular icon" if={ !user || !user.photoURL }></i>
            </div>
            <div class="content">
              <div class="summary">
                { ( user && !user.isAnonymous ) ? user.displayName || user.email : 'ゲストユーザー' }
                <div class="date">
                  <i class="small icon { userIcon() }" if={ userIcon() }></i>
                </div>
              </div>
              <div class="meta">
                <div class="ui basic mini button" onclick={signOut} if={ user && !user.isAnonymous }>
                  <i class="icon sign out"></i>
                  ログアウト
                </div>
                <a class="ui primary basic mini button" href='/signin' if={ !user || user.isAnonymous }>
                  <i class="icon sign in"></i>
                  簡単ログイン
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="ui hidden divider"></div>
      </div>
    </div>
  </div>


  <style>
    .grid { margin: 30px 0; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.deletedList = []
    that.breads = [
      { title: 'マイページ' }
    ]

    /* metatag setting */
    let meta = {
      title: 'マイページ',
      description: 'マイページだよ',
      keyword: 'マイページ'
    }
    that.setMetatags(meta)


    /***********************************************
    * Observables
    ***********************************************/
    var authUnsubscribe = firebase.auth().onAuthStateChanged(function(user) {
      that.user = user
      if(user) {
        obs.trigger("dimmerChanged", 'active')

        var docRef = db.collection("tournaments").where("userId", "==", that.user.uid).orderBy('updatedAt', 'desc')
        docRef.get().then(function(querySnapshot){
          that.items = querySnapshot.docs
          that.update()
          obs.trigger("dimmerChanged", '')
        })
      }
    })

    that.on('unmount', function(){
      authUnsubscribe()
    })


    /***********************************************
    * Functions
    ***********************************************/
    signOut() {
      firebase.auth().signOut()
      obs.trigger("flashChanged", {type:'success',text:'ログアウトしました'})
      route('/')
    }

    userIcon() {
      if(!that.user) { return false }

      if(that.user.providerData[0] && that.user.providerData[0].providerId) {
        let providerId = that.user.providerData[0].providerId
        if(providerId == 'facebook.com') {
          return 'facebook'
        }else if(providerId == 'twitter.com') {
          return 'twitter'
        }else if(providerId == 'google.com') {
          return 'google'
        }
      }else {
        return false
      }
    }
  </script>
</mypage>
