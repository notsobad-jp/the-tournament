<tournament-list>
  <table class="ui basic table" if={ user && items.length!=0 }>
    <tbody>
      <tr each={ item, index in items } if={ deletedList.indexOf(item.id) < 0 }>
        <td>
          <a href={ '/tournaments/'+item.id }>
            { item.data().title }
          </a>
          <br>
          <small>
            <i class="icon clock"></i>
            最終更新: { formatDate(item.data().createdAt, 'YYYY年MM月DD日 hh:mm') }
          </small>
        </td>
        <td class="right aligned">
          <a class="ui icon primary basic button" href={ '/tournaments/'+item.id+'/edit' } data-tooltip="編集する" data-inverted="">
            <i class="icon setting"></i>
            編集
          </a>
          <div class="ui icon red basic button" data-tournament-id={ item.id } data-tooltip="削除する" data-inverted="" onclick={ removeTournament }><i class="icon trash"></i></div>
        </td>
      </tr>
    </tbody>
  </table>


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
    that.deletedList = []


    /***********************************************
    * Observables
    ***********************************************/


    /***********************************************
    * Functions
    ***********************************************/
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
