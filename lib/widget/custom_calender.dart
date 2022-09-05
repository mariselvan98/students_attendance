import 'package:flutter/material.dart';
import '../models/attendance_model.dart';
import '../utils/response.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({
    super.key,
  });

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  List attendanceData = Response().attendanceData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: GridView.builder(
          itemCount: 30,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7),
          itemBuilder: ((context, index) {
            Attendance attendance = Attendance.fromMap(attendanceData);

            return Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  Container(
                    // 1st we chect the attendanceData length if it is true we do another condition
                    color: index < attendance.data.length
                        // the another condition is check 1st season status
                        ? attendance.data[index].attendanceDetails[0].status ==
                                1
                            // If the status is ONE we add the color green otherwise the color is red
                            ? Colors.green
                            : Colors.red
                        : Colors.grey,
                    height: 30,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: index + 1 < attendance.data.length + 1
                                ? attendance.data[index].attendanceDate.day ==
                                        index + 1
                                    ? Colors.white
                                    : Colors.black
                                : Colors.black),
                      ),
                    ),
                    // width: 40,
                  ),
                  Container(
                    color: index < attendance.data.length
                        ? attendance.data[index].attendanceDetails[1].status ==
                                1
                            ? Colors.green
                            : Colors.red
                        : Colors.grey,
                    height: 28,
                    // width: 40,
                  )
                ],
              ),
            );
          })),
    );
  }
}
