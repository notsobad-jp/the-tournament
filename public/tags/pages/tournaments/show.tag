<show>
  <div if={ tournament }>
    <breadcrumb breads={ breads }></breadcrumb>
    <br>

    <div class="ui stackable padded centered grid" if={ tournament }>
      <div class="ui eleven wide column">
        <div>
          <h1 class="ui large title header">
            { tournament.title }
            <a class="ui primary right floated button { (isMobile) ? 'tiny' : 'small' }" href="/tournaments/{ opts.id }/edit" if={ tournament.userId == user.uid }>
              <i class="icon setting"></i>
              編集
            </a>
          </h1>
          <div class="detail" data-is="raw" content={ tournament.detail }></div>
        </div>
        <br>

        <div class="ui fluid pink tabular menu { (isMobile) ? 'labeled icon mini three item' : '' }">
          <a class="item { active: tabSelected('bracket') }" onclick={ changeTab.bind(this, 'bracket') }>
            <i class="icon sitemap"></i>
            トーナメント表
          </a>
          <a class="item { active: tabSelected('results') }" onclick={ changeTab.bind(this, 'results') }>
            <i class="icon table"></i>
            対 戦 表
          </a>
          <a class="item { active: tabSelected('teams') }" onclick={ changeTab.bind(this, 'teams') }>
            <i class="icon users"></i>
            メンバー表
          </a>
        </div>
        <br>


          <div class="ui tab { active: tabSelected('bracket') }">
            <bracket editable={ false } tournament={ tournament }></bracket>
          </div>

          <div class="ui tab { active: tabSelected('results') }">
            <results tournament={ tournament } editable={ false }></results>
          </div>

          <div class="ui tab { active: tabSelected('teams') }">
            <div>
              <div class="ui segments">
                <div class="ui segment" each={ team, teamIndex in tournament.teams }>
                  <i class="flag { team.country }" if={ team.country }></i>
                  { team.name || '--' }
                  <span if={ team.group }>（{ team.group }）</span>
                  <a href={ team.url } target="_blank" if={ team.url && team.url != '' }>
                    <i class="icon external"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
      </div>

      <div class="ui four wide computer only column">
        <div class="ui half page test ad" data-text="広告枠"></div>
      </div>
      <div class="ui four wide mobile tablet only column">
        <div class="ui medium rectangle centered test ad" data-text="広告枠"></div>
      </div>
    </div>
    <br><br>
    <br><br>
  </div>


  <style>
    .grid { margin: 30px 0; }
    .title {
      padding: 7px 0;
      border-top: 4px solid #333;
      border-bottom: 4px solid #333;
      margin-bottom: 5px;
      word-break: break-all;
    }

    .detail {
      margin: 20px 0;
    }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.isMobile = window.innerWidth <= 480
    that.selectedTab = 'bracket'
    that.breads = [
      { title: 'すべてのトーナメント表一覧', url: '/tournaments' },
      { title: '' } //データ取得後にトーナメント名をセット
    ]


    /***********************************************
    * Observables
    ***********************************************/
    var authUnsubscribe = firebase.auth().onAuthStateChanged(function(user) {
      that.user = user
    })

    that.on('unmount', function(){
      authUnsubscribe()
    })

    // 画面リサイズ時にPC/SPメニュー切替
    window.addEventListener('resize', function(event){
      isMobile = window.innerWidth <= 480
      if(isMobile != that.isMobile) {
        that.isMobile = isMobile
        that.update()
      }
    })

    obs.trigger("dimmerChanged", 'active')
    var docRef = db.collection("tournaments").doc(opts.id)
    docRef.get().then(function(doc){
      if(doc.exists) {
        that.tournament = doc.data()
        that.breads[1].title = that.tournament.title  //パンくずにトーナメント名をセット
        that.update()
        obs.trigger("dimmerChanged", '')

        /* metatag setting */
        let meta = {
          title: that.tournament.title,
          description: that.tournament.detail || that.tournament.title + 'のトーナメント表',
          keyword: that.tournament.title
        }
        that.setMetatags(meta)
      }else {
        // alert('ごめんなさい、トーナメント表の取得に失敗しました…。URLを再度ご確認ください。')
        obs.trigger("dimmerChanged", '')
        route('/')
      }
    })


    /***********************************************
    * Functions
    ***********************************************/
    changeTab(tab) {
      if(that.selectedTab != tab) {
        that.selectedTab = tab
      }
    }

    tabSelected(tab) {
      return tab == that.selectedTab
    }
  </script>
</show>
