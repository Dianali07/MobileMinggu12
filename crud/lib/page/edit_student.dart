import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud/cubit/student_cubit.dart';
import 'package:crud/models/student_model.dart';

class EditStudent extends StatefulWidget {
  final StudentModel student;
  EditStudent({Key? key, required this.student}) : super(key: key);

  @override
  State<EditStudent> createState() => EditStudentState();
}

class EditStudentState extends State<EditStudent> {
  TextEditingController _namaController = TextEditingController(text: '');
  TextEditingController _kelasController = TextEditingController(text: '');
  TextEditingController _jurusanController = TextEditingController(text: '');

  @override
  void initState() {
    _namaController.text = widget.student.nama;
    _kelasController.text = widget.student.kelas.toString();
    _jurusanController.text = widget.student.jurusan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Pendataan Anggota',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: _namaController,
            onChanged: (val) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Nama Anggota',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: _namaController.text.isEmpty
                        ? Color.fromARGB(255, 243, 229, 33)
                        : Color.fromARGB(255, 243, 229, 33)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: _kelasController,
            onChanged: (val) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Semester',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: _kelasController.text.isEmpty
                        ? Color.fromARGB(255, 243, 229, 33)
                        : Color.fromARGB(255, 243, 229, 33)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: _jurusanController,
            onChanged: (val) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Prodi',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: _jurusanController.text.isEmpty
                        ? Color.fromARGB(255, 243, 229, 33)
                        : Color.fromARGB(255, 243, 229, 33)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 229, 33),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {
                // check if all field is filled
                if (_namaController.text.isEmpty ||
                    _kelasController.text.isEmpty ||
                    _jurusanController.text.isEmpty) {
                  // ignore: deprecated_member_use
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('All field must be filled'),
                          actions: [
                            // ignore: deprecated_member_use
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        );
                      });
                } else {
                  int kelas = int.parse(_kelasController.text);
                  BlocProvider.of<StudentCubit>(context).editStudent(
                    StudentModel(
                      id: widget.student.id,
                      nama: _namaController.text,
                      kelas: kelas,
                      jurusan: _jurusanController.text,
                    ),
                  );
                  Navigator.pop(context, true);
                }
              },
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
