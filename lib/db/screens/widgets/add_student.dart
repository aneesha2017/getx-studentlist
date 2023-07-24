import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_data_base/controller/add_controller.dart';


AddStudentController adds = AddStudentController();

// ignore: camel_case_types
class AddStudent_w extends StatefulWidget {
  const AddStudent_w({super.key});

  @override
  State<AddStudent_w> createState() => _AddStudent_wState();
}

// ignore: camel_case_types
class _AddStudent_wState extends State<AddStudent_w> {


  String? imagePath = 'x';


  Widget elavatedbtn({required Icon myIcon, required Text myLabel}) {
    return ElevatedButton.icon(
      onPressed: () {
        if (adds.nameController.text.isNotEmpty &&
            adds.ageController.text.isNotEmpty &&
            adds.numController.text.isNotEmpty) {
          adds.onAddStudentButtonClick(context);

          Navigator.of(context).pop();
        } else {
          alert(context);
        }
      },
      icon: myIcon,
      label: myLabel,
    );
  }

  Widget textFieldName(
      {required TextEditingController myController, hintName}) {
    return TextFormField(
      controller: myController,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(234, 236, 238, 2),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50)),
        hintText: hintName,
      ),
    );
  }

  Widget textFieldNum({required TextEditingController myController, hintName}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: myController,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(234, 236, 238, 2),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50)),
        hintText: hintName,
      ),
    );
  }

  Widget dpImage() {
    return Stack(
      children: [
        Obx(() => CircleAvatar(
              radius: 75,
              backgroundImage: adds.imagePath.value == 'x'
                  ? const AssetImage('assets/image.jpg') as ImageProvider
                  : FileImage(File(adds.imagePath.value)),
            )),
        Positioned(
            bottom: 10,
            right: 25,
            child: InkWell(
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  size: 30,
                ),
                onTap: () {
                  adds.takePhoto();
                })),
      ],
    );
  }

  Widget szdBox = const SizedBox(height: 20);

  //buider------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Student'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              dpImage(),
              szdBox,
              textFieldName(
                  myController: adds.nameController, hintName: "Name"),
              szdBox,
              textFieldNum(myController: adds.ageController, hintName: "Age"),
              szdBox,
              textFieldNum(
                  myController: adds.numController, hintName: "Number"),
              szdBox,
              elavatedbtn(
                  myIcon: const Icon(Icons.person_add_alt_outlined),
                  myLabel: const Text('Add student')),
            ]),
          ),
        ));
  }

  alert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text("Name,Age and Number required")));
  }
}
