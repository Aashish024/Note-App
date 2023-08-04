import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_fire2/Screens/add_note_screen.dart';
import 'package:flutter_fire2/Screens/home_screen.dart';
import 'package:flutter_fire2/Screens/info_screen.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  User? userId = FirebaseAuth.instance.currentUser;
  String? userName = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.tealAccent,
                child: Icon(Icons.person),
              ),
              accountName: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('users').doc(userId!.uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if (snapshot.hasData && snapshot.data != null) {
                    var userFirstName = snapshot.data!.get('UserFirstName');
                    return Text('$userFirstName');
                  } else {
                    return const Text('Loading...');
                  }
                },
              ),
              accountEmail: Text('${userId!.email}')
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Home'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: (){
              EasyLoading.show();
              Get.back(result: ()=> const HomeScreen());
              EasyLoading.dismiss();
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Note'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: (){
              EasyLoading.show();
              Get.to(()=> const NotesScreen());
              EasyLoading.dismiss();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: (){
              EasyLoading.show();
              Get.to(()=> const InfoScreen());
              EasyLoading.dismiss();
            },
          )
        ],
      ),
    );
  }
}
