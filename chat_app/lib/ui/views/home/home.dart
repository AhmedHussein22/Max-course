import 'package:chat_app/model/Userinfo.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
            onPressed: (){
               Services().signOut();
            },
            child: Icon(Icons.logout),
          )
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child:Center(
          child: Column(
            children: [
              Text(
                "${user.username}"
              ),
               Text(
                "${user.usermail}"
              )
            ],
          ),
        )
      ),
    );
  }
}