import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud/cubit/auth_cubit.dart';
import 'package:crud/cubit/student_cubit.dart';
import 'package:crud/models/student_model.dart';
import 'package:crud/widgets/student_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<StudentCubit>().getStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data Anggota',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Selamat Datang, Anggota ${state.user.username} ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.refresh),
                      color: Colors.black87,
                      onPressed: () {
                        BlocProvider.of<StudentCubit>(context).getStudents();
                      }),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget students(List<StudentModel> students) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: students
                .map((StudentModel studentModel) =>
                    StudentItem(student: studentModel))
                .toList(),
          ),
        ],
      );
    }

    return Scaffold(
      body: BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state is StudentFailure) {
            // ignore: deprecated_member_use
            print(state.error);
          }
        },
        builder: (context, state) {
          if (state is StudentLoaded) {
            return ListView(
              padding: EdgeInsets.all(24),
              children: [
                header(),
                students(state.students),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20, left: 24, right: 24),
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 229, 33),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add-student');
          },
          child: Text(
            'Tambah Anggota',
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
