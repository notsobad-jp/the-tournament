const functions = require('firebase-functions');
const admin = require('firebase-admin');
const riot = require('riot');
const fs = require('fs');
const xss = require('xss');
const CleanCSS = require('clean-css');
const RSS = require('rss');

// const ENV = 'production';
const ENV = 'staging';
const bucketName = 'app.the-tournament.jp'
const version = 'v1'
const storage_root = (ENV=='production') ? 'embed' : 'embed_stg';

var config = require('../cert_'+ ENV +'.json');
admin.initializeApp(config);



let user_id = 'XXX'
admin.firestore().collection('tournaments').where("userId", "==", user_id).where("updatedAt", ">", new Date("2019-07-01")).get().then(querySnapshot => {
  querySnapshot.forEach(function(doc) {
    let docRef = admin.firestore().collection("tournaments").doc(doc.id)
    docRef.update({ noAds: true })
  });
})
