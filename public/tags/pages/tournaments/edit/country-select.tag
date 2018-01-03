<country-select>
  <div class="ui page active dimmer" if={ visibility } onclick={ hideModal }></div>
  <div class="ui active modal" if={ visibility }>
    <i class="close icon" onclick={ hideModal } ></i>
    <div class="header">
      国の選択
    </div>
    <div class="content">
      <div class="ui grid">
        <div class="ui doubling six column row">
          <div class='column' data-country='is' onclick={ updateCountry }><i class='flag is'></i>アイスランド</div>
          <div class='column' data-country='ie' onclick={ updateCountry }><i class='flag ie'></i>アイルランド</div>
          <div class='column' data-country='az' onclick={ updateCountry }><i class='flag az'></i>アゼルバイジャン</div>
          <div class='column' data-country='af' onclick={ updateCountry }><i class='flag af'></i>アフガニスタン</div>
          <div class='column' data-country='us' onclick={ updateCountry }><i class='flag us'></i>アメリカ合衆国</div>
          <div class='column' data-country='vi' onclick={ updateCountry }><i class='flag vi'></i>アメリカ領ヴァージン諸島</div>
          <div class='column' data-country='as' onclick={ updateCountry }><i class='flag as'></i>アメリカ領サモア</div>
          <div class='column' data-country='ae' onclick={ updateCountry }><i class='flag ae'></i>アラブ首長国連邦</div>
          <div class='column' data-country='dz' onclick={ updateCountry }><i class='flag dz'></i>アルジェリア</div>
          <div class='column' data-country='ar' onclick={ updateCountry }><i class='flag ar'></i>アルゼンチン</div>
          <div class='column' data-country='aw' onclick={ updateCountry }><i class='flag aw'></i>アルバ</div>
          <div class='column' data-country='al' onclick={ updateCountry }><i class='flag al'></i>アルバニア</div>
          <div class='column' data-country='am' onclick={ updateCountry }><i class='flag am'></i>アルメニア</div>
          <div class='column' data-country='ai' onclick={ updateCountry }><i class='flag ai'></i>アンギラ</div>
          <div class='column' data-country='ao' onclick={ updateCountry }><i class='flag ao'></i>アンゴラ</div>
          <div class='column' data-country='ag' onclick={ updateCountry }><i class='flag ag'></i>アンティグア・バーブーダ</div>
          <div class='column' data-country='ad' onclick={ updateCountry }><i class='flag ad'></i>アンドラ</div>
          <div class='column' data-country='ye' onclick={ updateCountry }><i class='flag ye'></i>イエメン</div>
          <div class='column' data-country='gb' onclick={ updateCountry }><i class='flag gb'></i>イギリス</div>
          <div class='column' data-country='io' onclick={ updateCountry }><i class='flag io'></i>イギリス領インド洋地域</div>
          <div class='column' data-country='vg' onclick={ updateCountry }><i class='flag vg'></i>イギリス領ヴァージン諸島</div>
          <div class='column' data-country='il' onclick={ updateCountry }><i class='flag il'></i>イスラエル</div>
          <div class='column' data-country='it' onclick={ updateCountry }><i class='flag it'></i>イタリア</div>
          <div class='column' data-country='iq' onclick={ updateCountry }><i class='flag iq'></i>イラク</div>
          <div class='column' data-country='ir' onclick={ updateCountry }><i class='flag ir'></i>イラン・イスラム共和国</div>
          <div class='column' data-country='in' onclick={ updateCountry }><i class='flag in'></i>インド</div>
          <div class='column' data-country='id' onclick={ updateCountry }><i class='flag id'></i>インドネシア</div>
          <div class='column' data-country='wf' onclick={ updateCountry }><i class='flag wf'></i>ウォリス・フツナ</div>
          <div class='column' data-country='ug' onclick={ updateCountry }><i class='flag ug'></i>ウガンダ</div>
          <div class='column' data-country='ua' onclick={ updateCountry }><i class='flag ua'></i>ウクライナ</div>
          <div class='column' data-country='uz' onclick={ updateCountry }><i class='flag uz'></i>ウズベキスタン</div>
          <div class='column' data-country='uy' onclick={ updateCountry }><i class='flag uy'></i>ウルグアイ</div>
          <div class='column' data-country='ec' onclick={ updateCountry }><i class='flag ec'></i>エクアドル</div>
          <div class='column' data-country='eg' onclick={ updateCountry }><i class='flag eg'></i>エジプト</div>
          <div class='column' data-country='ee' onclick={ updateCountry }><i class='flag ee'></i>エストニア</div>
          <div class='column' data-country='et' onclick={ updateCountry }><i class='flag et'></i>エチオピア</div>
          <div class='column' data-country='er' onclick={ updateCountry }><i class='flag er'></i>エリトリア</div>
          <div class='column' data-country='sv' onclick={ updateCountry }><i class='flag sv'></i>エルサルバドル</div>
          <div class='column' data-country='au' onclick={ updateCountry }><i class='flag au'></i>オーストラリア</div>
          <div class='column' data-country='at' onclick={ updateCountry }><i class='flag at'></i>オーストリア</div>
          <div class='column' data-country='ax' onclick={ updateCountry }><i class='flag ax'></i>オーランド諸島</div>
          <div class='column' data-country='om' onclick={ updateCountry }><i class='flag om'></i>オマーン</div>
          <div class='column' data-country='nl' onclick={ updateCountry }><i class='flag nl'></i>オランダ</div>

          <div class='column' data-country='gh' onclick={ updateCountry }><i class='flag gh'></i>ガーナ</div>
          <div class='column' data-country='cv' onclick={ updateCountry }><i class='flag cv'></i>カーボベルデ</div>
          <div class='column' data-country='gg' onclick={ updateCountry }><i class='flag gg'></i>ガーンジー</div>
          <div class='column' data-country='gy' onclick={ updateCountry }><i class='flag gy'></i>ガイアナ</div>
          <div class='column' data-country='kz' onclick={ updateCountry }><i class='flag kz'></i>カザフスタン</div>
          <div class='column' data-country='qa' onclick={ updateCountry }><i class='flag qa'></i>カタール</div>
          <div class='column' data-country='um' onclick={ updateCountry }><i class='flag um'></i>合衆国領有小離島</div>
          <div class='column' data-country='ca' onclick={ updateCountry }><i class='flag ca'></i>カナダ</div>
          <div class='column' data-country='ga' onclick={ updateCountry }><i class='flag ga'></i>ガボン</div>
          <div class='column' data-country='cm' onclick={ updateCountry }><i class='flag cm'></i>カメルーン</div>
          <div class='column' data-country='gm' onclick={ updateCountry }><i class='flag gm'></i>ガンビア</div>
          <div class='column' data-country='kh' onclick={ updateCountry }><i class='flag kh'></i>カンボジア</div>
          <div class='column' data-country='mp' onclick={ updateCountry }><i class='flag mp'></i>北マリアナ諸島</div>
          <div class='column' data-country='gn' onclick={ updateCountry }><i class='flag gn'></i>ギニア</div>
          <div class='column' data-country='gw' onclick={ updateCountry }><i class='flag gw'></i>ギニアビサウ</div>
          <div class='column' data-country='cy' onclick={ updateCountry }><i class='flag cy'></i>キプロス</div>
          <div class='column' data-country='cu' onclick={ updateCountry }><i class='flag cu'></i>キューバ</div>
          <div class='column' data-country='cw' onclick={ updateCountry }><i class='flag cw'></i>キュラソー</div>
          <div class='column' data-country='gr' onclick={ updateCountry }><i class='flag gr'></i>ギリシャ</div>
          <div class='column' data-country='ki' onclick={ updateCountry }><i class='flag ki'></i>キリバス</div>
          <div class='column' data-country='kg' onclick={ updateCountry }><i class='flag kg'></i>キルギス</div>
          <div class='column' data-country='gt' onclick={ updateCountry }><i class='flag gt'></i>グアテマラ</div>
          <div class='column' data-country='gp' onclick={ updateCountry }><i class='flag gp'></i>グアドループ</div>
          <div class='column' data-country='gu' onclick={ updateCountry }><i class='flag gu'></i>グアム</div>
          <div class='column' data-country='kw' onclick={ updateCountry }><i class='flag kw'></i>クウェート</div>
          <div class='column' data-country='ck' onclick={ updateCountry }><i class='flag ck'></i>クック諸島</div>
          <div class='column' data-country='gl' onclick={ updateCountry }><i class='flag gl'></i>グリーンランド</div>
          <div class='column' data-country='cx' onclick={ updateCountry }><i class='flag cx'></i>クリスマス島</div>
          <div class='column' data-country='gd' onclick={ updateCountry }><i class='flag gd'></i>グレナダ</div>
          <div class='column' data-country='hr' onclick={ updateCountry }><i class='flag hr'></i>クロアチア</div>
          <div class='column' data-country='ky' onclick={ updateCountry }><i class='flag ky'></i>ケイマン諸島</div>
          <div class='column' data-country='ke' onclick={ updateCountry }><i class='flag ke'></i>ケニア</div>
          <div class='column' data-country='ci' onclick={ updateCountry }><i class='flag ci'></i>コートジボワール</div>
          <div class='column' data-country='cc' onclick={ updateCountry }><i class='flag cc'></i>ココス（キーリング）諸島</div>
          <div class='column' data-country='cr' onclick={ updateCountry }><i class='flag cr'></i>コスタリカ</div>
          <div class='column' data-country='km' onclick={ updateCountry }><i class='flag km'></i>コモロ</div>
          <div class='column' data-country='co' onclick={ updateCountry }><i class='flag co'></i>コロンビア</div>
          <div class='column' data-country='cg' onclick={ updateCountry }><i class='flag cg'></i>コンゴ共和国</div>
          <div class='column' data-country='cd' onclick={ updateCountry }><i class='flag cd'></i>コンゴ民主共和国</div>

          <div class='column' data-country='sa' onclick={ updateCountry }><i class='flag sa'></i>サウジアラビア</div>
          <div class='column' data-country='gs' onclick={ updateCountry }><i class='flag gs'></i>サウスジョージア・サウスサンドウィッチ諸島</div>
          <div class='column' data-country='ws' onclick={ updateCountry }><i class='flag ws'></i>サモア</div>
          <div class='column' data-country='st' onclick={ updateCountry }><i class='flag st'></i>サントメ・プリンシペ</div>
          <div class='column' data-country='bl' onclick={ updateCountry }><i class='flag bl'></i>サン・バルテルミー</div>
          <div class='column' data-country='zm' onclick={ updateCountry }><i class='flag zm'></i>ザンビア</div>
          <div class='column' data-country='pm' onclick={ updateCountry }><i class='flag pm'></i>サンピエール島・ミクロン島</div>
          <div class='column' data-country='sm' onclick={ updateCountry }><i class='flag sm'></i>サンマリノ</div>
          <div class='column' data-country='mf' onclick={ updateCountry }><i class='flag mf'></i>サン・マルタン（フランス領）</div>
          <div class='column' data-country='sl' onclick={ updateCountry }><i class='flag sl'></i>シエラレオネ</div>
          <div class='column' data-country='dj' onclick={ updateCountry }><i class='flag dj'></i>ジブチ</div>
          <div class='column' data-country='gi' onclick={ updateCountry }><i class='flag gi'></i>ジブラルタル</div>
          <div class='column' data-country='je' onclick={ updateCountry }><i class='flag je'></i>ジャージー</div>
          <div class='column' data-country='jm' onclick={ updateCountry }><i class='flag jm'></i>ジャマイカ</div>
          <div class='column' data-country='ge' onclick={ updateCountry }><i class='flag ge'></i>ジョージア</div>
          <div class='column' data-country='sy' onclick={ updateCountry }><i class='flag sy'></i>シリア・アラブ共和国</div>
          <div class='column' data-country='sg' onclick={ updateCountry }><i class='flag sg'></i>シンガポール</div>
          <div class='column' data-country='sx' onclick={ updateCountry }><i class='flag sx'></i>シント・マールテン（オランダ領）</div>
          <div class='column' data-country='zw' onclick={ updateCountry }><i class='flag zw'></i>ジンバブエ</div>
          <div class='column' data-country='ch' onclick={ updateCountry }><i class='flag ch'></i>スイス</div>
          <div class='column' data-country='se' onclick={ updateCountry }><i class='flag se'></i>スウェーデン</div>
          <div class='column' data-country='sd' onclick={ updateCountry }><i class='flag sd'></i>スーダン</div>
          <div class='column' data-country='sj' onclick={ updateCountry }><i class='flag sj'></i>スヴァールバル諸島およびヤンマイエン島</div>
          <div class='column' data-country='es' onclick={ updateCountry }><i class='flag es'></i>スペイン</div>
          <div class='column' data-country='sr' onclick={ updateCountry }><i class='flag sr'></i>スリナム</div>
          <div class='column' data-country='lk' onclick={ updateCountry }><i class='flag lk'></i>スリランカ</div>
          <div class='column' data-country='sk' onclick={ updateCountry }><i class='flag sk'></i>スロバキア</div>
          <div class='column' data-country='si' onclick={ updateCountry }><i class='flag si'></i>スロベニア</div>
          <div class='column' data-country='sz' onclick={ updateCountry }><i class='flag sz'></i>スワジランド</div>
          <div class='column' data-country='sc' onclick={ updateCountry }><i class='flag sc'></i>セーシェル</div>
          <div class='column' data-country='gq' onclick={ updateCountry }><i class='flag gq'></i>赤道ギニア</div>
          <div class='column' data-country='sn' onclick={ updateCountry }><i class='flag sn'></i>セネガル</div>
          <div class='column' data-country='rs' onclick={ updateCountry }><i class='flag rs'></i>セルビア</div>
          <div class='column' data-country='kn' onclick={ updateCountry }><i class='flag kn'></i>セントクリストファー・ネイビス</div>
          <div class='column' data-country='vc' onclick={ updateCountry }><i class='flag vc'></i>セントビンセントおよびグレナディーン諸島</div>
          <div class='column' data-country='sh' onclick={ updateCountry }><i class='flag sh'></i>セントヘレナ・アセンションおよびトリスタンダクーニャ</div>
          <div class='column' data-country='lc' onclick={ updateCountry }><i class='flag lc'></i>セントルシア</div>
          <div class='column' data-country='so' onclick={ updateCountry }><i class='flag so'></i>ソマリア</div>
          <div class='column' data-country='sb' onclick={ updateCountry }><i class='flag sb'></i>ソロモン諸島</div>

          <div class='column' data-country='tc' onclick={ updateCountry }><i class='flag tc'></i>タークス・カイコス諸島</div>
          <div class='column' data-country='th' onclick={ updateCountry }><i class='flag th'></i>タイ</div>
          <div class='column' data-country='kr' onclick={ updateCountry }><i class='flag kr'></i>大韓民国</div>
          <div class='column' data-country='tw' onclick={ updateCountry }><i class='flag tw'></i>台湾</div>
          <div class='column' data-country='tj' onclick={ updateCountry }><i class='flag tj'></i>タジキスタン</div>
          <div class='column' data-country='tz' onclick={ updateCountry }><i class='flag tz'></i>タンザニア</div>
          <div class='column' data-country='cz' onclick={ updateCountry }><i class='flag cz'></i>チェコ</div>
          <div class='column' data-country='td' onclick={ updateCountry }><i class='flag td'></i>チャド</div>
          <div class='column' data-country='cf' onclick={ updateCountry }><i class='flag cf'></i>中央アフリカ共和国</div>
          <div class='column' data-country='cn' onclick={ updateCountry }><i class='flag cn'></i>中華人民共和国</div>
          <div class='column' data-country='tn' onclick={ updateCountry }><i class='flag tn'></i>チュニジア</div>
          <div class='column' data-country='kp' onclick={ updateCountry }><i class='flag kp'></i>朝鮮民主主義人民共和国</div>
          <div class='column' data-country='cl' onclick={ updateCountry }><i class='flag cl'></i>チリ</div>
          <div class='column' data-country='tv' onclick={ updateCountry }><i class='flag tv'></i>ツバル</div>
          <div class='column' data-country='dk' onclick={ updateCountry }><i class='flag dk'></i>デンマーク</div>
          <div class='column' data-country='de' onclick={ updateCountry }><i class='flag de'></i>ドイツ</div>
          <div class='column' data-country='tg' onclick={ updateCountry }><i class='flag tg'></i>トーゴ</div>
          <div class='column' data-country='tk' onclick={ updateCountry }><i class='flag tk'></i>トケラウ</div>
          <div class='column' data-country='do' onclick={ updateCountry }><i class='flag do'></i>ドミニカ共和国</div>
          <div class='column' data-country='dm' onclick={ updateCountry }><i class='flag dm'></i>ドミニカ国</div>
          <div class='column' data-country='tt' onclick={ updateCountry }><i class='flag tt'></i>トリニダード・トバゴ</div>
          <div class='column' data-country='tm' onclick={ updateCountry }><i class='flag tm'></i>トルクメニスタン</div>
          <div class='column' data-country='tr' onclick={ updateCountry }><i class='flag tr'></i>トルコ</div>
          <div class='column' data-country='to' onclick={ updateCountry }><i class='flag to'></i>トンガ</div>

          <div class='column' data-country='ng' onclick={ updateCountry }><i class='flag ng'></i>ナイジェリア</div>
          <div class='column' data-country='nr' onclick={ updateCountry }><i class='flag nr'></i>ナウル</div>
          <div class='column' data-country='na' onclick={ updateCountry }><i class='flag na'></i>ナミビア</div>
          <div class='column' data-country='aq' onclick={ updateCountry }><i class='flag aq'></i>南極</div>
          <div class='column' data-country='nu' onclick={ updateCountry }><i class='flag nu'></i>ニウエ</div>
          <div class='column' data-country='ni' onclick={ updateCountry }><i class='flag ni'></i>ニカラグア</div>
          <div class='column' data-country='ne' onclick={ updateCountry }><i class='flag ne'></i>ニジェール</div>
          <div class='column' data-country='jp' onclick={ updateCountry }><i class='flag jp'></i>日本</div>
          <div class='column' data-country='eh' onclick={ updateCountry }><i class='flag eh'></i>西サハラ</div>
          <div class='column' data-country='nc' onclick={ updateCountry }><i class='flag nc'></i>ニューカレドニア</div>
          <div class='column' data-country='nz' onclick={ updateCountry }><i class='flag nz'></i>ニュージーランド</div>
          <div class='column' data-country='np' onclick={ updateCountry }><i class='flag np'></i>ネパール</div>
          <div class='column' data-country='nf' onclick={ updateCountry }><i class='flag nf'></i>ノーフォーク島</div>
          <div class='column' data-country='no' onclick={ updateCountry }><i class='flag no'></i>ノルウェー</div>

          <div class='column' data-country='hm' onclick={ updateCountry }><i class='flag hm'></i>ハード島とマクドナルド諸島</div>
          <div class='column' data-country='bh' onclick={ updateCountry }><i class='flag bh'></i>バーレーン</div>
          <div class='column' data-country='ht' onclick={ updateCountry }><i class='flag ht'></i>ハイチ</div>
          <div class='column' data-country='pk' onclick={ updateCountry }><i class='flag pk'></i>パキスタン</div>
          <div class='column' data-country='va' onclick={ updateCountry }><i class='flag va'></i>バチカン市国</div>
          <div class='column' data-country='pa' onclick={ updateCountry }><i class='flag pa'></i>パナマ</div>
          <div class='column' data-country='vu' onclick={ updateCountry }><i class='flag vu'></i>バヌアツ</div>
          <div class='column' data-country='bs' onclick={ updateCountry }><i class='flag bs'></i>バハマ</div>
          <div class='column' data-country='pg' onclick={ updateCountry }><i class='flag pg'></i>パプアニューギニア</div>
          <div class='column' data-country='bm' onclick={ updateCountry }><i class='flag bm'></i>バミューダ</div>
          <div class='column' data-country='pw' onclick={ updateCountry }><i class='flag pw'></i>パラオ</div>
          <div class='column' data-country='py' onclick={ updateCountry }><i class='flag py'></i>パラグアイ</div>
          <div class='column' data-country='bb' onclick={ updateCountry }><i class='flag bb'></i>バルバドス</div>
          <div class='column' data-country='ps' onclick={ updateCountry }><i class='flag ps'></i>パレスチナ</div>
          <div class='column' data-country='hu' onclick={ updateCountry }><i class='flag hu'></i>ハンガリー</div>
          <div class='column' data-country='bd' onclick={ updateCountry }><i class='flag bd'></i>バングラデシュ</div>
          <div class='column' data-country='tl' onclick={ updateCountry }><i class='flag tl'></i>東ティモール</div>
          <div class='column' data-country='pn' onclick={ updateCountry }><i class='flag pn'></i>ピトケアン</div>
          <div class='column' data-country='fj' onclick={ updateCountry }><i class='flag fj'></i>フィジー</div>
          <div class='column' data-country='ph' onclick={ updateCountry }><i class='flag ph'></i>フィリピン</div>
          <div class='column' data-country='fi' onclick={ updateCountry }><i class='flag fi'></i>フィンランド</div>
          <div class='column' data-country='bt' onclick={ updateCountry }><i class='flag bt'></i>ブータン</div>
          <div class='column' data-country='bv' onclick={ updateCountry }><i class='flag bv'></i>ブーベ島</div>
          <div class='column' data-country='pr' onclick={ updateCountry }><i class='flag pr'></i>プエルトリコ</div>
          <div class='column' data-country='fo' onclick={ updateCountry }><i class='flag fo'></i>フェロー諸島</div>
          <div class='column' data-country='fk' onclick={ updateCountry }><i class='flag fk'></i>フォークランド（マルビナス）諸島</div>
          <div class='column' data-country='br' onclick={ updateCountry }><i class='flag br'></i>ブラジル</div>
          <div class='column' data-country='fr' onclick={ updateCountry }><i class='flag fr'></i>フランス</div>
          <div class='column' data-country='gf' onclick={ updateCountry }><i class='flag gf'></i>フランス領ギアナ</div>
          <div class='column' data-country='pf' onclick={ updateCountry }><i class='flag pf'></i>フランス領ポリネシア</div>
          <div class='column' data-country='tf' onclick={ updateCountry }><i class='flag tf'></i>フランス領南方・南極地域</div>
          <div class='column' data-country='bg' onclick={ updateCountry }><i class='flag bg'></i>ブルガリア</div>
          <div class='column' data-country='bf' onclick={ updateCountry }><i class='flag bf'></i>ブルキナファソ</div>
          <div class='column' data-country='bn' onclick={ updateCountry }><i class='flag bn'></i>ブルネイ・ダルサラーム</div>
          <div class='column' data-country='bi' onclick={ updateCountry }><i class='flag bi'></i>ブルンジ</div>
          <div class='column' data-country='vn' onclick={ updateCountry }><i class='flag vn'></i>ベトナム</div>
          <div class='column' data-country='bj' onclick={ updateCountry }><i class='flag bj'></i>ベナン</div>
          <div class='column' data-country='ve' onclick={ updateCountry }><i class='flag ve'></i>ベネズエラ・ボリバル共和国</div>
          <div class='column' data-country='by' onclick={ updateCountry }><i class='flag by'></i>ベラルーシ</div>
          <div class='column' data-country='bz' onclick={ updateCountry }><i class='flag bz'></i>ベリーズ</div>
          <div class='column' data-country='pe' onclick={ updateCountry }><i class='flag pe'></i>ペルー</div>
          <div class='column' data-country='be' onclick={ updateCountry }><i class='flag be'></i>ベルギー</div>
          <div class='column' data-country='pl' onclick={ updateCountry }><i class='flag pl'></i>ポーランド</div>
          <div class='column' data-country='ba' onclick={ updateCountry }><i class='flag ba'></i>ボスニア・ヘルツェゴビナ</div>
          <div class='column' data-country='bw' onclick={ updateCountry }><i class='flag bw'></i>ボツワナ</div>
          <div class='column' data-country='bq' onclick={ updateCountry }><i class='flag bq'></i>ボネール、シント・ユースタティウスおよびサバ</div>
          <div class='column' data-country='bo' onclick={ updateCountry }><i class='flag bo'></i>ボリビア多民族国</div>
          <div class='column' data-country='pt' onclick={ updateCountry }><i class='flag pt'></i>ポルトガル</div>
          <div class='column' data-country='hk' onclick={ updateCountry }><i class='flag hk'></i>香港</div>
          <div class='column' data-country='hn' onclick={ updateCountry }><i class='flag hn'></i>ホンジュラス</div>

          <div class='column' data-country='mh' onclick={ updateCountry }><i class='flag mh'></i>マーシャル諸島</div>
          <div class='column' data-country='mo' onclick={ updateCountry }><i class='flag mo'></i>マカオ</div>
          <div class='column' data-country='mk' onclick={ updateCountry }><i class='flag mk'></i>マケドニア旧ユーゴスラビア共和国</div>
          <div class='column' data-country='mg' onclick={ updateCountry }><i class='flag mg'></i>マダガスカル</div>
          <div class='column' data-country='yt' onclick={ updateCountry }><i class='flag yt'></i>マヨット</div>
          <div class='column' data-country='mw' onclick={ updateCountry }><i class='flag mw'></i>マラウイ</div>
          <div class='column' data-country='ml' onclick={ updateCountry }><i class='flag ml'></i>マリ</div>
          <div class='column' data-country='mt' onclick={ updateCountry }><i class='flag mt'></i>マルタ</div>
          <div class='column' data-country='mq' onclick={ updateCountry }><i class='flag mq'></i>マルティニーク</div>
          <div class='column' data-country='my' onclick={ updateCountry }><i class='flag my'></i>マレーシア</div>
          <div class='column' data-country='im' onclick={ updateCountry }><i class='flag im'></i>マン島</div>
          <div class='column' data-country='fm' onclick={ updateCountry }><i class='flag fm'></i>ミクロネシア連邦</div>
          <div class='column' data-country='za' onclick={ updateCountry }><i class='flag za'></i>南アフリカ</div>
          <div class='column' data-country='ss' onclick={ updateCountry }><i class='flag ss'></i>南スーダン</div>
          <div class='column' data-country='mm' onclick={ updateCountry }><i class='flag mm'></i>ミャンマー</div>
          <div class='column' data-country='mx' onclick={ updateCountry }><i class='flag mx'></i>メキシコ</div>
          <div class='column' data-country='mu' onclick={ updateCountry }><i class='flag mu'></i>モーリシャス</div>
          <div class='column' data-country='mr' onclick={ updateCountry }><i class='flag mr'></i>モーリタニア</div>
          <div class='column' data-country='mz' onclick={ updateCountry }><i class='flag mz'></i>モザンビーク</div>
          <div class='column' data-country='mc' onclick={ updateCountry }><i class='flag mc'></i>モナコ</div>
          <div class='column' data-country='mv' onclick={ updateCountry }><i class='flag mv'></i>モルディブ</div>
          <div class='column' data-country='md' onclick={ updateCountry }><i class='flag md'></i>モルドバ共和国</div>
          <div class='column' data-country='ma' onclick={ updateCountry }><i class='flag ma'></i>モロッコ</div>
          <div class='column' data-country='mn' onclick={ updateCountry }><i class='flag mn'></i>モンゴル</div>
          <div class='column' data-country='me' onclick={ updateCountry }><i class='flag me'></i>モンテネグロ</div>
          <div class='column' data-country='ms' onclick={ updateCountry }><i class='flag ms'></i>モントセラト</div>

          <div class='column' data-country='jo' onclick={ updateCountry }><i class='flag jo'></i>ヨルダン</div>

          <div class='column' data-country='la' onclick={ updateCountry }><i class='flag la'></i>ラオス人民民主共和国</div>
          <div class='column' data-country='lv' onclick={ updateCountry }><i class='flag lv'></i>ラトビア</div>
          <div class='column' data-country='lt' onclick={ updateCountry }><i class='flag lt'></i>リトアニア</div>
          <div class='column' data-country='ly' onclick={ updateCountry }><i class='flag ly'></i>リビア</div>
          <div class='column' data-country='li' onclick={ updateCountry }><i class='flag li'></i>リヒテンシュタイン</div>
          <div class='column' data-country='lr' onclick={ updateCountry }><i class='flag lr'></i>リベリア</div>
          <div class='column' data-country='ro' onclick={ updateCountry }><i class='flag ro'></i>ルーマニア</div>
          <div class='column' data-country='lu' onclick={ updateCountry }><i class='flag lu'></i>ルクセンブルク</div>
          <div class='column' data-country='rw' onclick={ updateCountry }><i class='flag rw'></i>ルワンダ</div>
          <div class='column' data-country='ls' onclick={ updateCountry }><i class='flag ls'></i>レソト</div>
          <div class='column' data-country='lb' onclick={ updateCountry }><i class='flag lb'></i>レバノン</div>
          <div class='column' data-country='re' onclick={ updateCountry }><i class='flag re'></i>レユニオン</div>
          <div class='column' data-country='ru' onclick={ updateCountry }><i class='flag ru'></i>ロシア連邦</div>
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
