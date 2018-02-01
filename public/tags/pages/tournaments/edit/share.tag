<share>
  <div class="">
    <h5 class="ui small header">公開URL</h5>
    <div class="ui small basic message">
      <a href="https://tournament-7e3b7.firebaseapp.com/tournaments/{ parent.opts.id }" target="_blank">
        https://tournament-7e3b7.firebaseapp.com/tournaments/{ parent.opts.id }
      </a>
      <i class="icon external small"></i>
    </div>

    <h5 class="ui small header">
      埋め込みタグ
    </h5>
    <div class="ui small basic embedCode message" onclick={ calcEmbedSize }>
      { embedCode() }
    </div>

    <h5 class="ui small header">SNSシェア</h5>
    <div class="ui horizontal list">
      <div class="item">
        <a class="ui facebook small button" href="http://www.facebook.com/share.php?u={ shareURL }" onclick="window.open(this.href, 'FBwindow', 'width=650, height=450, menubar=no, toolbar=no, scrollbars=yes'); return false;">
          <i class="facebook icon"></i>
          Facebook
        </a>
      </div>
      <div class="item">
        <a class="ui twitter small button" href="http://twitter.com/share?url={ shareURL }&text={ shareText }" target="_blank">
          <i class="twitter icon"></i>
          Twitter
        </a>
      </div>
    </div>

    <h5 class="ui small header">
      画像ダウンロード
    </h5>
    <div class="ui icon primary button" onclick={ saveImage } if={ !downloading }>
      <i class="icon download"></i>
      画像をダウンロードする
    </div>
    <div class="ui icon basic disabled small button" if={ downloading }>
      <div class="ui active inline tiny loader"></div>
      　画像ダウンロードを準備しています...
    </div>
    <div class="ui warning small message">
      <small>
        <i class="icon warning circle"></i>
        FREEプランでは、一度ダウンロードすると画像が1週間キャッシュされて更新されません。
        トーナメント完了後に画像出力されることをオススメします。
        <a href="https://tayori.com/faq/8ffbdba0a70dcacc24ed64550dfa39a4332ac44b/detail/f36f4b40c50904c4eb085407817e5ca0386813a6" target="_blank">
          もっと詳しく
          <i class="icon external"></i>
        </a>
      </small>
    </div>
  </div>


  <style>
    .ui.basic.message {
      word-break: break-all;
      background: #fff;
      overflow-x: scroll;
    }
    .ui.basic.embedCode.message { white-space: nowrap; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    var xhr= new XMLHttpRequest();
    that.tournament = that.parent.tournament
    that.id = that.parent.opts.id
    that.embedHeight = 1000 //クリックされてからbracketのサイズに合わせて修正
    that.downloading = false
    that.shareURL = 'https://tournament-7e3b7.firebaseapp.com/tournaments/' + that.id
    that.shareText = that.tournament.title + 'のトーナメント表 - THE TOURNAMENT(ザ・トーナメント) 簡単・便利な無料トーナメント表作成ツール',


    /***********************************************
    * Observables
    ***********************************************/
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4) {
        let downloadURL = JSON.parse(xhr.response).image
        that.downloading = false
        if(downloadURL) {
          window.open(downloadURL)
        }else {
          obs.trigger("flashChanged", {type:'error',text:'画像の出力に失敗しました..(´；ω；｀) すみませんが運営までお問い合わせください。'})
        }
        that.update()
      }
    }


    /***********************************************
    * Functions
    ***********************************************/
    calcEmbedSize() {
      let bracket = document.getElementById('bracket')
      bracket.style.width = 'max-content'
      that.embedWidth = bracket.offsetWidth + 100
      that.embedHeight = bracket.offsetHeight + 300

      bracket.style.width = '100%'
      that.update()
    }

    embedCode() {
      return "<div style='position:relative!important;width:100%!important;max-width:100%!important;margin-bottom:20px!important;overflow:auto !important;-webkit-overflow-scrolling:touch !important;'><iframe src='https://app.the-tournament.jp/embed/v1/" + that.id + ".html?utm_campaign=embed&utm_medium="+ that.tournament.userId +"&utm_source="+ that.id +"' seamless frameborder='0' scrolling='no' width='100%' height='"+ that.embedHeight +"' style='width:1px;min-width:100%;'></iframe></div>"
    }

    saveImage() {
      that.downloading = true
      that.calcEmbedSize()

      let embedUrl = 'https://app.the-tournament.jp/embed/v1/'+ that.id +'.html'
      let restpackToken = 'vo2tH0AMCAibMz691DQBjSYafXqUsZsv08kUzfpm29Brh5Ik'
      let weekInMilliSeconds = 604800000
      let requestUrl = 'https://restpack.io/api/screenshot/v3/capture?url='+ embedUrl +'&access_token='+ restpackToken +'&json=true&width='+ that.embedWidth +'&height='+ that.embedHeight + '&ttl=' + weekInMilliSeconds

      xhr.open("GET", requestUrl)
      xhr.send()
    }
  </script>
</share>
