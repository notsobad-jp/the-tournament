<country-select>
  <div class="ui page active dimmer" if={ visibility } onclick={ hideModal }></div>
  <div class="ui active modal" if={ visibility }>
    <span class="close icon" onclick={ hideModal } ></span>
    <div class="header">
      国の選択
    </div>
    <div class="content">
      <div class="ui grid">
        <div class="ui doubling six column row f16">
          <div class='column' data-country='is' onclick={ updateCountry }><span class='flag is'></span>アイスランド</div>
          <div class='column' data-country='ie' onclick={ updateCountry }><span class='flag ie'></span>アイルランド</div>
          <div class='column' data-country='az' onclick={ updateCountry }><span class='flag az'></span>アゼルバイジャン</div>
          <div class='column' data-country='af' onclick={ updateCountry }><span class='flag af'></span>アフガニスタン</div>
          <div class='column' data-country='us' onclick={ updateCountry }><span class='flag us'></span>アメリカ合衆国</div>
          <div class='column' data-country='vi' onclick={ updateCountry }><span class='flag vi'></span>アメリカ領ヴァージン諸島</div>
          <div class='column' data-country='as' onclick={ updateCountry }><span class='flag as'></span>アメリカ領サモア</div>
          <div class='column' data-country='ae' onclick={ updateCountry }><span class='flag ae'></span>アラブ首長国連邦</div>
          <div class='column' data-country='dz' onclick={ updateCountry }><span class='flag dz'></span>アルジェリア</div>
          <div class='column' data-country='ar' onclick={ updateCountry }><span class='flag ar'></span>アルゼンチン</div>
          <div class='column' data-country='aw' onclick={ updateCountry }><span class='flag aw'></span>アルバ</div>
          <div class='column' data-country='al' onclick={ updateCountry }><span class='flag al'></span>アルバニア</div>
          <div class='column' data-country='am' onclick={ updateCountry }><span class='flag am'></span>アルメニア</div>
          <div class='column' data-country='ai' onclick={ updateCountry }><span class='flag ai'></span>アンギラ</div>
          <div class='column' data-country='ao' onclick={ updateCountry }><span class='flag ao'></span>アンゴラ</div>
          <div class='column' data-country='ag' onclick={ updateCountry }><span class='flag ag'></span>アンティグア・バーブーダ</div>
          <div class='column' data-country='ad' onclick={ updateCountry }><span class='flag ad'></span>アンドラ</div>
          <div class='column' data-country='ye' onclick={ updateCountry }><span class='flag ye'></span>イエメン</div>
          <div class='column' data-country='gb' onclick={ updateCountry }><span class='flag gb'></span>イギリス</div>
          <div class='column' data-country='io' onclick={ updateCountry }><span class='flag io'></span>イギリス領インド洋地域</div>
          <div class='column' data-country='vg' onclick={ updateCountry }><span class='flag vg'></span>イギリス領ヴァージン諸島</div>
          <div class='column' data-country='il' onclick={ updateCountry }><span class='flag il'></span>イスラエル</div>
          <div class='column' data-country='it' onclick={ updateCountry }><span class='flag it'></span>イタリア</div>
          <div class='column' data-country='iq' onclick={ updateCountry }><span class='flag iq'></span>イラク</div>
          <div class='column' data-country='ir' onclick={ updateCountry }><span class='flag ir'></span>イラン・イスラム共和国</div>
          <div class='column' data-country='in' onclick={ updateCountry }><span class='flag in'></span>インド</div>
          <div class='column' data-country='id' onclick={ updateCountry }><span class='flag id'></span>インドネシア</div>
          <div class='column' data-country='wf' onclick={ updateCountry }><span class='flag wf'></span>ウォリス・フツナ</div>
          <div class='column' data-country='ug' onclick={ updateCountry }><span class='flag ug'></span>ウガンダ</div>
          <div class='column' data-country='ua' onclick={ updateCountry }><span class='flag ua'></span>ウクライナ</div>
          <div class='column' data-country='uz' onclick={ updateCountry }><span class='flag uz'></span>ウズベキスタン</div>
          <div class='column' data-country='uy' onclick={ updateCountry }><span class='flag uy'></span>ウルグアイ</div>
          <div class='column' data-country='ec' onclick={ updateCountry }><span class='flag ec'></span>エクアドル</div>
          <div class='column' data-country='eg' onclick={ updateCountry }><span class='flag eg'></span>エジプト</div>
          <div class='column' data-country='ee' onclick={ updateCountry }><span class='flag ee'></span>エストニア</div>
          <div class='column' data-country='et' onclick={ updateCountry }><span class='flag et'></span>エチオピア</div>
          <div class='column' data-country='er' onclick={ updateCountry }><span class='flag er'></span>エリトリア</div>
          <div class='column' data-country='sv' onclick={ updateCountry }><span class='flag sv'></span>エルサルバドル</div>
          <div class='column' data-country='au' onclick={ updateCountry }><span class='flag au'></span>オーストラリア</div>
          <div class='column' data-country='at' onclick={ updateCountry }><span class='flag at'></span>オーストリア</div>
          <div class='column' data-country='ax' onclick={ updateCountry }><span class='flag ax'></span>オーランド諸島</div>
          <div class='column' data-country='om' onclick={ updateCountry }><span class='flag om'></span>オマーン</div>
          <div class='column' data-country='nl' onclick={ updateCountry }><span class='flag nl'></span>オランダ</div>

          <div class='column' data-country='gh' onclick={ updateCountry }><span class='flag gh'></span>ガーナ</div>
          <div class='column' data-country='cv' onclick={ updateCountry }><span class='flag cv'></span>カーボベルデ</div>
          <div class='column' data-country='gg' onclick={ updateCountry }><span class='flag gg'></span>ガーンジー</div>
          <div class='column' data-country='gy' onclick={ updateCountry }><span class='flag gy'></span>ガイアナ</div>
          <div class='column' data-country='kz' onclick={ updateCountry }><span class='flag kz'></span>カザフスタン</div>
          <div class='column' data-country='qa' onclick={ updateCountry }><span class='flag qa'></span>カタール</div>
          <div class='column' data-country='um' onclick={ updateCountry }><span class='flag um'></span>合衆国領有小離島</div>
          <div class='column' data-country='ca' onclick={ updateCountry }><span class='flag ca'></span>カナダ</div>
          <div class='column' data-country='ga' onclick={ updateCountry }><span class='flag ga'></span>ガボン</div>
          <div class='column' data-country='cm' onclick={ updateCountry }><span class='flag cm'></span>カメルーン</div>
          <div class='column' data-country='gm' onclick={ updateCountry }><span class='flag gm'></span>ガンビア</div>
          <div class='column' data-country='kh' onclick={ updateCountry }><span class='flag kh'></span>カンボジア</div>
          <div class='column' data-country='mp' onclick={ updateCountry }><span class='flag mp'></span>北マリアナ諸島</div>
          <div class='column' data-country='gn' onclick={ updateCountry }><span class='flag gn'></span>ギニア</div>
          <div class='column' data-country='gw' onclick={ updateCountry }><span class='flag gw'></span>ギニアビサウ</div>
          <div class='column' data-country='cy' onclick={ updateCountry }><span class='flag cy'></span>キプロス</div>
          <div class='column' data-country='cu' onclick={ updateCountry }><span class='flag cu'></span>キューバ</div>
          <div class='column' data-country='cw' onclick={ updateCountry }><span class='flag cw'></span>キュラソー</div>
          <div class='column' data-country='gr' onclick={ updateCountry }><span class='flag gr'></span>ギリシャ</div>
          <div class='column' data-country='ki' onclick={ updateCountry }><span class='flag ki'></span>キリバス</div>
          <div class='column' data-country='kg' onclick={ updateCountry }><span class='flag kg'></span>キルギス</div>
          <div class='column' data-country='gt' onclick={ updateCountry }><span class='flag gt'></span>グアテマラ</div>
          <div class='column' data-country='gp' onclick={ updateCountry }><span class='flag gp'></span>グアドループ</div>
          <div class='column' data-country='gu' onclick={ updateCountry }><span class='flag gu'></span>グアム</div>
          <div class='column' data-country='kw' onclick={ updateCountry }><span class='flag kw'></span>クウェート</div>
          <div class='column' data-country='ck' onclick={ updateCountry }><span class='flag ck'></span>クック諸島</div>
          <div class='column' data-country='gl' onclick={ updateCountry }><span class='flag gl'></span>グリーンランド</div>
          <div class='column' data-country='cx' onclick={ updateCountry }><span class='flag cx'></span>クリスマス島</div>
          <div class='column' data-country='gd' onclick={ updateCountry }><span class='flag gd'></span>グレナダ</div>
          <div class='column' data-country='hr' onclick={ updateCountry }><span class='flag hr'></span>クロアチア</div>
          <div class='column' data-country='ky' onclick={ updateCountry }><span class='flag ky'></span>ケイマン諸島</div>
          <div class='column' data-country='ke' onclick={ updateCountry }><span class='flag ke'></span>ケニア</div>
          <div class='column' data-country='ci' onclick={ updateCountry }><span class='flag ci'></span>コートジボワール</div>
          <div class='column' data-country='cc' onclick={ updateCountry }><span class='flag cc'></span>ココス（キーリング）諸島</div>
          <div class='column' data-country='cr' onclick={ updateCountry }><span class='flag cr'></span>コスタリカ</div>
          <div class='column' data-country='km' onclick={ updateCountry }><span class='flag km'></span>コモロ</div>
          <div class='column' data-country='co' onclick={ updateCountry }><span class='flag co'></span>コロンビア</div>
          <div class='column' data-country='cg' onclick={ updateCountry }><span class='flag cg'></span>コンゴ共和国</div>
          <div class='column' data-country='cd' onclick={ updateCountry }><span class='flag cd'></span>コンゴ民主共和国</div>

          <div class='column' data-country='sa' onclick={ updateCountry }><span class='flag sa'></span>サウジアラビア</div>
          <div class='column' data-country='gs' onclick={ updateCountry }><span class='flag gs'></span>サウスジョージア・サウスサンドウィッチ諸島</div>
          <div class='column' data-country='ws' onclick={ updateCountry }><span class='flag ws'></span>サモア</div>
          <div class='column' data-country='st' onclick={ updateCountry }><span class='flag st'></span>サントメ・プリンシペ</div>
          <div class='column' data-country='bl' onclick={ updateCountry }><span class='flag bl'></span>サン・バルテルミー</div>
          <div class='column' data-country='zm' onclick={ updateCountry }><span class='flag zm'></span>ザンビア</div>
          <div class='column' data-country='pm' onclick={ updateCountry }><span class='flag pm'></span>サンピエール島・ミクロン島</div>
          <div class='column' data-country='sm' onclick={ updateCountry }><span class='flag sm'></span>サンマリノ</div>
          <div class='column' data-country='mf' onclick={ updateCountry }><span class='flag mf'></span>サン・マルタン（フランス領）</div>
          <div class='column' data-country='sl' onclick={ updateCountry }><span class='flag sl'></span>シエラレオネ</div>
          <div class='column' data-country='dj' onclick={ updateCountry }><span class='flag dj'></span>ジブチ</div>
          <div class='column' data-country='gi' onclick={ updateCountry }><span class='flag gi'></span>ジブラルタル</div>
          <div class='column' data-country='je' onclick={ updateCountry }><span class='flag je'></span>ジャージー</div>
          <div class='column' data-country='jm' onclick={ updateCountry }><span class='flag jm'></span>ジャマイカ</div>
          <div class='column' data-country='ge' onclick={ updateCountry }><span class='flag ge'></span>ジョージア</div>
          <div class='column' data-country='sy' onclick={ updateCountry }><span class='flag sy'></span>シリア・アラブ共和国</div>
          <div class='column' data-country='sg' onclick={ updateCountry }><span class='flag sg'></span>シンガポール</div>
          <div class='column' data-country='sx' onclick={ updateCountry }><span class='flag sx'></span>シント・マールテン（オランダ領）</div>
          <div class='column' data-country='zw' onclick={ updateCountry }><span class='flag zw'></span>ジンバブエ</div>
          <div class='column' data-country='ch' onclick={ updateCountry }><span class='flag ch'></span>スイス</div>
          <div class='column' data-country='se' onclick={ updateCountry }><span class='flag se'></span>スウェーデン</div>
          <div class='column' data-country='sd' onclick={ updateCountry }><span class='flag sd'></span>スーダン</div>
          <div class='column' data-country='sj' onclick={ updateCountry }><span class='flag sj'></span>スヴァールバル諸島およびヤンマイエン島</div>
          <div class='column' data-country='es' onclick={ updateCountry }><span class='flag es'></span>スペイン</div>
          <div class='column' data-country='sr' onclick={ updateCountry }><span class='flag sr'></span>スリナム</div>
          <div class='column' data-country='lk' onclick={ updateCountry }><span class='flag lk'></span>スリランカ</div>
          <div class='column' data-country='sk' onclick={ updateCountry }><span class='flag sk'></span>スロバキア</div>
          <div class='column' data-country='si' onclick={ updateCountry }><span class='flag si'></span>スロベニア</div>
          <div class='column' data-country='sz' onclick={ updateCountry }><span class='flag sz'></span>スワジランド</div>
          <div class='column' data-country='sc' onclick={ updateCountry }><span class='flag sc'></span>セーシェル</div>
          <div class='column' data-country='gq' onclick={ updateCountry }><span class='flag gq'></span>赤道ギニア</div>
          <div class='column' data-country='sn' onclick={ updateCountry }><span class='flag sn'></span>セネガル</div>
          <div class='column' data-country='rs' onclick={ updateCountry }><span class='flag rs'></span>セルビア</div>
          <div class='column' data-country='kn' onclick={ updateCountry }><span class='flag kn'></span>セントクリストファー・ネイビス</div>
          <div class='column' data-country='vc' onclick={ updateCountry }><span class='flag vc'></span>セントビンセントおよびグレナディーン諸島</div>
          <div class='column' data-country='sh' onclick={ updateCountry }><span class='flag sh'></span>セントヘレナ・アセンションおよびトリスタンダクーニャ</div>
          <div class='column' data-country='lc' onclick={ updateCountry }><span class='flag lc'></span>セントルシア</div>
          <div class='column' data-country='so' onclick={ updateCountry }><span class='flag so'></span>ソマリア</div>
          <div class='column' data-country='sb' onclick={ updateCountry }><span class='flag sb'></span>ソロモン諸島</div>

          <div class='column' data-country='tc' onclick={ updateCountry }><span class='flag tc'></span>タークス・カイコス諸島</div>
          <div class='column' data-country='th' onclick={ updateCountry }><span class='flag th'></span>タイ</div>
          <div class='column' data-country='kr' onclick={ updateCountry }><span class='flag kr'></span>大韓民国</div>
          <div class='column' data-country='tw' onclick={ updateCountry }><span class='flag tw'></span>台湾</div>
          <div class='column' data-country='tj' onclick={ updateCountry }><span class='flag tj'></span>タジキスタン</div>
          <div class='column' data-country='tz' onclick={ updateCountry }><span class='flag tz'></span>タンザニア</div>
          <div class='column' data-country='cz' onclick={ updateCountry }><span class='flag cz'></span>チェコ</div>
          <div class='column' data-country='td' onclick={ updateCountry }><span class='flag td'></span>チャド</div>
          <div class='column' data-country='cf' onclick={ updateCountry }><span class='flag cf'></span>中央アフリカ共和国</div>
          <div class='column' data-country='cn' onclick={ updateCountry }><span class='flag cn'></span>中華人民共和国</div>
          <div class='column' data-country='tn' onclick={ updateCountry }><span class='flag tn'></span>チュニジア</div>
          <div class='column' data-country='kp' onclick={ updateCountry }><span class='flag kp'></span>朝鮮民主主義人民共和国</div>
          <div class='column' data-country='cl' onclick={ updateCountry }><span class='flag cl'></span>チリ</div>
          <div class='column' data-country='tv' onclick={ updateCountry }><span class='flag tv'></span>ツバル</div>
          <div class='column' data-country='dk' onclick={ updateCountry }><span class='flag dk'></span>デンマーク</div>
          <div class='column' data-country='de' onclick={ updateCountry }><span class='flag de'></span>ドイツ</div>
          <div class='column' data-country='tg' onclick={ updateCountry }><span class='flag tg'></span>トーゴ</div>
          <div class='column' data-country='tk' onclick={ updateCountry }><span class='flag tk'></span>トケラウ</div>
          <div class='column' data-country='do' onclick={ updateCountry }><span class='flag do'></span>ドミニカ共和国</div>
          <div class='column' data-country='dm' onclick={ updateCountry }><span class='flag dm'></span>ドミニカ国</div>
          <div class='column' data-country='tt' onclick={ updateCountry }><span class='flag tt'></span>トリニダード・トバゴ</div>
          <div class='column' data-country='tm' onclick={ updateCountry }><span class='flag tm'></span>トルクメニスタン</div>
          <div class='column' data-country='tr' onclick={ updateCountry }><span class='flag tr'></span>トルコ</div>
          <div class='column' data-country='to' onclick={ updateCountry }><span class='flag to'></span>トンガ</div>

          <div class='column' data-country='ng' onclick={ updateCountry }><span class='flag ng'></span>ナイジェリア</div>
          <div class='column' data-country='nr' onclick={ updateCountry }><span class='flag nr'></span>ナウル</div>
          <div class='column' data-country='na' onclick={ updateCountry }><span class='flag na'></span>ナミビア</div>
          <div class='column' data-country='aq' onclick={ updateCountry }><span class='flag aq'></span>南極</div>
          <div class='column' data-country='nu' onclick={ updateCountry }><span class='flag nu'></span>ニウエ</div>
          <div class='column' data-country='ni' onclick={ updateCountry }><span class='flag ni'></span>ニカラグア</div>
          <div class='column' data-country='ne' onclick={ updateCountry }><span class='flag ne'></span>ニジェール</div>
          <div class='column' data-country='jp' onclick={ updateCountry }><span class='flag jp'></span>日本</div>
          <div class='column' data-country='eh' onclick={ updateCountry }><span class='flag eh'></span>西サハラ</div>
          <div class='column' data-country='nc' onclick={ updateCountry }><span class='flag nc'></span>ニューカレドニア</div>
          <div class='column' data-country='nz' onclick={ updateCountry }><span class='flag nz'></span>ニュージーランド</div>
          <div class='column' data-country='np' onclick={ updateCountry }><span class='flag np'></span>ネパール</div>
          <div class='column' data-country='nf' onclick={ updateCountry }><span class='flag nf'></span>ノーフォーク島</div>
          <div class='column' data-country='no' onclick={ updateCountry }><span class='flag no'></span>ノルウェー</div>

          <div class='column' data-country='hm' onclick={ updateCountry }><span class='flag hm'></span>ハード島とマクドナルド諸島</div>
          <div class='column' data-country='bh' onclick={ updateCountry }><span class='flag bh'></span>バーレーン</div>
          <div class='column' data-country='ht' onclick={ updateCountry }><span class='flag ht'></span>ハイチ</div>
          <div class='column' data-country='pk' onclick={ updateCountry }><span class='flag pk'></span>パキスタン</div>
          <div class='column' data-country='va' onclick={ updateCountry }><span class='flag va'></span>バチカン市国</div>
          <div class='column' data-country='pa' onclick={ updateCountry }><span class='flag pa'></span>パナマ</div>
          <div class='column' data-country='vu' onclick={ updateCountry }><span class='flag vu'></span>バヌアツ</div>
          <div class='column' data-country='bs' onclick={ updateCountry }><span class='flag bs'></span>バハマ</div>
          <div class='column' data-country='pg' onclick={ updateCountry }><span class='flag pg'></span>パプアニューギニア</div>
          <div class='column' data-country='bm' onclick={ updateCountry }><span class='flag bm'></span>バミューダ</div>
          <div class='column' data-country='pw' onclick={ updateCountry }><span class='flag pw'></span>パラオ</div>
          <div class='column' data-country='py' onclick={ updateCountry }><span class='flag py'></span>パラグアイ</div>
          <div class='column' data-country='bb' onclick={ updateCountry }><span class='flag bb'></span>バルバドス</div>
          <div class='column' data-country='ps' onclick={ updateCountry }><span class='flag ps'></span>パレスチナ</div>
          <div class='column' data-country='hu' onclick={ updateCountry }><span class='flag hu'></span>ハンガリー</div>
          <div class='column' data-country='bd' onclick={ updateCountry }><span class='flag bd'></span>バングラデシュ</div>
          <div class='column' data-country='tl' onclick={ updateCountry }><span class='flag tl'></span>東ティモール</div>
          <div class='column' data-country='pn' onclick={ updateCountry }><span class='flag pn'></span>ピトケアン</div>
          <div class='column' data-country='fj' onclick={ updateCountry }><span class='flag fj'></span>フィジー</div>
          <div class='column' data-country='ph' onclick={ updateCountry }><span class='flag ph'></span>フィリピン</div>
          <div class='column' data-country='fi' onclick={ updateCountry }><span class='flag fi'></span>フィンランド</div>
          <div class='column' data-country='bt' onclick={ updateCountry }><span class='flag bt'></span>ブータン</div>
          <div class='column' data-country='bv' onclick={ updateCountry }><span class='flag bv'></span>ブーベ島</div>
          <div class='column' data-country='pr' onclick={ updateCountry }><span class='flag pr'></span>プエルトリコ</div>
          <div class='column' data-country='fo' onclick={ updateCountry }><span class='flag fo'></span>フェロー諸島</div>
          <div class='column' data-country='fk' onclick={ updateCountry }><span class='flag fk'></span>フォークランド（マルビナス）諸島</div>
          <div class='column' data-country='br' onclick={ updateCountry }><span class='flag br'></span>ブラジル</div>
          <div class='column' data-country='fr' onclick={ updateCountry }><span class='flag fr'></span>フランス</div>
          <div class='column' data-country='gf' onclick={ updateCountry }><span class='flag gf'></span>フランス領ギアナ</div>
          <div class='column' data-country='pf' onclick={ updateCountry }><span class='flag pf'></span>フランス領ポリネシア</div>
          <div class='column' data-country='tf' onclick={ updateCountry }><span class='flag tf'></span>フランス領南方・南極地域</div>
          <div class='column' data-country='bg' onclick={ updateCountry }><span class='flag bg'></span>ブルガリア</div>
          <div class='column' data-country='bf' onclick={ updateCountry }><span class='flag bf'></span>ブルキナファソ</div>
          <div class='column' data-country='bn' onclick={ updateCountry }><span class='flag bn'></span>ブルネイ・ダルサラーム</div>
          <div class='column' data-country='bi' onclick={ updateCountry }><span class='flag bi'></span>ブルンジ</div>
          <div class='column' data-country='vn' onclick={ updateCountry }><span class='flag vn'></span>ベトナム</div>
          <div class='column' data-country='bj' onclick={ updateCountry }><span class='flag bj'></span>ベナン</div>
          <div class='column' data-country='ve' onclick={ updateCountry }><span class='flag ve'></span>ベネズエラ・ボリバル共和国</div>
          <div class='column' data-country='by' onclick={ updateCountry }><span class='flag by'></span>ベラルーシ</div>
          <div class='column' data-country='bz' onclick={ updateCountry }><span class='flag bz'></span>ベリーズ</div>
          <div class='column' data-country='pe' onclick={ updateCountry }><span class='flag pe'></span>ペルー</div>
          <div class='column' data-country='be' onclick={ updateCountry }><span class='flag be'></span>ベルギー</div>
          <div class='column' data-country='pl' onclick={ updateCountry }><span class='flag pl'></span>ポーランド</div>
          <div class='column' data-country='ba' onclick={ updateCountry }><span class='flag ba'></span>ボスニア・ヘルツェゴビナ</div>
          <div class='column' data-country='bw' onclick={ updateCountry }><span class='flag bw'></span>ボツワナ</div>
          <div class='column' data-country='bq' onclick={ updateCountry }><span class='flag bq'></span>ボネール、シント・ユースタティウスおよびサバ</div>
          <div class='column' data-country='bo' onclick={ updateCountry }><span class='flag bo'></span>ボリビア多民族国</div>
          <div class='column' data-country='pt' onclick={ updateCountry }><span class='flag pt'></span>ポルトガル</div>
          <div class='column' data-country='hk' onclick={ updateCountry }><span class='flag hk'></span>香港</div>
          <div class='column' data-country='hn' onclick={ updateCountry }><span class='flag hn'></span>ホンジュラス</div>

          <div class='column' data-country='mh' onclick={ updateCountry }><span class='flag mh'></span>マーシャル諸島</div>
          <div class='column' data-country='mo' onclick={ updateCountry }><span class='flag mo'></span>マカオ</div>
          <div class='column' data-country='mk' onclick={ updateCountry }><span class='flag mk'></span>マケドニア旧ユーゴスラビア共和国</div>
          <div class='column' data-country='mg' onclick={ updateCountry }><span class='flag mg'></span>マダガスカル</div>
          <div class='column' data-country='yt' onclick={ updateCountry }><span class='flag yt'></span>マヨット</div>
          <div class='column' data-country='mw' onclick={ updateCountry }><span class='flag mw'></span>マラウイ</div>
          <div class='column' data-country='ml' onclick={ updateCountry }><span class='flag ml'></span>マリ</div>
          <div class='column' data-country='mt' onclick={ updateCountry }><span class='flag mt'></span>マルタ</div>
          <div class='column' data-country='mq' onclick={ updateCountry }><span class='flag mq'></span>マルティニーク</div>
          <div class='column' data-country='my' onclick={ updateCountry }><span class='flag my'></span>マレーシア</div>
          <div class='column' data-country='im' onclick={ updateCountry }><span class='flag im'></span>マン島</div>
          <div class='column' data-country='fm' onclick={ updateCountry }><span class='flag fm'></span>ミクロネシア連邦</div>
          <div class='column' data-country='za' onclick={ updateCountry }><span class='flag za'></span>南アフリカ</div>
          <div class='column' data-country='ss' onclick={ updateCountry }><span class='flag ss'></span>南スーダン</div>
          <div class='column' data-country='mm' onclick={ updateCountry }><span class='flag mm'></span>ミャンマー</div>
          <div class='column' data-country='mx' onclick={ updateCountry }><span class='flag mx'></span>メキシコ</div>
          <div class='column' data-country='mu' onclick={ updateCountry }><span class='flag mu'></span>モーリシャス</div>
          <div class='column' data-country='mr' onclick={ updateCountry }><span class='flag mr'></span>モーリタニア</div>
          <div class='column' data-country='mz' onclick={ updateCountry }><span class='flag mz'></span>モザンビーク</div>
          <div class='column' data-country='mc' onclick={ updateCountry }><span class='flag mc'></span>モナコ</div>
          <div class='column' data-country='mv' onclick={ updateCountry }><span class='flag mv'></span>モルディブ</div>
          <div class='column' data-country='md' onclick={ updateCountry }><span class='flag md'></span>モルドバ共和国</div>
          <div class='column' data-country='ma' onclick={ updateCountry }><span class='flag ma'></span>モロッコ</div>
          <div class='column' data-country='mn' onclick={ updateCountry }><span class='flag mn'></span>モンゴル</div>
          <div class='column' data-country='me' onclick={ updateCountry }><span class='flag me'></span>モンテネグロ</div>
          <div class='column' data-country='ms' onclick={ updateCountry }><span class='flag ms'></span>モントセラト</div>

          <div class='column' data-country='jo' onclick={ updateCountry }><span class='flag jo'></span>ヨルダン</div>

          <div class='column' data-country='la' onclick={ updateCountry }><span class='flag la'></span>ラオス人民民主共和国</div>
          <div class='column' data-country='lv' onclick={ updateCountry }><span class='flag lv'></span>ラトビア</div>
          <div class='column' data-country='lt' onclick={ updateCountry }><span class='flag lt'></span>リトアニア</div>
          <div class='column' data-country='ly' onclick={ updateCountry }><span class='flag ly'></span>リビア</div>
          <div class='column' data-country='li' onclick={ updateCountry }><span class='flag li'></span>リヒテンシュタイン</div>
          <div class='column' data-country='lr' onclick={ updateCountry }><span class='flag lr'></span>リベリア</div>
          <div class='column' data-country='ro' onclick={ updateCountry }><span class='flag ro'></span>ルーマニア</div>
          <div class='column' data-country='lu' onclick={ updateCountry }><span class='flag lu'></span>ルクセンブルク</div>
          <div class='column' data-country='rw' onclick={ updateCountry }><span class='flag rw'></span>ルワンダ</div>
          <div class='column' data-country='ls' onclick={ updateCountry }><span class='flag ls'></span>レソト</div>
          <div class='column' data-country='lb' onclick={ updateCountry }><span class='flag lb'></span>レバノン</div>
          <div class='column' data-country='re' onclick={ updateCountry }><span class='flag re'></span>レユニオン</div>
          <div class='column' data-country='ru' onclick={ updateCountry }><span class='flag ru'></span>ロシア連邦</div>
        </div>
      </div>
    </div>
  </div>


  <style>
    .ui.active.modal {
      top: 10vh;
      height: 80vh;
      overflow: scroll;
      z-index: 2001;
    }
    .ui.page.dimmer {
      z-index: 2000;
    }

    .column {
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      cursor: pointer;
    }

    @media only screen and (max-width: 767px) {
      .ui.doubling.grid>.row>.column, .ui.grid>.doubling.row>.column {
        padding-bottom: 0 !important;
      }
    }
  </style>


  <script>
    var that = this
    that.visibility = false

    showModal() {
      that.visibility = true
      that.update()
    }

    hideModal() {
      that.visibility = false
      that.update()
    }

    updateCountry(e) {
      var country = e.currentTarget.getAttribute('data-country')
      that.parent.updateCountry(country)
      that.hideModal()
    }
  </script>
</country-select>
