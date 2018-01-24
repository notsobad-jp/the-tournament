<about>
  <div id="top" class="ui inverted attached center aligned basic segment">
    <br><br>
    <h1 class="ui huge inverted header">
      <img src="img/top/logo.png" alt="THE TOURNAMENT" class="ui large image">
    </h1>
    <br>
    <div class="sub header">
      圧倒的に使いやすい！無料トーナメント表作成ツールの決定版！
    </div>
    <br><br>
    <div>
      <button class="ui right labeled icon red large button" onclick={ createAndRedirectToTournament }>
        <i class="chevron right icon"></i>
        トーナメント表を作成する
      </button>
    </div>
    <br><br>
  </div>


  <div class="ui stackable centered secondary basic segment grid">
    <div class="twelve wide computer only column">
      <div class="ui fluid five item secondary menu">
        <a href="#feature" class="ui item">
          <i class="icon options"></i>機能
        </a>
        <a href="#price" class="ui item">
          <i class="icon dollar"></i>料金表
        </a>
        <a href="#usecase" class="ui item">
          <i class="icon building outline"></i>利用実績
        </a>
        <a href="#faq" class="ui item">
          <i class="icon comments"></i>FAQ
        </a>
        <a href="#contact" class="ui item">
          <i class="icon mail outline"></i>お問合せ
        </a>
      </div>
    </div>
    <div class="twelve wide mobile tablet only column">
      <div class="ui fluid five item secondary menu">
        <a href="#feature" class="ui item">
          機能
        </a>
        <a href="#price" class="ui item">
          料金表
        </a>
        <a href="#usecase" class="ui item">
          利用実績
        </a>
        <a href="#faq" class="ui item">
          FAQ
        </a>
        <a href="#contact" class="ui item">
          お問合せ
        </a>
      </div>
    </div>
  </div>


  <div class="ui stackable centered grid">
    <br><br>
    <div class="twelve wide column">
      <div class="ui basic center aligned segment">
        <p>
          THE TOURNAMENT（ザ・トーナメント）は、シンプルな操作で直感的に使える、トーナメント表作成サービスの決定版です。
          <br>
          基本機能はすべて、いつまでも無料で利用することができます。
        </p>
      </div>
    </div>
    <div class="ui eight wide column">
      <bracket editable={ false } tournament={ tournament } if={ tournament }></bracket>
      <small>※タップすると試合詳細を表示します。</small>
    </div>
    <div class="four wide center aligned column">
      <div class="ui small icon header">
        <i class="icon sitemap pink"></i>
        きれいで見やすいトーナメント表
      </div>
      <div class="ui small icon header">
        <i class="icon smile pink"></i>
        初めてでも簡単！直感的な操作方法
      </div>
      <div class="ui small icon header">
        <i class="icon code pink"></i>
        ブログやHPにも簡単に埋め込み可能！
      </div>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>


  <!--
  <div class="ui stackable centered grid">
    <div class="twelve wide column">
      <h3 class="ui horizontal divider header">
        <i class="icon feed"></i>
        新着トーナメント表
      </h3>
      <div class="ui basic center aligned segment">
        ほげほげ
      </div>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>
  -->


  <div id="feature" class="ui stackable centered grid">
    <div class="twelve wide column">
      <h3 class="ui horizontal divider header">
        <i class="icon options"></i>
        主な機能
      </h3>
      <div class="ui basic center aligned segment">
        THE TOURNAMENTは現在も活発に機能追加を続けています。
        今後の開発予定は「<a href="https://trello.com/b/G9vXQ1rT" target="_blank">開発ロードマップ</a>」で確認可能です。
      </div>
      <div class="ui three doubling cards">
        <div class="card">
          <div class="image">
            <img src="img/top/feature/third-place.png">
          </div>
          <div class="content">
            <div class="header">3位決定戦</div>
            <div class="description">
              3位決定戦の有無を簡単に切り替え可能です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/multi-seed.png">
          </div>
          <div class="content">
            <div class="header">自由なシード設定</div>
            <div class="description">
              3回戦以降からの参加選手がいる複雑なシードも、直感的に設定可能です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/country-flag.png">
          </div>
          <div class="content">
            <div class="header">国旗表示</div>
            <div class="description">
              参加者名に国旗を表示できます。国際大会などで便利です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/match-comment.png">
          </div>
          <div class="content">
            <div class="header">試合詳細コメント</div>
            <div class="description">
              各試合ごとにコメントを登録できます。URLを登録することも可能です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/text-score.png">
          </div>
          <div class="content">
            <div class="header">文字でのスコア登録</div>
            <div class="description">
              スコアは数字だけでなく、「一本」などの文字でも登録可能です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/profile-image.png">
          </div>
          <div class="content">
            <div class="header">
              選手の顔写真表示
              <span class="ui orange mini label">PRO</span>
            </div>
            <div class="description">
              各選手ごとに顔写真を登録して表示することができます。※PROプランのみ
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/image-download.jpg">
          </div>
          <div class="content">
            <div class="header">
              画像ダウンロード
              <span class="ui mini label">開発中…</span>
            </div>
            <div class="description">
              トーナメント表を画像でダウンロードできます。SNSでのシェアに便利です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/double-mountain.png">
          </div>
          <div class="content">
            <div class="header">
              両山レイアウト
              <span class="ui orange mini label">PRO</span>
              <span class="ui mini label">開発中…</span>
            </div>
            <div class="description">
              左右両サイドから勝ち上がり、中央に優勝者が来る両山レイアウトを選択できます。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="image">
            <img src="img/top/feature/long-name.png">
          </div>
          <div class="content">
            <div class="header">参加者・スコアの表示幅調整</div>
            <div class="description">
              参加者名・スコアの表示幅を変更できます。長い名前のときでも安心です。
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>


  <div id="price" class="ui stackable centered grid">
    <div class="twelve wide column">
      <h3 class="ui horizontal divider header">
        <i class="icon dollar"></i>
        料金プラン
      </h3>
    </div>
    <div class="twelve wide column">
      <div class="ui two stackable cards">
        <div class="ui card">
          <div class="ui secondary center aligned attached segment">
            <h5 class="ui small header">FREEプラン</h5>
          </div>
          <div class="content">
            <div class="description">
              <div class="ui huge center aligned red header">
                無料
                <div class="sub header">基本機能はうれしいずっと無料！</div>
              </div>
              <div class="ui divider"></div>
              <div class="ui small header">
                <i class="icon green check"></i>
                すべての基本機能
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                大会参加者：〜128名
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                通常サポート（チャット・メール）
              </div>
              <div class="ui small header"></div>
              <div class="ui small header"></div>
              <div class="ui small header"></div>
              <div class="ui small header"></div>
              <div class="ui small header"></div>
              <div class="ui small header"></div>
            </div>
          </div>
          <div class="ui bottom attached red button" onclick={ createAndRedirectToTournament }>
            <i class="add icon"></i>
            トーナメント表を作成する
          </div>
        </div>

        <div class="ui card">
          <div class="ui secondary center aligned attached segment">
            <h5 class="ui small header">PROプラン</h5>
          </div>
          <div class="content">
            <div class="description">
              <div class="ui huge center aligned red header">
                個別見積り
                <div class="sub header">カスタム開発で（ほぼ）あらゆる要望に応えます！</div>
              </div>
              <div class="ui divider"></div>
              <div class="ui small header">
                <i class="icon green check"></i>
                すべての基本機能
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                大会参加者：128名以上も可能です
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                全力サポート（電話・チャット・メール）
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                特殊なトーナメント形式
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                広告非表示
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                両山スタイル
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                選手の顔写真表示
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                自社システム連携
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                大会現地サポート
              </div>
              <div class="ui divider"></div>
              <p>その他、大抵のことは対応可能です。お気軽にご相談ください。</p>
            </div>
          </div>
          <a class="ui bottom attached primary button" href="https://goo.gl/forms/xqvYet0AAsQUalI52" target="_blank">
            <i class="icon mail"></i>
            お問い合わせ
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>


  <div id="usecase" class="ui stackable centered grid">
    <div class="twelve wide column">
      <h3 class="ui horizontal divider header">
        <i class="icon building outline"></i>
        ご利用実績
      </h3>
      <div class="ui basic center aligned segment">
        各種スポーツの全日本連盟や、TV・新聞などの大手メディア他、多数の法人にご利用いただいています。
        <br>
        詳しい利用実績をご希望の方はお問い合わせください。
      </div>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>


  <div id="faq" class="ui stackable centered grid">
    <div class="twelve wide column">
      <h3 class="ui horizontal divider header">
        <i class="icon comments"></i>
        よくある質問
      </h3>
      <br>
      <div class="ui relaxed items">
        <div class="item">
          <div class="content">
            <div class="header">サービスの利用にログインは必要ですか？</div>
            <div class="description">
              <p>
                ログインせずに、ゲストユーザーとして利用することも可能です。ゲストユーザーでもFREEプランのすべての機能を利用できます。
                ただしゲストユーザーで作成したトーナメントは、セッションが切れると編集できなくなってしまいます（トーナメント表が見れなくなるわけではありません）。
                ずっと管理したい場合は、ログインしてください。
              </p>
            </div>
          </div>
        </div>
        <div class="ui hidden divider"></div>
        <div class="item">
          <div class="content">
            <div class="header">ゲストで作成したトーナメント表が、ログインしても引き継がれないのですが</div>
            <div class="description">
              <p>
                ゲストユーザーで作成したトーナメント表は、ログインした時点で自動的にログイン後のアカウントに引き継がれます。
                ただし引き継ぎ処理の完了までに数分程度かかりますので、ログイン後すぐはマイページにトーナメント表が表示されません。
                しばらくしてからページを再読み込みしてみてください。
              </p>
            </div>
          </div>
        </div>
        <div class="ui hidden divider"></div>
        <div class="item">
          <div class="content">
            <div class="header">どうしても思い通りにトーナメント表が作れません。。</div>
            <div class="description">
              <p>
                人生なかなかうまくいかないときもあるものです。
                もしどうしてもうまくトーナメント表が作れない場合、
                <span class="ui small red header">運営にご連絡いただければこちらで作成代行いたします（無料）</span>。
                お気軽にお問い合わせください。
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>


  <div id="contact" class="ui basic segment">
    <div class="ui stackable centered grid">
      <div class="twelve wide column">
        <h3 class="ui horizontal divider header">
          <i class="mail outline icon"></i>
          お問い合わせ
        </h3>
        <div class="ui basic center aligned segment">
          <p>
            メール：info@notsobad.jp
          </p>
          <a class="ui primary button" href="https://goo.gl/forms/xqvYet0AAsQUalI52" target="_blank">
            お問い合わせフォームはこちら
          </a>
        </div>
      </div>
    </div>
  </div>
  <br><br>


  <style>
    #top { background:#2D3E4F; }
    h1 img { max-width: 90% !important; }
    .ui.secondary.basic.segment.grid { margin: 0; }
    .ui.secondary.basic.segment.grid .column { padding: 0.5rem !important; }
    .ui.secondary.basic.segment.grid .ui.item { font-weight: bold; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    var id = "KsJAc45wdlhGyPtLka9H"
    var docRef = db.collection("tournaments").doc(id)
    docRef.get().then(function(doc){
      if(doc.exists) {
        that.tournament = doc.data()
        that.update()
      }
    })



    /***********************************************
    * Functions
    ***********************************************/
    /* トーナメントのIDだけ取得して新規作成画面に遷移 */
    createAndRedirectToTournament() {
      let newTnmtRef = db.collection("tournaments").doc()
      route('tournaments/' + newTnmtRef.id + '/edit')
    }
  </script>
</about>
