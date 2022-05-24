import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/student_model.dart';

class StudentService {
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection('datasiswa');

  Future<List<StudentModel>> getStudents() async {
    try {
      QuerySnapshot snapshot = await _studentCollection.get();
      List<StudentModel> students = snapshot.docs
          .map((doc) =>
              StudentModel.fromJson(doc.id, doc.data() as Map<String, dynamic>))
          .toList();
      return students;
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      await _studentCollection.doc(id).delete();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addStudent(StudentModel student) async {
    try {
      await _studentCollection.add({
        'nama': student.nama,
        'kelas': student.kelas,
        'jurusan': student.jurusan,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> editStudent(StudentModel student) async {
    try {
      await _studentCollection.doc(student.id).update({
        'nama': student.nama,
        'kelas': student.kelas,
        'jurusan': student.jurusan,
      });
    } catch (e) {
      throw e;
    }
  }
}
