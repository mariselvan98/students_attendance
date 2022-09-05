// To create a API model using https://app.quicktype.io/
import 'dart:convert';

Attendance attendanceFromMap(String str) =>
    Attendance.fromMap(json.decode(str)); // decode our json data

String attendanceToMap(Attendance data) =>
    json.encode(data.toMap()); // and convert to object

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
    required this.attendanceDetails,
  });

  final DateTime attendanceDate;
  final List<AttendanceDetail> attendanceDetails;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        attendanceDate: DateTime.parse(json["attendanceDate"]),
        attendanceDetails: List<AttendanceDetail>.from(
            json["attendanceDetails"].map((x) => AttendanceDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "attendanceDate":
            "${attendanceDate.year.toString().padLeft(4, '0')}-${attendanceDate.month.toString().padLeft(2, '0')}-${attendanceDate.day.toString().padLeft(2, '0')}",
        "attendanceDetails":
            List<dynamic>.from(attendanceDetails.map((x) => x.toMap())),
      };
}

class AttendanceDetail {
  AttendanceDetail({
    required this.session,
    required this.status,
    required this.reason,
  });

  final int session;
  final int status;
  final String reason;

  factory AttendanceDetail.fromMap(Map<String, dynamic> json) =>
      AttendanceDetail(
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
