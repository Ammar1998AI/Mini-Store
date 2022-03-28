import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/utils/Data.dart';


class helper{

  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Firestore _firestore = Firestore.instance;

  static FirebaseUser loggedInUser;

  static QuerySnapshot documents;


  static Future<AuthResult> login_user(String email,String password) async {

    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  static Future<AuthResult> SignUp_User(String email,String password) async {
    var newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return newuser;
  }

  static void GetCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }


  static void add_product(Data data) {
    GetCurrentUser();
    if (data != null && data.Amount != null &&
        data.imageUrl != null &&
        data.title != null &&
        data.price != null &&
        data.documentId == null) {
      _firestore.collection('UsersProducts').add({
        'user': loggedInUser.email,
        'data': [
          data.title,
          data.price.substring(1),
          data.imageUrl,
          data.Amount
        ]
      });
    }
  }

  static void getdocuments() async{
    try {
      documents = await Firestore.instance.collection('UsersProducts').getDocuments();
    }
    catch(e){

    }
  }

  static List<Data> GetData() {
    GetCurrentUser();
    getdocuments();
    List<Data> mydata = new List();

    for(int i = 0;i< documents.documents.length;i++){
      if(documents.documents[i].data['user']==loggedInUser.email){

      Data data = new Data();
      data.title=documents.documents[i].data['data'][0];
      data.price = documents.documents[i].data['data'][1];
      data.imageUrl = documents.documents[i].data['data'][2];
      data.Amount = documents.documents[i].data['data'][3];
      data.documentId = documents.documents[i].documentID;
      mydata.add(data);
      }
    }
    return mydata;
  }

}