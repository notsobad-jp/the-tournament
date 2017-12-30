<show-tournament>
  <div class="ui stackable padded grid" if={ tournament }>
    <div class="ui sixteen wide dark column">
      <div class="ui basic dark inverted segment">
        <h1 class="ui huge header">{ tournament.title }</h1>
        <div class="ui hidden divider"></div>
        <div ref="detail"></div>
      </div>
    </div>
    <div class="ui sixteen wide secondary column">
      <a class="ui right floated primary small button" href="/tournaments/{ opts.id }/edit">
        <i class="icon setting"></i>
        編集
      </a>
    </div>

    <div class="ui three wide column">
      <div class="ui secondary fluid pink mini menu { (isMobile) ? 'pointing three item labeled icon tabular' : 'vertical' }">
        <a class="item { active: tabSelected('bracket') }" onclick={ changeTab.bind(this, 'bracket') }>
          <i class="icon sitemap"></i>
          トーナメント表
        </a>
        <a class="item { active: tabSelected('results') }" onclick={ changeTab.bind(this, 'results') }>
          <i class="icon table"></i>
          対戦表
        </a>
        <a class="item { active: tabSelected('teams') }" onclick={ changeTab.bind(this, 'teams') }>
          <i class="icon users"></i>
          メンバー表
        </a>
      </div>
    </div>


    <div class="ui thirteen wide column">
      <div class="ui tab { active: tabSelected('bracket') }" data-tab="bracket">
        <bracket editable={ false } tournament={ tournament }></bracket>
      </div>

      <div class="ui tab ten wide { active: tabSelected('results') }" data-tab="results">
        <results tournament={ tournament } editable={ false }></results>
      </div>

      <div class="ui tab ten wide { active: tabSelected('teams') }" data-tab="teams">
        <div>
          <div class="ui segments">
            <div class="ui segment" each={ team, teamIndex in tournament.teams }>
              { team['name'] }
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <br><br>
  <br><br>


  <style>
    .ui.dark.column, .ui.dark.inverted.segment { background-color: #2D3E4F !important; }
    .ui.secondary.column {
      background-color: #F3F4F5 !important;
      padding: 7px 10px;
    }
    .ui.pink.secondary.vertical.menu .active.item {
      background-color: #E03997!important;
      color: #fff !important;
    }

    /* PC　*/
    @media screen and (min-width: 480px) {
      .ten.wide.tab { max-width: 62.5% !important; }
      .ui.stackable.grid > .ui.dark.column {
         padding-top: 2rem !important;
         padding-bottom: 2rem !important;
       }
    }
  </style>


  <script>
    /***********************************************
    * Variables
    ***********************************************/
    var that = this
    that.isMobile = window.innerWidth <= 480
    that.selectedTab = 'bracket'


    /***********************************************
    * Observables
    ***********************************************/
    firebase.auth().onAuthStateChanged(function(user) {
      that.user = user
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
        that.update()
        obs.trigger("dimmerChanged", '')

        // 改行反映
        var detail = ''
        if(that.tournament.detail && that.tournament.detail != '') {
          detail = that.tournament.detail.replace(/\r?\n/g, '<br>')
          detail = that.autoLink(detail)
        }
        that.refs.detail.innerHTML = detail
      }else {
        alert('ごめんなさい、トーナメント表の取得に失敗しました…。URLを再度ご確認ください。')
        obs.trigger("dimmerChanged", '')
        route('/')
      }
    })


    /***********************************************
    * Functions
    ***********************************************/
    autoLink(str) {
      var regexp_url = /((h?)(ttps?:\/\/[a-zA-Z0-9.\-_@:/~?%&;=+#',()*!]+))/g; // ']))/;
      var regexp_makeLink = function(all, url, h, href) {
        return '<a href="h' + href + '" target="_blank">' + url + '</a>';
      }
      return str.replace(regexp_url, regexp_makeLink);
    }

    changeTab(tab) {
      if(that.selectedTab != tab) {
        that.selectedTab = tab
      }
    }

    tabSelected(tab) {
      return tab == that.selectedTab
    }
  </script>
</show-tournament>
