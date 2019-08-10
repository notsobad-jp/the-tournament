<top>
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
      <br>
      <small>（ログインなしでも利用できます）</small>
    </div>
    <br><br>
  </div>


  <div class="ui stackable centered secondary basic segment grid">
    <div class="twelve wide computer only column">
      <div class="ui fluid five item secondary menu">
        <a href="#feature" class="ui item">
          <i class="icon options"></i>主な機能
        </a>
        <a href="#usecase" class="ui item">
          <i class="icon building outline"></i>ご利用実績
        </a>
        <a href="#price" class="ui item">
          <i class="icon dollar"></i>料金プラン
        </a>
        <a href="#faq" class="ui item">
          <i class="icon comments"></i>よくある質問
        </a>
        <a href="#contact" class="ui item">
          <i class="icon mail outline"></i>お問い合わせ
        </a>
      </div>
    </div>
    <div class="twelve wide mobile tablet only column">
      <div class="ui fluid five item secondary menu">
        <a href="#feature" class="ui item">機能</a>
        <a href="#usecase" class="ui item">実績</a>
        <a href="#price" class="ui item">料金</a>
        <a href="#faq" class="ui item">FAQ</a>
        <a href="#contact" class="ui item">お問合せ</a>
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
    <div class="four wide center aligned computer only column">
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
    <div class="four wide center aligned mobile tablet only column">
      <div class="ui small header">
        <i class="icon sitemap pink"></i>
        きれいで見やすいトーナメント表
      </div>
      <div class="ui small header">
        <i class="icon smile pink"></i>
        初めてでも簡単！直感的な操作方法
      </div>
      <div class="ui small header">
        <i class="icon code pink"></i>
        ブログやHPにも簡単に埋め込み可能！
      </div>
    </div>
    <div class="twelve wide center aligned column">
      <a class="ui icon button" href="/tournaments">
        <i class="icon search"></i>
        新着トーナメント一覧を見る
      </a>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>


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
            <img src="img/top/feature/double-mountain.png">
          </div>
          <div class="content">
            <div class="header">
              両山レイアウト
              <span class="ui orange mini label">PRO</span>
            </div>
            <div class="description">
              左右両サイドから勝ち上がり、中央に優勝者が来る両山レイアウトを選択できます。
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
              各選手ごとに顔写真を登録して表示することができます。
            </div>
          </div>
        </div>
      </div>
      <div class="ui three doubling cards">
        <div class="card">
          <div class="content">
            <div class="header">
              参加者シャッフル
            </div>
            <div class="description">
              何度でもランダムで参加者の配置をシャッフルできます。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">
              外部サイト埋め込み
            </div>
            <div class="description">
              コードをコピペするだけで、外部のブログやHPに埋め込めます。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">
              スコアなし（勝敗のみ記録）
            </div>
            <div class="description">
              トーナメント表からスコア表示をなくし、勝敗のみ記録することもできます。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">3位決定戦</div>
            <div class="description">
              3位決定戦の有無を簡単に切り替え可能です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">
              画像ダウンロード
            </div>
            <div class="description">
              トーナメント表を画像でダウンロードできます。SNSでのシェアに便利です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">参加者・スコアの表示幅調整</div>
            <div class="description">
              参加者名・スコアの表示幅を変更できます。長い名前のときでも安心です。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">
              API連携
              <span class="ui orange mini label">PRO</span>
            </div>
            <div class="description">
              API経由でトーナメントデータの取得・更新ができます。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">
              デザインカスタマイズ
              <span class="ui orange mini label">PRO</span>
            </div>
            <div class="description">
              トーナメント表のCSSをある程度カスタマイズすることができます。
            </div>
          </div>
        </div>
        <div class="card">
          <div class="content">
            <div class="header">
              非表示オプション
              <span class="ui orange mini label">PRO</span>
            </div>
            <div class="description">
              トーナメント表を一覧画面から非表示にし、詳細画面も作成者のみ閲覧できるようにできます。
            </div>
          </div>
        </div>
      </div>
      <div class="ui basic center aligned segment">
        もしほしい機能がない場合は、ぜひ匿名の新機能アンケートにご投票お願いします！要望が多いものは優先的に開発に取り組みます。
        <br><br>
        <a class="ui icon button" href="https://goo.gl/forms/cQ53xQ2tWKys0m0x1" target="_blank">
          <i class="tasks icon"></i>
          新機能アンケート
        </a>
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


  <div id="price" class="ui stackable centered grid">
    <div class="twelve wide column">
      <h3 class="ui horizontal divider header">
        <i class="icon dollar"></i>
        料金プラン
      </h3>
    </div>
    <div class="fourteen wide column">
      <div class="ui three stackable cards">
        <div class="ui card">
          <div class="ui secondary center aligned attached segment">
            <h5 class="ui small header">FREEプラン</h5>
          </div>
          <div class="content">
            <div class="description">
              <div class="ui huge center aligned red header">
                <img src="img/top/price/free.png" alt="FREEプラン">
                <br>
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
                参加者数：〜128名
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                通常サポート（チャット・メール）
              </div>
            </div>
          </div>
          <div class="ui bottom attached red button" onclick={ createAndRedirectToTournament }>
            <i class="add icon"></i>
            トーナメント表を作成する
          </div>
        </div>

        <div class="ui card">
          <div class="ui secondary center aligned attached segment">
            <h5 class="ui small header">STANDARDプラン</h5>
          </div>
          <div class="content">
            <div class="description">
              <div class="ui huge center aligned red header">
                <img src="img/top/price/standard.png" alt="STANDARDプラン">
                <br>
                5,000円/<small>大会</small>
                <div class="sub header">お手軽価格で大規模大会にも対応！</div>
              </div>
              <div class="ui divider"></div>
              <div class="ui small header">
                <i class="icon green check"></i>
                すべての基本機能
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                参加者数：〜1,024名
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                全力サポート（電話・チャット・メール）
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                広告非表示
              </div>
            </div>
          </div>
          <div class="ui bottom attached basic segment">
            <p>トーナメントを複数作成したい場合の割引も可能です。お気軽にご相談ください。</p>
          </div>
          <a class="ui bottom attached primary button" href="https://goo.gl/forms/xqvYet0AAsQUalI52" target="_blank">
            <i class="icon mail"></i>
            お問い合わせ
          </a>
        </div>

        <div class="ui card">
          <div class="ui secondary center aligned attached segment">
            <h5 class="ui small header">PROプラン</h5>
          </div>
          <div class="content">
            <div class="description">
              <div class="ui huge center aligned red header">
                <img src="img/top/price/pro.png" alt="PROプラン">
                <br>
                個別見積り
                <div class="sub header">カスタム開発で（ほぼ）何でも対応！</div>
              </div>
              <div class="ui divider"></div>
              <div class="ui small header">
                <i class="icon green check"></i>
                すべての基本機能
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                参加者数：1,024名〜
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
                選手の顔写真表示
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                自社システム連携・OEM提供
              </div>
              <div class="ui small header">
                <i class="icon green check"></i>
                大会現地サポート
              </div>
            </div>
          </div>
          <div class="ui bottom attached basic segment">
            <p>その他、大抵のことは対応可能です。お気軽にご相談ください。</p>
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


  <div id="corporate" class="ui stackable centered grid">
    <div class="twelve wide column">
      <h3 class="ui horizontal divider header">
        <i class="icon medkit"></i>
        法人サポート
      </h3>
      <div class="ui basic center aligned segment">
        <p>法人のご利用向けに、各種サポートを無料で提供しております。お気軽にお問い合わせください。</p>
        <div class="ui hidden divider"></div>
        <div class="ui three column stackable grid">
          <div class="ui column">
            <h5 class="ui medium icon header">
              <i class="icon circular book"></i>
              操作マニュアル配布
              <span class="ui yellow mini label">無料</span>
            </h5>
            <p>
              THE TOURNAMENTの操作方法をまとめたマニュアル資料をPDFでご提供いたします。
              大会運営時、印刷してスタッフに配布するなどでご活用ください。
            </p>
          </div>
          <div class="ui column">
            <h5 class="ui medium icon header">
              <i class="icon circular users"></i>
              導入相談
              <span class="ui yellow mini label">無料</span>
            </h5>
            <p>
              都内であれば代表が直接お伺いして、導入にあたっての疑問点や仕様の確認などにお答えいたします。
              遠方の場合、電話やSkypeなどによるお打ち合わせも可能です。
            </p>
          </div>
          <div class="ui column">
            <h5 class="ui medium icon header">
              <i class="icon circular trophy"></i>
              トーナメント作成代行
              <span class="ui yellow mini label">無料</span>
            </h5>
            <p>
              うまくトーナメント表が作れない場合、エクセルなどで完成形をご共有いただければこちらで作成代行いたします。
              代行完了後に操作方法などもご共有いたします。
            </p>
          </div>
        </div>
      </div>
      <div class="ui basic center aligned segment">
        <a class="ui primary button" href="https://goo.gl/forms/xqvYet0AAsQUalI52" target="_blank">
          お問い合わせフォームはこちら
        </a>
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
                ログインせずに、ゲストユーザーとして利用することも可能です。ゲストでもFREEプランのすべての機能を利用できます。
                ただしゲストユーザーで作成したトーナメントは、セッションが切れると編集できなくなってしまいます（トーナメント表が見られなくなるわけではありません）。
                ずっと管理したい場合は、ログインしてください。
              </p>
            </div>
          </div>
        </div>
        <div class="ui hidden divider"></div>
        <div class="item">
          <div class="content">
            <div class="header">ゲストで作成したトーナメント表を、ログインしてアカウントに引き継ぎたい</div>
            <div class="description">
              <p>
                ゲストユーザーで作成したトーナメント表は、アカウントを登録（初ログイン）した際に、自動的にそのアカウントに引き継がれます。
                ただし、<span class="ui small red header">すでに登録済みのアカウントに、ゲストユーザーからデータを引き継ぐことはできません</span>。
                もし間違えてゲストで作成したデータを引き継ぎたい場合は、運営までお問い合わせください。
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="ui hidden divider"></div>
  <br><br>


  <div id="system" class="ui basic segment">
    <div class="ui stackable centered grid">
      <div class="twelve wide column">
        <h3 class="ui horizontal divider header">
          <i class="desktop icon"></i>
          動作環境
        </h3>
        <div class="ui basic center aligned segment">
          <div>
            以下ブラウザの最新版をサポートしています。
            <br>
            <small>（これ以外の環境でも動作する可能性はありますが、公式に保証するものではありません）</small>
          </div>
          <div class="ui horizontal huge list">
            <div class="item">
              <i class="icon chrome"></i>
              Chrome
            </div>
            <div class="item">
              <i class="icon firefox"></i>
              Firefox
            </div>
            <div class="item">
              <i class="icon safari"></i>
              Safari
            </div>
            <div class="item">
              <i class="icon edge"></i>
              Edge
            </div>
          </div>
          <br><br>
          <small>
            ※Internet Explorerは残念ながらサポート対象外です。。
          </small>
        </div>
      </div>
    </div>
  </div>
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

    .ui.bottom.attached.basic.segment {
      margin-bottom: 0;
      border-radius: 0;
    }

    .ui.three.stackable.cards .card { margin-bottom: 30px; }
  </style>


  <script>
    /***********************************************
    * Settings
    ***********************************************/
    var that = this
    var sampleData = {"consolationRound":false,"createdAt":"2018-01-26T10:50:51.425Z","detail":null,"nameWidth":100,"results":{"0":[{"bye":false,"comment":"第1試合：1-2\n第2試合：2-4","score":{"0":"3","1":"6"},"winner":1},{"bye":false,"comment":"第1試合：1-0\n第2試合：1-1","score":{"0":"2","1":"1"},"winner":0},{"bye":false,"comment":"第1試合：2-3\n第2試合：1-3","score":{"0":"3","1":"6"},"winner":1},{"bye":false,"comment":"第1試合：3-0\n第2試合：0-0","score":{"0":"3","1":"0"},"winner":0}],"1":[{"bye":false,"comment":"第1試合：3-0\n第2試合：1-2","score":{"0":"4","1":"2"},"winner":0},{"bye":false,"comment":"第1試合：0-2\n第2試合：1-2","score":{"0":"1","1":"4"},"winner":1}],"2":[{"bye":false,"comment":null,"score":{"0":"4","1":"1"},"winner":0},{"comment":null,"score":{"0":null,"1":null},"winner":null}]},"scoreWidth":40,"teams":[{"country":"de","name":"Bミュンヘン"},{"country":"es","name":"Rマドリード"},{"country":"es","name":"Aマドリード"},{"country":"gb","name":"レスター"},{"country":"de","name":"ドルトムント"},{"country":"fr","name":"モナコ"},{"country":"it","name":"ユベントス"},{"country":"es","name":"バルセロナ"}],"title":"UEFAチャンピオンズリーグ2016/2017","updatedAt":"2018-02-01T09:10:26.748Z","userId":"5bbqXPvhrteZkxb9ogvsSrcBg6S2"}

    that.tournament = sampleData
    that.update()


    /***********************************************
    * Functions
    ***********************************************/
    /* トーナメントのIDだけ取得して新規作成画面に遷移 */
    createAndRedirectToTournament() {
      let newTnmtRef = db.collection("tournaments").doc()
      route('tournaments/' + newTnmtRef.id + '/edit')
    }
  </script>
</top>
