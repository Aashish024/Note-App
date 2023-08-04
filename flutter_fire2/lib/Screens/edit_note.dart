import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_fire2/Screens/home_screen.dart';
import 'package:get/get.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key}) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController editNoteController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: editNoteController
                ..text =" ${Get.arguments['note'].toString()}",
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(onPressed: (){
              EasyLoading.show();
              FirebaseFirestore.instance.collection('notes')
                  .doc(Get.arguments['docId'])
                  .update({
                'note': editNoteController.text.trim()
              }).then((value) => {Get.to(()=> const HomeScreen())});
              EasyLoading.dismiss();
            },
                child: const Text("Update"))
          ],
        ),
      ),
    );
  }
}
