const functions = require('firebase-functions');
const admin = require('firebase-admin');
const riot = require('riot');
const fetch = require('node-fetch');
const fs = require('fs');
const CleanCSS = require('clean-css');

const bracket = require('./tags/shared/bracket.tag');

const ENV = (process.env.GCLOUD_PROJECT == 'tournament-staging') ? 'staging' : 'production';


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


var minifyCss = function() {
  return Promise.all([
    new Promise(function(fulfilled, rejected){
      fs.readFile('./css/tournament.css', 'utf8', function (err, text) {
        var tnmtCss = new CleanCSS({}).minify(text);
        fulfilled(tnmtCss);
      })
    }),
    new Promise(function(fulfilled, rejected){
      fs.readFile('./css/flag.min.css', 'utf8', function (err, text) {
        var flagCss = new CleanCSS({ level: 0 }).minify(text);
        fulfilled(flagCss);
      })
    })
  ])
}


/* トーナメント更新時に、riotでSSRしてstorageに静的HTMLをアップ */
exports.renderHTML = functions.firestore.document('tournaments/{id}').onWrite(event => {
  if(!event.data.exists) { return false; }  //削除時など、データがないときは終了

  var tournament = event.data.data();
  var id = event.params.id;

  var html = riot.render(bracket, {tournament: tournament, editable: false, embed: true});
  html = html.replace(/\r?\n/g, '<br>');
  html = html.replace(/<\/?bracket>/g, '');
  html = autoLink(html);

  var header = function(){/*
    <!doctype html>
    <html ⚡>
    <head>
      <meta charset="utf-8">
      <title>{{title}} | THE TOURNAMENT</title>
      <link rel="canonical" href="https://the-tournament.jp/tournaments/{{tournamentId}}">
      <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">

      <style amp-custom>
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
        #emb-body{background:#fff;padding:10px;border:1px solid #ddd;}
        #emb-body .bracket{margin-bottom:20px; overflow: auto;}
        #emb-body #emb-footer{margin-left:10px}
        #emb-ad{margin-bottom:5px}
  */}.toString().match(/(?:\/\*(?:[\s\S]*?)\*\/)/).pop().replace(/^\/\*/, "").replace(/\*\/$/, "").replace("{{tournamentId}}", id).replace("{{title}}", tournament.title);

  return minifyCss().then(function(css){
    header += '.name { width: ' + tournament.nameWidth + 'px; }';
    header += '.score { width: ' + tournament.scoreWidth + 'px; }';
    header += css[0]['styles'] + ' ' + css[1]['styles'] + '</style>';
    header += '<script async custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js"></script>';
    header += '<script async custom-element="amp-ad" src="https://cdn.ampproject.org/v0/amp-ad-0.1.js"></script>';
    header += '<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>';
    header += '<script async src="https://cdn.ampproject.org/v0.js"></script></head>';

    var container = '<body id="embed"><div id="emb-container"><div id="emb-header">';
    container += '<h1><a target="_blank" href="https://the-tournament.jp/tournaments/'+ id +'">'+ tournament.title;
    container += '</a><small> powered by <a href="https://the-tournament.jp/" target="_blank">THE TOURNAMENT</a> </small></h1></div><div id="emb-body">';
    container += '<amp-analytics type="googleanalytics"> <script type="application/json"> { "vars": { "account": "UA-30867542-19" }, "triggers": { "trackPageview": { "on": "visible", "request": "pageview" } } } </script> </amp-analytics> ';

    html += '<div id="emb-ad"> <amp-ad width="320" height="100" type="fluct" data-g="1000084085" data-u="1000125738"> </amp-ad></div>';

    var storage_root = (ENV=='production') ? 'embed' : 'embed_stg';
    var file = bucket.file(storage_root +'/v1/' + id + '.html');
    return file.save(header + container + html + '</div></div></body></html>', {
      metadata: { contentType: 'text/html' },
      gzip: true
    });
  })

  process.on('unhandledRejection', console.dir);
});
