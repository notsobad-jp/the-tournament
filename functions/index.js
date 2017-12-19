const functions = require('firebase-functions');
const admin = require('firebase-admin');
const riot = require('riot');
const bracket = require('./bracket.tag');

var serviceAccount = require("./cert.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://tournament-7e3b7.firebaseio.com",
  storageBucket: "notsobad-1332.appspot.com"
});
var db = admin.firestore();
var bucket = admin.storage().bucket('app.the-tournament.jp');


exports.renderHTML = functions.https.onRequest((request, response) => {
  var id = "deI7TIO7foDd5fVCbUGf";
  var docRef = db.collection("tournaments").doc(id);
  docRef.get().then(function(doc){
    if(doc.exists) {
      var tournament = doc.data();
      var html = riot.render(bracket, {tournament: tournament, editable: false});
      var file = bucket.file(id + '.html');
      file.save(html);
      process.on('unhandledRejection', console.dir);
      response.send("Hello from Firebase!");
    }
  });
});
