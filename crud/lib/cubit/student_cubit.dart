import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:crud/models/student_model.dart';
import 'package:crud/services/student_service.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  void getStudents() async {
    try {
      emit(StudentLoading());
      List<StudentModel> students = await StudentService().getStudents();
      print(students);
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentFailure(error: e.toString()));
    }
  }

  void deleteStudent(String id) async {
    try {
      await StudentService().deleteStudent(id);
      getStudents();
    } catch (e) {
      emit(StudentFailure(error: e.toString()));
    }
  }

  void addStudent(StudentModel student) async {
    try {
      emit(StudentLoading());
      await StudentService().addStudent(student);
      emit(StudentLoaded([]));
    } catch (e) {
      emit(StudentFailure(error: e.toString()));
    }
  }

  void editStudent(StudentModel student) async {
    try {
      emit(StudentLoading());
      await StudentService().editStudent(student);
      emit(StudentLoaded([]));
    } catch (e) {
      emit(StudentFailure(error: e.toString()));
    }
  }
}
