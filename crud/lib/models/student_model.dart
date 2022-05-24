import 'package:equatable/equatable.dart';

class StudentModel extends Equatable {
  final String id;
  final String nama;
  final int kelas;
  final String jurusan;

  StudentModel({
    this.id = '',
    required this.nama,
    required this.kelas,
    required this.jurusan,
  });

  factory StudentModel.fromJson(String id, Map<String, dynamic> json) {
    return StudentModel(
      id: id,
      nama: json['nama'],
      kelas: json['kelas'].toInt(),
      jurusan: json['jurusan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kelas': kelas.toInt(),
      'jurusan': jurusan,
    };
  }

  @override
  List<Object> get props => [id, nama, kelas, jurusan];
}
