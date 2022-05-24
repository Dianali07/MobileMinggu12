import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud/cubit/student_cubit.dart';
import 'package:crud/models/student_model.dart';
import 'package:crud/page/add_student.dart';
import 'package:crud/page/edit_student.dart';

class StudentItem extends StatelessWidget {
  final StudentModel student;
  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text('${student.jurusan} - ${student.kelas}'),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditStudent(student: student);
              }));
            },
            icon: Icon(Icons.edit),
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Hapus'),
                    content:
                        Text('Apakah anda yakin ingin menghapus data ini?'),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Batal'),
                      ),
                      FlatButton(
                        onPressed: () {
                          BlocProvider.of<StudentCubit>(context)
                              .deleteStudent(student.id);
                          Navigator.of(context).pop();
                        },
                        child: Text('Hapus'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
