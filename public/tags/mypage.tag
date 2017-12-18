<mypage>
  <div class="ui stackable centered grid">
    <div class="ui twelve wide column">
      <h1 class="ui medium header">
        <i class="icon list"></i>
        作成済みトーナメント表
      </h1>
      <div class="ui right floated red small button" onclick={ createAndRedirectToTournament }>
          <i class="icon plus"></i>
          トーナメント表作成
      </div>
      <br><br>

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
              <div class="ui icon red basic button" data-tournament-id={ item.id } data-tooltip="削除する" data-inverted="" onclick={ removeTournament }><i class="icon trash"></i></a>
            </td>
          </tr>
        </tbody>
      </table>

      <p if={ !user }>作成済みトーナメント表を見るには<a href="signin">ログイン</a>してください</p>
      <p if={ user && items.length==0 }>まだトーナメント表がありません。新規作成ボタンから作ってみてください。</p>
    </div>
  </div>

  <style>
  .grid { margin: 30px 0; }
  </style>

  <script>
    var that = this
    that.deletedList = []
    that.mixin('tournamentMixin')

    firebase.auth().onAuthStateChanged(function(user) {
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

    createAndRedirectToTournament() {
      obs.trigger("dimmerChanged", 'active')
      that.createTournament(that.user.uid).then(function(id){
        route('tournaments/' + id + '/edit')
      })
    }

    removeTournament(e) {
      var ok = confirm('データを削除します。本当によろしいですか？')
      if(!ok) { return false }

      obs.trigger("dimmerChanged", 'active')
      var tournamentId = e.currentTarget.dataset.tournamentId

      db.collection("tournaments").doc(tournamentId).delete().then(function() {
        that.deletedList.push(tournamentId)
        that.update()
        obs.trigger("dimmerChanged", '')
      })
    }
  </script>
</mypage>
