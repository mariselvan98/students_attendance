import 'package:jiffy/jiffy.dart';

import 'atteandancemodel.dart';

// class StudentAttenance {
//   String? date;
//   List? sessionsVariant;

//   StudentAttenance({
//     this.date,
//     this.sessionsVariant,
//   });

//   factory StudentAttenance.fromJson(Map<String, dynamic> json) {
//     return StudentAttenance(
//       date: json['attendanceDate'],
//       sessionsVariant:  List<sessionVariant>.from(
//           json["attendanceDetails"].map((x) => sessionVariant.fromJson(x))),
//     );
//   }
//   factory StudentAttenance.empty() {
//     return StudentAttenance(
//       date: '',
//       sessionsVariant: null,
//     );
//   }
// }

// class sessionVariant {
//   int? session;
//   int? status;

//   sessionVariant({this.session, this.status});

//   factory sessionVariant.fromJson(Map<String, dynamic> json) {
//     return sessionVariant(
//       session: json['session'],
//       status: json['status'],
//     );
//   }
// }

// class Monthdata {
//   final List<StudentAttenance> sessions;

//   const Monthdata(this.sessions);

//   factory Monthdata.fromMap(Map<String, dynamic> monthsData) {
//     return const Monthdata([]);
//   }
// }

// To parse this JSON data, do
//
//     final attendance = attendanceFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Attendance attendanceFromMap(String str) =>
    Attendance.fromMap(json.decode(str));

String attendanceToMap(Attendance data) => json.encode(data.toMap());

class Attendance {
  Attendance({
    required this.data,
  });

  final List<Datum> data;

  factory Attendance.fromMap(List json) => Attendance(
        data: List<Datum>.from(json.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.attendanceDate,
    required this.forenoon,
    required this.afternoon,
  });

  final DateTime attendanceDate;
  final Noon forenoon;
  final Noon afternoon;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        attendanceDate: DateTime.parse(json["attendanceDate"]),
        forenoon: Noon.fromMap(json["forenoon"]),
        afternoon: Noon.fromMap(json["afternoon"]),
      );

  Map<String, dynamic> toMap() => {
        "attendanceDate":
            "${attendanceDate.year.toString().padLeft(4, '0')}-${attendanceDate.month.toString().padLeft(2, '0')}-${attendanceDate.day.toString().padLeft(2, '0')}",
        "forenoon": forenoon.toMap(),
        "afternoon": afternoon.toMap(),
      };
}

class Noon {
  Noon({
    required this.session,
    required this.status,
    required this.reason,
  });

  final int session;
  final int status;
  final String reason;

  factory Noon.fromMap(Map<String, dynamic> json) => Noon(
        session: json["session"],
        status: json["status"],
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "session": session,
        "status": status,
        "reason": reason,
      };
}

