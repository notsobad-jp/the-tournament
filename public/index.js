const functions = require('firebase-functions');
const admin = require('firebase-admin');
const riot = require('riot');
const bracket = require('./tags/shared/bracket.tag');

var serviceAccount = require("./cert.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://tournament-7e3b7.firebaseio.com",
  storageBucket: "notsobad-1332.appspot.com"
});
var db = admin.firestore();
var bucket = admin.storage().bucket('app.the-tournament.jp');


/* 匿名ユーザーで作成したトーナメントを、ログイン後の正規アカウントに移行 */
exports.linkAccount = functions.firestore.document('linkRequests/{newUid}').onCreate(event => {
  var newUid = event.params.newUid;
  var oldUid = event.data.data().oldUid;

  var promise = new Promise(function(resolve, reject) {
    var tnmtRef = db.collection("tournaments").where("userId", "==", oldUid)
    tnmtRef.get().then(function(querySnapshot){
      var batch = db.batch();
      for(i in querySnapshot.docs) {
        var ref = db.collection("tournaments").doc(querySnapshot.docs[i].id);
        batch.update(ref, {userId: newUid});
      }
      //不要になった移行用レコードを消しとく
      // batch.delete(db.collection("anonymousUsers").doc(oldUid))
      // batch.delete(db.collection("linkRequests").doc(newUid))

      //処理実行
      batch.commit().then(function () {
        resolve();
      });
    })
  });
  process.on('unhandledRejection', console.dir);
  return promise;
});


/* トーナメント更新時に、riotでSSRしてstorageに静的HTMLをアップ */
exports.renderHTML = functions.firestore.document('tournaments/{id}').onWrite(event => {
  var tournament = event.data.data();
  var id = event.params.id;

  var html = riot.render(bracket, {tournament: tournament, editable: false, id: id});
  var header = function(){/*
    <html>
    <head>
      <meta charset="utf-8" />
      <title>{{title}} | THE TOURNAMENT</title>
      <link rel="canonical" href="https://tournament-7e3b7.firebaseapp.com/tournaments/{{tournamendId}}">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <style>
        * { font-family: 'Lucida Grande','Hiragino Kaku Gothic ProN', Meiryo, sans-serif; }
        body { margin: 0; }
        a { text-decoration: none; }
        h1 { font-weight: lighter; font-size: 14px; }
        h1 small, h1 small a { font-size: 65%; font-weight: normal; line-height: 1; color: #999999; }
        body#embed{background:transparent}
        #emb-container{margin:10px}
        #emb-header{background:#333;color:#fff}
        #emb-header h1{font-size:14px;margin:0;padding:5px}
        #emb-header h1 small{margin-left:15px;}
        #emb-header a{color:#fff}
        #emb-body{background:#fff;padding:10px;border:1px dotted #333;}
        #emb-body .bracket{margin-bottom:20px; overflow: auto;}
        #emb-body #emb-footer{margin-left:10px}
        #emb-ad{margin-bottom:5px}
      </style>

      <title>THE TOURNAMENT</title>

      <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/lafeber/world-flags-sprite/9a8b5ea6/stylesheets/flags16.css">
      <link rel="stylesheet" type="text/css" href="https://app.the-tournament.jp/assets/css/tournament.css">
    </head>
  */}.toString().match(/(?:\/\*(?:[\s\S]*?)\*\/)/).pop().replace(/^\/\*/, "").replace(/\*\/$/, "").replace("{{tournamentId}}", id).replace("{{title}}", tournament.title);

  var container = '<body id="embed"><div id="emb-container"><div id="emb-header">';
  container += '<h1><a target="_blank" href="https://tournament-7e3b7.firebaseapp.com/tournaments/'+ id +'">'+ tournament.title;
  container += '</a><small> powered by <a href="https://tournament-7e3b7.firebaseapp.com/" target="_blank">THE TOURNAMENT</a> </small></h1></div><div id="emb-body">';

  var file = bucket.file('embed/v1/' + id + '.html');
  file.save(header + container + html + '</div></div></body></html>', {
    metadata: { contentType: 'text/html' },
    gzip: true
  });

  process.on('unhandledRejection', console.dir);
  return true;
});
