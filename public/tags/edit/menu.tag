<menu>
  <div class="ui fluid attached dark inverted labeled icon small pointing tabular item menu { vertical: !isMobile, five: isMobile }">
    <a class="item" onclick={ toggleMenuTab }>
      <i class="icon content { rotated: selectedTab }"></i>
    </a>
    <a class="item { active: tabSelected('settings') }" onclick={ changeMenuTab.bind(this, 'settings') }>
      <i class="setting icon"></i>
      <small>基本情報</small>
    </a>
    <a class="item { active: tabSelected('teams') }" onclick={ changeMenuTab.bind(this, 'teams') }>
      <i class="users icon"></i>
      <small>参加者</small>
    </a>
    <a class="item { active: tabSelected('results') }" onclick={ changeMenuTab.bind(this, 'results') }>
      <i class="table icon"></i>
      <small>試合結果</small>
    </a>
    <a class="item { active: tabSelected('share') }" onclick={ changeMenuTab.bind(this, 'share') }>
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

    .icon.content { transition: all 300ms 0s ease; }
  </style>


  <script>
    /***********************************************
    * Variables
    ***********************************************/
    var that = this
    that.isMobile = window.innerWidth <= 480
    that.selectedTab = (that.isMobile) ? null : 'settings'
    that.prevTab = 'settings' /* メニューtoggle時に、最後に表示してたtabに戻す用 */


    /***********************************************
    * Observables
    ***********************************************/
    // 画面リサイズ時にPC/SPメニュー切替
    window.addEventListener('resize', function(event){
      isMobile = window.innerWidth <= 480
      if(isMobile != that.isMobile) {
        that.isMobile = isMobile
        that.update()
      }
    })


    /***********************************************
    * Functions
    ***********************************************/
    changeMenuTab(tab) {
      /* 表示中のメニューを再度タップすると閉じる */
      if(that.selectedTab == tab) {
        that.toggleMenuTab()
      /* そうじゃないときはメニュー切替 */
      }else {
        that.selectedTab = tab
        obs.trigger("menuTabChanged", tab)
      }
    }

    tabSelected(tab) {
      return tab == that.selectedTab
    }

    toggleMenuTab() {
      /* 閉じるとき */
      if(that.selectedTab != null) {
        that.prevTab = that.selectedTab
        that.selectedTab = null
      /* 開くとき */
      }else {
        that.selectedTab = that.prevTab
      }
      obs.trigger("menuTabChanged", that.selectedTab)
    }
  </script>
</menu>
