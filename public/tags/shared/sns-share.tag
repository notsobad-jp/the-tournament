<sns-share>
  <div class="ui horizontal list">
    <div class="item">
      <a class="ui facebook mini icon { opts.type } button" href="https://www.facebook.com/share.php?u={ shareURL }" onclick="window.open(this.href, 'FBwindow', 'width=650, height=450, menubar=no, toolbar=no, scrollbars=yes'); return false;">
        <i class="facebook f icon"></i>
      </a>
    </div>
    <div class="item">
      <a class="ui twitter mini icon { opts.type } button" href="https://twitter.com/share?url={ shareURL }&text={ shareText }" target="_blank">
        <i class="twitter icon"></i>
      </a>
    </div>
    <div class="item" if={ !opts.tournament }>
      <a class="ui mini icon green { opts.type } button" href="https://the-tournament.jp/feed">
        <i class="icon feed"></i>
      </a>
    </div>
  </div>


  <script>
    var that = this
    that.shareURL = 'https://the-tournament.jp/'
    if(opts.id) {
      that.shareURL += 'tournaments/' + opts.id
    }

    if(opts.tournament) {
      that.shareText = opts.tournament.title + 'のトーナメント表 - THE TOURNAMENT(ザ・トーナメント) 簡単・便利な無料トーナメント表作成ツール'
    }else {
      that.shareText = 'THE TOURNAMENT(ザ・トーナメント) - 簡単・便利な無料トーナメント表作成ツール'
    }
  </script>
</sns-share>
