
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_data_base/db/model/data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class  SearchStudentController extends GetxController{

  RxList serachList= <StudentModel>[].obs;
 // RxList serachcDisplay= <StudentModel>[].obs;
  Future<void> searchStudents(String query) async {
    log(query);
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  serachList.clear();
serachList.addAll(studentDB.values.where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList());
          log(serachList.length.toString());
} 
}