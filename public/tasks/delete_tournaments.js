const functions = require('firebase-functions');
const admin = require('firebase-admin');
const riot = require('riot');
const fs = require('fs');
const xss = require('xss');
const CleanCSS = require('clean-css');
const RSS = require('rss');

const bracket = require('./tags/shared/bracket.tag');

const ENV = 'production';
const bucketName = 'app.the-tournament.jp'
const version = 'v1'
const storage_root = (ENV=='production') ? 'embed' : 'embed_stg';

var serviceAccount = require("./cert_production.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://tournament-7e3b7.firebaseio.com"
});


/* Trigger: /tournaments/xxxx  */
/* トーナメント詳細ページへの直接アクセスは、metaタグを埋め込んでからindex.htmlを返す */
  const domain = 'https://the-tournament.jp';
  const ampDomain = 'https://app.the-tournament.jp/embed/v1/';


// var ids = ['7038','7039', '7040', '7041','7042','7099','7100','7172','7173','7174','7175','7176','7177','7178','7179','7180','7181','7270','7883','7884','7885','7918']
var ids = ['2390','2393','2394','2395','2396', '2397','2398','2418','2426']
for(var i = 0; i < ids.length; i++) {
  admin.firestore().collection('tournaments').doc(ids[i]).delete().then(doc => {
    console.log("deleted!");
  }).catch(error => {
    console.error(error);
  });
}
