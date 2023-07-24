

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_data_base/db/model/data_model.dart';
import 'package:hive_data_base/db/screens/widgets/add_student.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditStudentController extends GetxController{
  //   final TextEditingController nameController = TextEditingController();
  // final TextEditingController ageController = TextEditingController();
  // final TextEditingController numController = TextEditingController();

  RxString imagePath = 'x'.obs;
  
  //final studentListNotifiers =<StudentModel>[].obs;


// ignore: non_constant_identifier_names
Future<void> StudentAddBtn(StudentModel student,int key) async {
   
    // final _image = imagePath;

   

   
   
    final studentDB = await Hive.openBox<StudentModel>('student_db');
   await studentDB.put(key, student);
    adds.getAllStudents();
  }

  Future<void> takePhoto() async {
    // ignore: non_constant_identifier_names
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
    
        imagePath.value = PickedFile.path;
      
    }
  }
  
  
}