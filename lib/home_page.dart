// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/authentication.dart';
// import 'package:login/login_page.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:login/models/todo.dart';
// import 'dart:async';
import 'Talk_to_people.dart';
import 'login_page.dart';

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
  

  // final FirebaseDatabase _database = FirebaseDatabase.instance;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final _textEditingController = TextEditingController();
  // StreamSubscription<Event> _onTodoAddedSubscription;
  // StreamSubscription<Event> _onTodoChangedSubscription;

 
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   //bool _isEmailVerified = false;
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
          onTap: () => {},
          
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
          // signout();
          // _signOut();
        
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginSignupPage();}), ModalRoute.withName('/'));
          
      },
        )
        
        
      ],
    );
    final clyde  = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage("imageUrl"),),),);


    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("name",
      style: TextStyle(fontSize: 28.0, color: Colors.white),),
    );
          
    final sample = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Welcome ' + "name",
      style: TextStyle(fontSize: 16.0, color: Colors.white),),
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
        children: <Widget>[clyde,welcome,sample],
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
}