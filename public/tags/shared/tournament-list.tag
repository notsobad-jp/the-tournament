<tournament-list>
  <table class="ui basic table" if={ items.length!=0 }>
    <tbody>
      <tr each={ item, index in items } if={ deletedList.indexOf(item.id) < 0 }>
        <td>
          <a href={ '/tournaments/'+item.id }>
            { item.data().title }
          </a>
          <br>
          <small>
            <i class="icon clock"></i>
            最終更新: { (item.data().createdAt) ? formatDate(item.data().createdAt, 'YYYY年MM月DD日 hh:mm') : '--' }
          </small>
        </td>
        <td class="right aligned" if={ editable }>
          <a class="ui icon primary basic button" href={ '/tournaments/'+item.id+'/edit' } data-tooltip="編集する" data-inverted="">
            <i class="icon setting"></i>
            編集
          </a>
          <div class="ui icon red basic button" data-tournament-id={ item.id } data-tooltip="削除する" data-inverted="" onclick={ removeTournament }><i class="icon trash"></i></div>
        </td>
      </tr>
    </tbody>
  </table>
  <div class="ui basic segment" if={ items.length==0 }>
    <p>まだトーナメント表がありません...😢</p>

    <div class="ui red button" onclick={ createAndRedirectToTournament }>
      <i class="icon plus"></i>
      トーナメント表を作成する
    </div>
  </div>


  <style>
    @media only screen and (max-width: 767px) {
      .ui.table:not(.unstackable) td:first-child, .ui.table:not(.unstackable) th:first-child small {
        font-weight: normal;
      }
    }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.items = opts.items
    that.editable = opts.editable
    that.deletedList = []


    /***********************************************
    * Functions
    ***********************************************/
    /* トーナメントのIDだけ取得して新規作成画面に遷移 */
    createAndRedirectToTournament() {
      let newTnmtRef = db.collection("tournaments").doc()
      route('tournaments/' + newTnmtRef.id + '/edit')
    }

    formatDate(date, format) {
      if (!format) format = 'YYYY-MM-DD hh:mm:ss.SSS';
      format = format.replace(/YYYY/g, date.getFullYear());
      format = format.replace(/MM/g, ('0' + (date.getMonth() + 1)).slice(-2));
      format = format.replace(/DD/g, ('0' + date.getDate()).slice(-2));
      format = format.replace(/hh/g, ('0' + date.getHours()).slice(-2));
      format = format.replace(/mm/g, ('0' + date.getMinutes()).slice(-2));
      format = format.replace(/ss/g, ('0' + date.getSeconds()).slice(-2));
      if (format.match(/S/g)) {
        var milliSeconds = ('00' + date.getMilliseconds()).slice(-3);
        var length = format.match(/S/g).length;
        for (var i = 0; i < length; i++) format = format.replace(/S/, milliSeconds.substring(i, i + 1));
      }
      return format;
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
</tournament-list>
