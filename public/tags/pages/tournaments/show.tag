<show>
  <div class="ui stackable padded centered grid" if={ tournament }>
    <div class="ui eleven wide column">
      <div class="ui small breadcrumb">
        <a class="section" href="/">トップ</a>
        <i class="right chevron icon divider"></i>
        <a class="section" href="/search">すべてのトーナメント表</a>
        <i class="right chevron icon divider"></i>
        <div class="active section">{ tournament.title }</div>
      </div>
      <br><br>

      <div class="">
        <h1 class="ui large title header">
          { tournament.title }
          <a class="ui primary right floated button { (isMobile) ? 'tiny' : 'small' }" href="/tournaments/{ opts.id }/edit">
            <i class="icon setting"></i>
            編集
          </a>
        </h1>
        <div class="detail" ref="detail"></div>
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


  <style>
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

    .ui.breadcrumb {
      line-height: 1.3rem;
      word-break: break-all;
    }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    that.mixin('tournamentMixin')
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

        /* metatag setting */
        let meta = {
          title: that.tournament.title,
          description: that.tournament.detail || that.tournament.title + 'のトーナメント表',
          keyword: that.tournament.title
        }
        that.setMetatags(meta)

        // 改行反映
        var detail = ''
        if(that.tournament.detail && that.tournament.detail != '') {
          detail = that.escapeHTML(that.tournament.detail)
          detail = detail.replace(/\r?\n/g, '<br>')
          detail = that.autoLink(detail)
        }
        that.refs.detail.innerHTML = detail
      }else {
        // alert('ごめんなさい、トーナメント表の取得に失敗しました…。URLを再度ご確認ください。')
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

    escapeHTML(string) {
      if(typeof string !== 'string') {
        return string;
      }
      return string.replace(/[&'`"<>]/g, function(match) {
        return {
          '&': '&amp;',
          "'": '&#x27;',
          '`': '&#x60;',
          '"': '&quot;',
          '<': '&lt;',
          '>': '&gt;',
        }[match]
      });
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
</show>
