<sns-share>
  <div class="ui horizontal list">
    <div class="item">
      <a class="ui facebook mini button" href="http://www.facebook.com/share.php?u={ shareURL }" onclick="window.open(this.href, 'FBwindow', 'width=650, height=450, menubar=no, toolbar=no, scrollbars=yes'); return false;">
        <i class="facebook icon"></i>
        Facebook
      </a>
    </div>
    <div class="item">
      <a class="ui twitter mini button" href="http://twitter.com/share?url={ shareURL }&text={ shareText }" target="_blank">
        <i class="twitter icon"></i>
        Twitter
      </a>
    </div>
  </div>


  <script>
    var that = this
    that.shareURL = 'https://tournament-7e3b7.firebaseapp.com/tournaments/' + opts.id
    that.shareText = opts.tournament.title + 'のトーナメント表 - THE TOURNAMENT(ザ・トーナメント) 簡単・便利な無料トーナメント表作成ツール'
  </script>
</sns-share>
