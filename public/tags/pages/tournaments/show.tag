<show>
  <div if={ tournament }>
    <breadcrumb breads={ breads }></breadcrumb>
    <br>

    <div class="ui stackable padded centered grid" if={ tournament }>
      <div class="ui eleven wide column">
        <div>
          <h1 class="ui large title header">
            { tournament.title }
          </h1>
          <div if={ tournament.userId == user.uid } class="edit-buttons">
            <a class="ui icon primary basic button" href="/tournaments/{ opts.id }/edit" data-tooltip="編集する" data-inverted="">
              <i class="icon setting"></i>
              編集
            </a>
            <div class="ui icon red basic button" data-tooltip="削除する" data-inverted="" onclick={ removeTournament }><i class="icon trash"></i></div>
          </div>
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


        <div id="bracketTab" class="ui tab { active: tabSelected('bracket') }">
          <bracket editable={ false } tournament={ tournament }></bracket>
          <div class="ui divider"></div>
          <sns-share tournament={ tournament } id={ opts.id }></sns-share>
          <a id="download-btn" href="#" target="_blank" download={ opts.id } class="ui icon primary basic tiny button" onclick={ imageDownload }>
            <i class="icon download"></i>
            画像ダウンロード
          </a>
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
    .detail { margin: 20px 0; }
    .edit-buttons { margin-top: 10px; }
    #download-btn { margin-left: 10px; }
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
      document.getElementById('amp-url').removeAttribute('href')
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
          keyword: that.tournament.title,
          ampURL: 'https://app.the-tournament.jp/embed/v1/' + opts.id + '.html'
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

    imageDownload(e) {
      // 2回目以降（hrefにセット済みなので通常のdownload処理のみ）
      let downloadButton = e.currentTarget
      if(downloadButton.getAttribute('href')!='#') { return true }

      // 初回（html2canvasで画像データ生成）
      e.preventDefault()
      downloadButton.classList.add('loading')

      let bracket = document.getElementById('bracket')
      bracket.style.paddingRight = '40px'
      bracket.style.paddingBottom = '10px'
      document.getElementById("bracketTab").style.width = 'max-content'

      html2canvas(document.querySelector("#bracket")).then(canvas => {
        downloadButton.setAttribute('href', canvas.toDataURL())
        downloadButton.click()
        downloadButton.classList.remove('loading')
        document.getElementById("bracketTab").style.width = '100%'
      })
    }

    removeTournament(e) {
      var ok = confirm('データを削除します。本当によろしいですか？')
      if(!ok) { return false }

      obs.trigger("dimmerChanged", 'active')
      db.collection("tournaments").doc(opts.id).delete().then(function() {
        obs.trigger("dimmerChanged", '')
        obs.trigger("flashChanged", {type:'success',text:'データを削除しました！'})
        route('/mypage')
      })
    }

    tabSelected(tab) {
      return tab == that.selectedTab
    }
  </script>
</show>
