<footer>
  <div class="ui inverted attached footer center aligned very padded segment"  if={ footerVisible }>
    <h4>
      <a href="/">
        <img class="ui centered image" src="/img/logo_w.png">
      </a>
    </h4>
    <p>
      <small>Copyright © THE TOURNAMENT 2014-2018 All Rights Reserved.</small>
    </p>
    <sns-share type="circular"></sns-share>
    <br>
    <div class="ui horizontal inverted small link list">
      <a class="item" href="https://notsobad.jp/" target="_blank">運営</a>
      <a class="item" href="https://goo.gl/forms/xqvYet0AAsQUalI52" target="_blank">お問い合わせ</a>
      <a class="item" href="http://blog.the-tournament.jp/" target="_blank">公式ブログ</a>
      <a class="item" href="https://trello.com/b/G9vXQ1rT/" target="_blank">開発ロードマップ</a>
      <a class="item" href="https://tayori.com/faq/8ffbdba0a70dcacc24ed64550dfa39a4332ac44b" target="_blank">使い方ガイド</a>
      <a class="item" href="https://app.the-tournament.jp/pages/terms.html" target="_blank">利用規約</a>
      <a class="item" href="https://app.the-tournament.jp/pages/privacy.html" target="_blank">プライバシーポリシー</a>
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
