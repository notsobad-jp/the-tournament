<footer>
  <div class="ui inverted attached footer center aligned very padded segment"  if={ footerVisible }>
    <h4>
      <a href="/">
        <img class="ui centered image" src="/img/logo_w.png">
      </a>
    </h4>
    <p>
      <small>Copyright © THE TOURNAMENT 2014-2017 All Rights Reserved.</small>
    </p>
    <div class="ui horizontal list">
      <div class="item">
        <iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fthe-tournament.jp%2F&width=89&layout=button&action=like&size=small&show_faces=false&share=false&height=21&appId=139414576217599" width="89" height="21" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
      </div>
      <div class="item">
        <a href="https://twitter.com/share" class="twitter-share-button" data-url="https://the-tournament.jp/" data-lang="ja" data-hashtags="the_tournament">ツイート</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      </div>
    </div>
    <br>
    <div class="ui horizontal inverted small link list">
      <a class="item" href="https://notsobad.jp/" target="_blank">運営</a>
      <a class="item" href="https://goo.gl/forms/xqvYet0AAsQUalI52" target="_blank">お問い合わせ</a>
      <a class="item" href="http://blog.notsobad.jp/" target="_blank">公式ブログ</a>
      <a class="item" href="https://trello.com/b/G9vXQ1rT/" target="_blank">開発ロードマップ</a>
      <a class="item" href="/terms" target="_blank">利用規約</a>
      <a class="item" href="/privary" target="_blank">プライバシーポリシー</a>
    </div>
  </div>


	<style>
		footer { overflow: hidden; }
    .ui.very.padded.segment {
      padding-left: 0;
      padding-right: 0;
    }

    h4 img { height: 20px; }
	</style>


  <script>
    var that = this
    that.footerVisible = true

    obs.on("footerVisibility", function(visibility) {
      that.footerVisible = visibility
      that.update()
    })
  </script>
</footer>
