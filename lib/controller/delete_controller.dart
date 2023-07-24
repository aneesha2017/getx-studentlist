import 'package:get/get.dart';
import 'package:hive_data_base/db/screens/widgets/add_student.dart';
import 'package:hive_flutter/adapters.dart';

import '../db/model/data_model.dart';
class DeleteStudentController extends GetxController{
  


  Future<void> deleteStudent(int id) async {
 final studentDB = await Hive.openBox<StudentModel>('student_db');
   await studentDB.delete(id);
   
  adds.getAllStudents();
   
}
}
