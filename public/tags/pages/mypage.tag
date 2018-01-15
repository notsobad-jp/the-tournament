<mypage>
  <div class="ui stackable padded centered grid">
    <div class="ui eleven wide column">
      <div class="ui small breadcrumb">
        <a class="section" href="/">トップ</a>
        <i class="right chevron icon divider"></i>
        <div class="active section">マイページ</div>
      </div>

      <div class="ui secondary pointing menu">
        <div class="ui active item">
          <i class="icon folder"></i>
          作成済みトーナメント表
        </div>
      </div>
      <table class="ui basic table" if={ user && items.length!=0 }>
        <tbody>
          <tr each={ item, index in items } if={ deletedList.indexOf(item.id) < 0 }>
            <td>
              <a href={ '/tournaments/'+item.id+'/edit' }>
                { item.data().title }
              </a>
            </td>
            <td class="right aligned">
              <a class="ui icon primary button" href={ '/tournaments/'+item.id+'/edit' } data-tooltip="編集する" data-inverted=""><i class="icon setting"></i></a>
              <a class="ui icon primary basic button" href={ '/tournaments/'+item.id } data-tooltip="閲覧する" data-inverted=""><i class="icon search"></i></a>
              <div class="ui icon red basic button" data-tournament-id={ item.id } data-tooltip="削除する" data-inverted="" onclick={ removeTournament }><i class="icon trash"></i></div>
            </td>
          </tr>
        </tbody>
      </table>
      <div class="ui basic segment" if={ user && items.length==0 }>
        <p>まだ作成したトーナメント表がありません。</p>

        <div class="ui red button" onclick={ createAndRedirectToTournament }>
          <i class="icon plus"></i>
          トーナメント表を作成する
        </div>
      </div>
      <div class="ui hidden divider"></div>
    </div>


    <div class="ui four wide computer only column">
      <div class="ui center aligned segment">
        <img class="ui tiny circular bordered centered image" src={ user.photoURL } alt={ user.displayName } if={ user && user.photoURL }>
        <i class="user huge circular icon" if={ !user || !user.photoURL }></i>
        <h1 class="ui small header">
          { ( user && !user.isAnonymous ) ? user.displayName : 'ゲストユーザー' }
          <div class="subheader">
            <i class="small icon { userIcon() }" if={ userIcon() }></i>
          </div>
        </h1>

        <div class="ui basic button" onclick={signOut} if={ user && !user.isAnonymous }>
          <i class="icon sign out"></i>
          ログアウト
        </div>
        <div class="ui basic button" href='/signin' if={ !user || user.isAnonymous }>
          <i class="icon sign in"></i>
          簡単ログイン
        </div>
      </div>
      <div class="ui hidden divider"></div>
    </div>


    <div class="ui four wide mobile tablet only column">
      <div class="ui feed secondary segment">
        <div class="event">
          <div class="label">
            <img src={ user.photoURL } alt={ user.displayName } if={ user && user.photoURL }>
            <i class="user small circular icon" if={ !user || !user.photoURL }></i>
          </div>
          <div class="content">
            <div class="summary">
              { ( user && !user.isAnonymous ) ? user.displayName : 'ゲストユーザー' }
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

  <style>
  .grid { margin: 30px 0; }
  </style>

  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.deletedList = []

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

    removeTournament(e) {
      var ok = confirm('データを削除します。本当によろしいですか？')
      if(!ok) { return false }

      obs.trigger("dimmerChanged", 'active')
      var tournamentId = e.currentTarget.dataset.tournamentId

      db.collection("tournaments").doc(tournamentId).delete().then(function() {
        obs.trigger("dimmerChanged", '')
        that.deletedList.push(tournamentId)
        that.update()
      })
    }
  </script>
</mypage>
