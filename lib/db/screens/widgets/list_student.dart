import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_data_base/controller/delete_controller.dart';
// import 'package:hive_data_base/db/model/data_model.dart';
import 'package:hive_data_base/db/screens/profile.dart';

import 'add_student.dart';


     DeleteStudentController ads=DeleteStudentController();


class StudentList extends StatelessWidget {
   const StudentList({super.key});
   

  @override
  Widget build(BuildContext context) {
    //   if (adds == null || adds.studentListNotifier == null) {
    //   return const CircularProgressIndicator(); 
    // }
    // adds.getAllStudents();
    return Obx(()=>
       ListView.separated(
        itemBuilder: ((ctx, index) {
          final data = adds.studentListNotifier[index];
          log(data.image.toString());
          return ListTile(
            
            leading: CircleAvatar(
            
              radius: 30,
              backgroundImage: data.image == 'x'
                  ? const AssetImage('assets/image.jpg') as ImageProvider
                  : FileImage(File(data.image!)),
            ),
            title: Text(data.name),
            subtitle: Text(data.age),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentProfile(
                            passId: index,
                            passValue: data,
                          )));
            }),
    
            trailing: IconButton(
                onPressed: () {
                  deleteAlert(context, data.key);
                  
                },
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                )),
          );
        }),
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: adds.studentListNotifier.length,
      ),
    );
  }
}

deleteAlert(BuildContext context,  index) {
  showDialog(
      context: context,
      builder: ((ctx) => AlertDialog(
            content: const Text('Are you sure you want to delete'),
            actions: [
              TextButton(
                  onPressed: () {
                  ads. deleteStudent(index);
                    Navigator.of(context).pop(ctx);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                onPressed: () => Navigator.of(context).pop(ctx),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          )));
}
