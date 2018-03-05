const functions = require('firebase-functions');
const admin = require('firebase-admin');
const riot = require('riot');
const bracket = require('./tags/shared/bracket.tag');

const ENV = (process.env.GCLOUD_PROJECT == 'tournament-staging') ? 'staging' : 'production'

var serviceAccount = require("./cert_"+ ENV +".json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://"+ process.env.GCLOUD_PROJECT +".firebaseio.com",
  storageBucket: "notsobad-1332.appspot.com"
});
var db = admin.firestore();
var bucket = admin.storage().bucket('app.the-tournament.jp');



var autoLink = function(str) {
  var regexp_url = /((h?)(ttps?:\/\/[a-zA-Z0-9.\-_@:/~?%&;=+#',()*!]+))/g; // ']))/;
  var regexp_makeLink = function(all, url, h, href) {
    return '<a href="h' + href + '" target="_blank">' + url + '</a>';
  }
  return str.replace(regexp_url, regexp_makeLink);
}


/* トーナメント更新時に、riotでSSRしてstorageに静的HTMLをアップ */
// exports.renderHTML = functions.firestore.document('tournaments/{id}').onWrite(event => {
//   var tournament = event.data.data();
//   var id = event.params.id;
//
//   var html = riot.render(bracket, {tournament: tournament, editable: false, embed: true});
//   html = html.replace(/\r?\n/g, '<br>')
//   html = autoLink(html)
//
//   var header = function(){/*
//     <html>
//     <head>
//       <meta charset="utf-8" />
//       <title>{{title}} | THE TOURNAMENT</title>
//       <link rel="canonical" href="https://the-tournament.jp/tournaments/{{tournamentId}}">
//       <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
//       <meta name="viewport" content="width=device-width, initial-scale=1.0">
//
//       <style>
//         * { font-family: 'Lucida Grande','Hiragino Kaku Gothic ProN', Meiryo, sans-serif; }
//         body { margin: 0; }
//         a { text-decoration: none; }
//         h1 { font-weight: lighter; font-size: 14px; }
//         h1 small, h1 small a { font-size: 65%; font-weight: normal; line-height: 1; color: #999999; }
//         body#embed{background:transparent}
//         #emb-container{margin:10px}
//         #emb-header{background:#333;color:#fff}
//         #emb-header h1{font-size:14px;margin:0;padding:5px}
//         #emb-header h1 small{margin-left:15px;}
//         #emb-header a{color:#fff}
//         #emb-body{background:#fff;padding:10px;border:1px dotted #333;}
//         #emb-body .bracket{margin-bottom:20px; overflow: auto;}
//         #emb-body #emb-footer{margin-left:10px}
//         #emb-ad{margin-bottom:5px}
//       </style>
//
//       <title>THE TOURNAMENT</title>
//
//       <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/Semantic-Org/UI-Flag/d9e1c3ec/flag.min.css">
//       <link rel="stylesheet" type="text/css" href="https://app.the-tournament.jp/assets/css/tournament.css">
//     </head>
//   */}.toString().match(/(?:\/\*(?:[\s\S]*?)\*\/)/).pop().replace(/^\/\*/, "").replace(/\*\/$/, "").replace("{{tournamentId}}", id).replace("{{title}}", tournament.title);
//
//   var container = '<body id="embed"><div id="emb-container"><div id="emb-header">';
//   container += '<h1><a target="_blank" href="https://the-tournament.jp/tournaments/'+ id +'">'+ tournament.title;
//   container += '</a><small> powered by <a href="https://the-tournament.jp/" target="_blank">THE TOURNAMENT</a> </small></h1></div><div id="emb-body">';
//
//   var storage_root = (ENV=='production') ? 'embed' : 'embed_stg';
//   var file = bucket.file(storage_root +'/v1/' + id + '.html');
//   file.save(header + container + html + '</div></div></body></html>', {
//     metadata: { contentType: 'text/html' },
//     gzip: true
//   });
//
//   process.on('unhandledRejection', console.dir);
//   return true;
// });
