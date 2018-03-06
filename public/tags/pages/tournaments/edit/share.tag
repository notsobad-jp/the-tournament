<share>
  <div>
    <h5 class="ui small header">公開URL</h5>
    <div class="ui small basic message">
      <a href="https://the-tournament.jp/tournaments/{ parent.opts.id }" target="_blank">
        https://the-tournament.jp/tournaments/{ parent.opts.id }
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
    <sns-share tournament={ tournament } id={ id }></sns-share>

    <h5 class="ui small header">
      画像ダウンロード
    </h5>
    <div class="ui info message">
      <small>
        <i class="icon info circle"></i>
        画像ダウンロード機能は、トーナメント閲覧ページ（公開URL）に移動しました。
        閲覧ページで、トーナメント表右下にある「画像ダウンロード」ボタンをご利用ください。
      </small>
    </div>
    <br><br>
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
    that.tournament = that.parent.tournament
    that.id = that.parent.opts.id
    that.embedHeight = 1000 //クリックされてからbracketのサイズに合わせて修正
    that.shareURL = 'https://the-tournament.jp/tournaments/' + that.id
    that.shareText = that.tournament.title + 'のトーナメント表 - THE TOURNAMENT(ザ・トーナメント) 簡単・便利な無料トーナメント表作成ツール',


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
  </script>
</share>
