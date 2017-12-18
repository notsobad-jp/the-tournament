<menu>
  <div class="ui vertical fluid attached dark inverted labeled icon small pointing tabular menu" if={ opts.device == 'computer' }>
    <a class="active item" data-tab="settings">
      <i class="setting icon"></i>
      <small>基本情報</small>
    </a>
    <a class="item" data-tab="teams">
      <i class="users icon"></i>
      <small>参加者</small>
    </a>
    <a class="item" data-tab="results">
      <i class="table icon"></i>
      <small>試合結果</small>
    </a>
    <a class="item" data-tab="share">
      <i class="share alternate icon"></i>
      <small>共有</small>
    </a>
  </div>

  <div class="ui fluid five item attached dark inverted labeled icon tiny pointing tabular menu" if={ opts.device == 'mobile' }>
    <a class="item" onclick={ toggleMenu }>
      <i class="content icon"></i>
      <small>メニュー</small>
    </a>
    <a class="active item" data-tab="settings">
      <i class="setting icon"></i>
      <small>基本情報</small>
    </a>
    <a class="item" data-tab="teams">
      <i class="users icon"></i>
      <small>参加者</small>
    </a>
    <a class="item" data-tab="results">
      <i class="table icon"></i>
      <small>試合結果</small>
    </a>
    <a class="item" data-tab="share">
      <i class="share alternate icon"></i>
      <small>共有</small>
    </a>
  </div>


  <style>
    .ui.item.menu { justify-content: left; }
    .ui.tabular.menu .active.item { margin: 0 !important; }
    .ui.inverted.pointing.dark.menu { background-color: #2D3E4F !important; }
    .ui.inverted.pointing.dark.menu .active.item {
      background-color: #0e1d2d !important;
      border-color: #0e1d2d !important;
      border-radius: 0 !important;
    }
    .ui.inverted.pointing.dark.menu .active.item:after { background-color: #0e1d2d !important; }

    /*  スマホではメニューを初期非表示 */
    @media screen and (max-width: 480px) {
      .ui.five.item.pointing.tabular.menu .item:not(:first-child) { display: none; }
    }
  </style>


  <script>
    var that = this

    toggleMenu() {
      $('.ui.five.item.pointing.tabular.menu .item:not(:first-child)').toggle()
      $('.five.wide.secondary.column').toggle('fast')
    }

    $(function(){
      /* Tab Menu */
      $('.tabular.menu .item').tab()
    })
  </script>
</menu>
