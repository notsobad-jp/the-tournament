<search>
  <div class="ui stackable centered grid">
    <div class="ui twelve wide column">
      <h1 class="ui medium header">
        <i class="icon list"></i>
        トーナメント表一覧
      </h1>
      <br><br>

      <table class="ui basic table" if={ items && items.length!=0 }>
        <tbody>
          <tr each={ item, index in items }>
            <td>
              <a href={ '/tournaments/'+item.id }>
                { item.data().title }
              </a>
            </td>
            <td class="right aligned">
              <a class="ui icon primary basic button" href={ '/tournaments/'+item.id } data-tooltip="閲覧する" data-inverted=""><i class="icon search"></i></a>
            </td>
          </tr>
        </tbody>
      </table>
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
    that.mixin('tournamentMixin')

    /* metatag setting */
    let meta = {
      title: 'トーナメント表一覧',
      description: 'トーナメント表の一覧です',
      keyword: '一覧'
    }
    that.setMetatags(meta)


    /***********************************************
    * Observables
    ***********************************************/
    obs.trigger("dimmerChanged", 'active')
    var docRef = db.collection("tournaments").orderBy('updatedAt', 'desc')
    docRef.get().then(function(querySnapshot){
      that.items = querySnapshot.docs
      that.update()
      obs.trigger("dimmerChanged", '')
    })
  </script>
</search>
