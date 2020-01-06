// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:login/asses.dart';
// import 'package:flutter/services.dart';
import 'package:login/authentication.dart';
import 'package:login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:login/login_page.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:login/models/todo.dart';
// import 'dart:async';
import 'Talk_to_people.dart';
import 'authentication.dart';
// import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
 String mood = "Happy";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     checkUserType(); 
     Timer.periodic(Duration(seconds:1), (timer){
       checkMood();
     });
  }
  

  // final FirebaseDatabase _database = FirebaseDatabase.instance;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final _textEditingController = TextEditingController();
  // StreamSubscription<Event> _onTodoAddedSubscription;
  // StreamSubscription<Event> _onTodoChangedSubscription;

 
  // /final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //bool _isEmailVerified = false;
//  _signOut() async {
//     await _firebaseAuth.signOut();
//    }

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text("email"),
      accountEmail: Text("name"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage("imageUrl"),
        backgroundColor:  Colors.white,),
        
    );

    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title:  Text("Talk to People"),
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));},
          
          ),
         ListTile(
          title:  Text('Talk to people'),
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AssesPage()));},
          
        ),
         ListTile(
          title:  Text('Asses Thyself'),
          onTap: () => {},
          
        ),
         ListTile(
          title:  Text('Agenda Today'),
          onTap: () => {},
          
        ),
        ListTile(
          title: Text('Logout'),
        onTap: (){
          
         
          // signOut();
        logout();
           
        // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginSignupPage();}), ModalRoute.withName('/'));
          // Navigator.of(context).pushAndRemoveUntil('/',(Route<dynamic> route) => false);
          
      },
        )
        
        
      ],
    );
  
 final sample = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Name',
      style: TextStyle(fontSize: 16.0, color: Colors.white),),
    );
  final sample2 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(mood,
      style: TextStyle(fontSize: 28.0, color: Colors.white),),
    );


    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[sample,sample2],
      ),
      );

    


    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.lightBlue,
        title: Text('Carehere'),
      ),
      body: body,
      drawer: Drawer(child: drawerItems,),
    );
  }

  
  void askIfIntroExtro() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'You are what?',
                 style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
        
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                      pref.setString("usertype", "introvert");
                     
                    },
                    child: Text(
                      'Im Introvert',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                      pref.setString("usertype", "extrovert");
                      
                    },
                    child: Text(
                      'Im Extrovert!',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }
  void checkUserType() async {
   final SharedPreferences pref = await SharedPreferences.getInstance();
   final String checkuserType = pref.getString("usertype");
    if(checkuserType != null){
     
    }else{
      askIfIntroExtro();
    }
  }

  void logout() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString("usertype",null);
  }
   void checkMood() async {
     final SharedPreferences pref = await SharedPreferences.getInstance();
      final int todaysMood = pref.getInt("score");
     if (todaysMood == 3) {
       setState(() {
         mood = "NEUTRAL";
       });
     } else if (todaysMood > 3) {
       setState(() {
         mood = "HAPPY";
       });
     } else {
       setState(() {
         mood = "SAD";
       });
     }
   }
  
                                
}