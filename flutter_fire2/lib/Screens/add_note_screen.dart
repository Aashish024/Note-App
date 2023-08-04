import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_fire2/Screens/home_screen.dart';
import 'package:get/get.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  TextEditingController addNoteController = TextEditingController();

  User? userId = FirebaseAuth.instance.currentUser;
  String? userName = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Notes'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: addNoteController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Add Note'
              ),
            ),
          ),
          ElevatedButton(onPressed: () async {
            EasyLoading.show();
            var note = addNoteController.text.trim();
            if (note != " "){
              try {
               await FirebaseFirestore.instance.collection("notes").doc().set({
                  "note": note,
                  "Created At": DateTime.now(),
                  "userId": userId?.uid,
                  "email" : userName
                });
              }catch (e) {
                print("Error $e");
              }
            }else{
              EasyLoading.dismiss();
              print("Note is empty");
            }
            Get.to(() => const HomeScreen());
            EasyLoading.dismiss();
          },
              child: const Text('Add Note'),
          )
        ],
      ),
    );
  }
}
