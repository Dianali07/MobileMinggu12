part of 'student_cubit.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final List<StudentModel> students;

  const StudentLoaded(this.students);

  @override
  List<Object> get props => [students];
}

class StudentFailure extends StudentState {
  final String error;
  const StudentFailure({required this.error});

  @override
  List<Object> get props => [error];
}
