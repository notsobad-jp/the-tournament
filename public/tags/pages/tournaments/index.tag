<index>
  <div>
    <breadcrumb breads={ breads }></breadcrumb>

    <div class="ui stackable padded centered grid">
      <div class="ui eleven wide column">
        <div class="ui secondary pointing menu">
          <div class="ui active item">
            <i class="icon search"></i>
            すべてのトーナメント表
          </div>
        </div>
        <tournament-list></tournament-list>
        <div class="ui hidden divider"></div>
      </div>


      <div class="ui four wide computer only column">
        <div class="ui half page test ad" data-text="広告枠"></div>
      </div>
      <div class="ui four wide mobile tablet only column">
        <div class="ui medium rectangle centered test ad" data-text="広告枠"></div>
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
    that.breads = [
      { title: 'すべてのトーナメント表一覧' }
    ]

    /* metatag setting */
    let meta = {
      title: 'トーナメント表一覧',
      description: 'トーナメント表の一覧です',
      keyword: '一覧'
    }
    that.setMetatags(meta)
  </script>
</index>
