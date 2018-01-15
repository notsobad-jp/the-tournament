<search>
  <div class="ui padded centered secondary grid">
    <div class="ui fifteen wide column">
      <div class="ui tiny breadcrumb">
        <a class="section" href="/">トップ</a>
        <i class="right chevron icon divider"></i>
        <div class="active section">すべてのトーナメント表</div>
      </div>
    </div>
  </div>


  <div class="ui stackable padded centered grid" if={ items }>
    <div class="ui eleven wide column">
      <div class="ui secondary pointing menu">
        <div class="ui active item">
          <i class="icon search"></i>
          すべてのトーナメント表
        </div>
      </div>
      <tournament-list items={ items }></tournament-list>
      <div class="ui hidden divider"></div>
    </div>


    <div class="ui four wide computer only column">
      <div class="ui half page test ad" data-text="広告枠"></div>
    </div>
    <div class="ui four wide mobile tablet only column">
      <div class="ui medium rectangle centered test ad" data-text="広告枠"></div>
    </div>
  </div>


  <style>
    .grid { margin: 30px 0; }
    .secondary.grid { background: #F3F4F5; }
    .secondary.grid .fifteen.wide.column { padding: 0.7em; }
  </style>


	<script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this

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
