import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_fire2/Screens/edit_note.dart';
import 'package:flutter_fire2/Screens/login.dart';
import 'package:flutter_fire2/Screens/add_note_screen.dart';
import 'package:flutter_fire2/Services/drawer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get_time_ago/get_time_ago.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions:  [
          GestureDetector(
            child:  SpeedDial(
              animatedIcon: AnimatedIcons.ellipsis_search,
              direction: SpeedDialDirection.down,
              elevation: 0.0,
              closeManually: false,
              childMargin: const EdgeInsets.only(left: 60.0),
              children: [
                SpeedDialChild(
                    child: const Icon(Icons.logout),
                    label: 'SignOut',
                    onTap: (){
                      EasyLoading.show();
                      FirebaseAuth.instance.signOut();
                      Get.off(()=> const LoginScreen());
                      EasyLoading.dismiss();
                    }
                ),
              ],
            ),
          )
        ],
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection("notes").
        where("userId", isEqualTo: userId!.uid ).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return const Center(child: Text('Something is wrong!'));
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CupertinoActivityIndicator());
          }
          if(snapshot.data!.docs.isEmpty){
            return const Center(child: Text("You haven't created any note yet!"));
          }
          if(snapshot.data != null && snapshot != null){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  var note = snapshot.data!.docs[index]["note"];
                  var docId = snapshot.data!.docs[index].id;
                  Timestamp date = snapshot.data!.docs[index]['Created At'];
                  var finalDate = DateTime.parse(date.toDate().toString());
                  return Card(
                    elevation: 3,
                    shadowColor: Colors.grey,
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        note,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Created : ${GetTimeAgo.parse(finalDate)}'
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                              onTap: (){
                                EasyLoading.show();
                                Get.to(() => const EditNoteScreen(),arguments: {
                                  "note": note,
                                  "docId": docId
                                });
                                EasyLoading.dismiss();
                          },
                              child: const Icon(Icons.edit)
                          ),
                            const SizedBox(width: 10.0),
                          GestureDetector(
                              onTap: (){
                                EasyLoading.show();
                                FirebaseFirestore.instance.collection("notes").doc(docId).delete();
                                EasyLoading.dismiss();
                          },
                              child: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          EasyLoading.show();
          Get.to(() => const NotesScreen() );
          EasyLoading.dismiss();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}