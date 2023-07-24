import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_data_base/controller/edit_controller.dart';
import 'package:hive_data_base/db/model/data_model.dart';
import 'package:hive_data_base/db/screens/home_screen.dart';

EditStudentController adds = EditStudentController();

// import '../home_screen.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  EditProfile(
      {Key? key,
      // required this.passValue01,
      required this.index,
      required this.passValueProfile})
      : super(key: key);

  StudentModel passValueProfile;
  int index;

 
  TextEditingController nameController =
      TextEditingController();

  TextEditingController ageController =
      TextEditingController();

 TextEditingController numController =
      TextEditingController();
  dynamic imagePath;



  // ignore: non_constant_identifier_names
  // Future<void> StudentAddBtn(int index) async {
  //   final name = _nameController.text.trim();
  //   final age = _ageController.text.trim();
  //   final number = _numController.text.trim();
  //   // final _image = imagePath;

  //   if (name.isEmpty || age.isEmpty || number.isEmpty) {
  //     return;
  //   }

  //   final students = StudentModel(
  //     name: name,
  //     age: age,
  //     num: number,
  //     image: imagePath ?? passValueProfile.image,
  //   );
  //   final studentDB = await Hive.openBox<StudentModel>('student_db');
  //   studentDB.putAt(index, students);
  //   adds.getAllStudents();
  // }

  // Future<void> takePhoto() async {
  //   // ignore: non_constant_identifier_names
  //   final PickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (PickedFile != null) {
  //     setState(() {
  //       imagePath = PickedFile.path;
  //     });
  //   }
  // }

  // Widget elavatedbtn({required name,required  age, required  number,required key,required context}) {
  //   return ElevatedButton.icon(
  //     onPressed: () {
  //       log(name);
  //        if (name.isEmpty || age.isEmpty || number.isEmpty) {
  //     return;
  //   }
  //        final students = StudentModel(
  //     name: name,
  //     age: age,
  //     num: number,
  //     image: imagePath ?? passValueProfile.image,
  //   );

  //       adds.StudentAddBtn(students,key);

  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (ctx) => const Home_Screen()),
  //           (route) => false);
  //     },
  //     icon: const Icon(Icons.update_rounded),
  //     label: const Text('Update'),
  //   );
  // }

  // Widget textFieldName(
  //     {required TextEditingController myController, required String hintName}) {
   
  // }

  Widget dpImage() {
    return Stack(
      children: [
       Obx(() {
        return CircleAvatar(
            radius: 75,
            backgroundImage: backImage()
            );
       }),
        Positioned(
            bottom: 10,
            right: 25,
            child: InkWell(
                child: const Icon(
                  Icons.add_a_photo_rounded,
                  size: 30,
                ),
                onTap: () {
                  adds.takePhoto();
                })),
      ],
    );
  }

  Widget szdBox = const SizedBox(height: 20);

  //build======================================================================

  @override
  Widget build(BuildContext context) {
    nameController.text=passValueProfile.name;
    ageController.text=passValueProfile.age;
    numController.text=passValueProfile.num;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              dpImage(),
              szdBox,
              TextFieldWidget(
                  myController: nameController,
                  hintName: passValueProfile.name),
              szdBox,
              TextFieldWidget(
                  myController: ageController,
                  hintName: passValueProfile.age),
              szdBox,
              TextFieldWidget(
                  myController: numController,
                  hintName: passValueProfile.num),
              szdBox,
              ElevatedButton.icon(
      onPressed: () {
    //     log(name);
    //      if (name.isEmpty || age.isEmpty || number.isEmpty) {
    //   return;
    // }
         final students = StudentModel(
      name: nameController.text,
      age: ageController.text,
      num: numController.text,
      image: adds.imagePath.value=='x'? passValueProfile.image:adds.imagePath.value,
    );

        adds.StudentAddBtn(students,passValueProfile.key);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => const Home_Screen()),
            (route) => false);
      },
      icon: const Icon(Icons.update_rounded),
      label: const Text('Update'),
    )
              // elavatedbtn(
              //   context: context,
              //   name: nameController.text, 
              //   age: ageController.text, 
              //   number: numController.text, 
              //   key: passValueProfile.key),
            ]),
          ),
        ));
  }

  backImage() {
    if (passValueProfile.image == 'x') {
      return const AssetImage('assets/image.jpg');
    } else if (adds.imagePath.value != 'x') {
      return FileImage(File(adds.imagePath.value));
    } else {
      return FileImage(File(passValueProfile.image!));
    }
  }
}
class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({super.key, required this.hintName, required this.myController});
TextEditingController myController;
 final String hintName; 
  @override
  Widget build(BuildContext context) {
     return TextFormField(
      autofocus: false,
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
}