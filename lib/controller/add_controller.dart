


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../db/model/data_model.dart';

class AddStudentController extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  
  
  final studentListNotifier =<StudentModel>[].obs;


  RxString imagePath = 'x'.obs;

  Future<void> onAddStudentButtonClick(BuildContext ctx) async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final num = numController.text.trim();
    if (name.isEmpty || age.isEmpty || num.isEmpty ) {
      return;
    }

    final student = StudentModel(
      name: name,
      age: age,
      num: num,
      image: imagePath.value,
    );


    addStudent(student);
  }
  Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final id = await studentDB.add(value);
  value.id = id;

//  getAllStudents();
  studentListNotifier.add(value);

}
Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.clear();
  studentListNotifier.addAll(studentDB.values);

 
}
  Future<void> takePhoto() async {
    // ignore: non_constant_identifier_names
    imagePath.value='x';
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      
        imagePath.value = PickedFile.path;
   
    }
  }
}