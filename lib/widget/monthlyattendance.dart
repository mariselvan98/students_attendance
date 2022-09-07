// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

// import 'package:adaptive_date_picker/adaptive_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:parent3i_app_project/module/ParentViews/Attendence/attendancefunction.dart';
// import 'package:parent3i_app_project/module/ParentViews/Attendence/attendanceprofile.dart';
// import 'package:parent3i_app_project/module/ParentViews/Attendence/attendancestyle.dart';

import '../models/attendance_model.dart';
import '../utils/response.dart';
import 'style.dart';

class MonthlyAttendance extends StatefulWidget {
  const MonthlyAttendance({Key? key}) : super(key: key);

  @override
  _MonthlyAttendanceState createState() => _MonthlyAttendanceState();
}

class _MonthlyAttendanceState extends State<MonthlyAttendance> {
  var completedday;
  var starttime;
  var comp = [];
  var selectedmonth;
  var convertdate1 = [];
  var convertdate;
  var currentdate;
  var selectedindexselectedday;
  var current;
  var today;
  var date;
  var todayday;
  var tday;
  var vis = [];
  var overridelist = [];
  var upcoming = [];
  var requested = [];
  var pickdate;

  var heightcal;
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<String> yearss = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];
  bool loading = true;
  var selectedDATE = "";
  var day = [];
  var daybool = [];
  var dates = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  var days;
  int from = 2000;
  int to = 2100;

  List req = [
    {"Month": "August", "Year": "2022"}
  ];
  List attendanceData = Response().attendanceData;
  late Attendance attendance = Attendance.fromMap(attendanceData);

  fornoonColorChange(int i) {
    if (day[i] != "") {
      for (var j = 0; j < attendance.data.length; j++) {
        if (attendance.data[j].attendanceDate.day == day[i]) {
          if (attendance.data[j].forenoon.status == 1) {
            return Color(0xffe1f69a);
          } else {
            return Color(0xffffd5e6);
          }
        }
      }
    } else {
      return Color(0xffffffff);
    }
  }

  afternoonColorChange(int i) {
    if (day[i] != "") {
      for (var j = 0; j < attendance.data.length; j++) {
        if (attendance.data[j].attendanceDate.day == day[i]) {
          if (attendance.data[j].afternoon.status == 1) {
            return Color(0xffe1f69a);
          } else {
            return Color(0xffffd5e6);
          }
        }
      }
    } else {
      return Color(0xffffffff);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    today = DateTime.now();

    selectedindexselectedday = today.day;
    selectedDATE = Jiffy(today, "yyyy-MM-dd hh:mm:ss").format('dd MMMM EEEE');

    currentdate = Jiffy(today, "yyyy-MM-ddThh:mm:ssZ").format("yyyy-MM-dd");
    currentdate = Jiffy(currentdate, "yyyy-MM-dd").format("yyyy,MM,dd");
    current = DateTime(
        int.parse(
            currentdate[0] + currentdate[1] + currentdate[2] + currentdate[3]),
        int.parse(currentdate[5] + currentdate[6]),
        int.parse(currentdate[8] + currentdate[9]));

    current = DateTime(current.year, current.month, current.day);
    days = DateTime(current.year, current.month + 1, 0).day;
    print('ffffffffff $days');
    for (var i = 0; i < days; i++) {
      setState(() {
        day.add(i + 1);
      });
    }
    for (var i = 1; i < 7 + 1; i++) {
      // if (i != 1) {
      if (DateTime(today.year, today.month, 1).weekday == i &&
          DateTime(today.year, today.month, 1).weekday != 1) {
        print(DateTime(today.year, today.month, 1).weekday);
        print(i);
        for (var y = 0; y < i - 1; y++) {
          setState(() {
            day.insert(y, '');
          });
        }
        // }
      }
    }
  }

  var caldate;
  var mydate;

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          // Attendanceprofile(),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                        '${Jiffy(today.month.toString(), 'MM').format('MMMM').toUpperCase()} ${today.year}',
                        style: month),
                  ).onTap(() {
                    if (from != null && to != null) {
                      var start = from;
                      var end = to;
                      if (int.parse(start.toString()) <
                          int.parse(end.toString())) {
                        for (var i = start; i <= end; i++) {
                          // Generateyears.add(i.toString());
                        }
                      } else {
                        for (var i = 1990; i <= 2050; i++) {
                          // Generateyears.add(i.toString());
                        }
                      }
                    } else if (from != null && to == null) {
                      var start = from;

                      for (var i = start; i <= 2050; i++) {
                        // Generateyears.add(i.toString());
                      }
                    } else {
                      for (var i = 1990; i <= 2050; i++) {
                        // Generateyears.add(i.toString());
                      }
                    }
                    _showCustomPicker();
                    // WidgetsBinding.instance.addPostFrameCallback((_){

                    // });
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          var changed =
                              DateTime(today.year, today.month - 1, today.day);
                          days =
                              DateTime(changed.year, changed.month + 1, 0).day;
                          for (var i = 0; i < months.length; i++) {}
                          setState(() {
                            today = DateTime(
                                changed.year, changed.month, changed.day);
                            mydate = "${today.month}-${today.year}";
                          });
                          setState(() {
                            day = [];
                          });
                          for (var i = 0; i < days; i++) {
                            setState(() {
                              day.add(i + 1);
                            });
                          }
                          for (var i = 1; i < 7 + 1; i++) {
                            // if (i != 1) {
                            if (DateTime(today.year, today.month, 1).weekday ==
                                    i &&
                                DateTime(today.year, today.month, 1).weekday !=
                                    1) {
                              print(
                                  DateTime(today.year, today.month, 1).weekday);
                              print(i);
                              for (var y = 0; y < i - 1; y++) {
                                setState(() {
                                  day.insert(y, '');
                                });
                              }
                              // }
                            }
                          }

                          // quick();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 16,
                          ),
                          child: Icon(Icons.arrow_back),
                          // child: Image(
                          //   image: AssetImage('assets/back.png'),
                          //   fit: BoxFit.fill,
                          //   height: 13,
                          //   width: 7,
                          // )
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          var changed =
                              DateTime(today.year, today.month + 1, today.day);
                          days =
                              DateTime(changed.year, changed.month + 1, 0).day;
                          for (var i = 0; i < months.length; i++) {}
                          setState(() {
                            today = DateTime(
                                changed.year, changed.month, changed.day);
                            mydate = "${today.month}-${today.year}";
                          });
                          setState(() {
                            day = [];
                          });
                          for (var i = 0; i < days; i++) {
                            setState(() {
                              day.add(i + 1);
                            });
                          }
                          for (var i = 1; i < 7 + 1; i++) {
                            // if (i != 1) {
                            if (DateTime(today.year, today.month, 1).weekday ==
                                    i &&
                                DateTime(today.year, today.month, 1).weekday !=
                                    1) {
                              print(
                                  DateTime(today.year, today.month, 1).weekday);
                              print(i);
                              for (var y = 0; y < i - 1; y++) {
                                setState(() {
                                  day.insert(y, '');
                                });
                              }
                              // }
                            }
                          }

                          // quick();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 16, left: 9),
                          child: Icon(Icons.arrow_right),
                          // child: Image(
                          //   image: AssetImage('assets/arrowfront.png'),
                          //   fit: BoxFit.fill,
                          //   height: 13,
                          //   width: 7,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text('MON', style: weekdays),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 12, left: 0),
                    child: Text('TUE', style: weekdays),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 4),
                    child: Text('WED', style: weekdays),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 21,
                      left: 4,
                    ),
                    child: Text('THU', style: weekdays),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15, left: 0),
                    child: Text(
                      'FRI',
                      style: weekdays,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 4,
                      right: 15,
                    ),
                    child: Text('SAT', style: weekdays),
                  ),
                  Container(
                    margin: const EdgeInsets.only(),
                    child: Text('SUN', style: weekdays),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 16,
                right: 16,
              ),
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(day.length, (index) {
                  return Stack(children: [
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            color: fornoonColorChange(index),
                            // color: day[index] == ""
                            //     ? Colors.white
                            //     : day[index] == 5
                            //         ? Color(0xffffd5e6)
                            //         : day[index] == 4
                            //             ? Color(0xffe1f69a)
                            //             : day[index] == 1
                            //                 ? Color(0xffffd5e6)
                            //                 : day[index] == 6
                            //                     ? Color(0xffe1f69a)
                            //                     : Color(0xfff9f9f9),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: radiusCircular(4)),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            color: afternoonColorChange(index),
                            // color: day[index] == ""
                            //     ? Colors.white
                            //     : day[index] == 5
                            //         ? Color(0xffffd5e6)
                            //         : day[index] == 4
                            //             ? Color(0xffe1f69a)
                            //             : day[index] == 1
                            //                 ? Color(0xffe1f69a)
                            //                 : Color(0xfff9f9f9),
                            borderRadius: BorderRadius.only(
                              bottomLeft: radiusCircular(4),
                              bottomRight: radiusCircular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text('${day[index]}', style: nos),
                      ),
                    ),
                  ]);
                }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: colorinidiP,
                          height: 16,
                          width: 16,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        'Present',
                        style: present,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 24),
                          decoration: colorinidiA,
                          height: 16,
                          width: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            'Absent',
                            style: present,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Reason',
                      style: resontitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        Text(
                          '5 July 2022',
                          style: resondate,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Text(
                            'Sick Leave',
                            style: reason,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ])))
        ],
      ),
    )));
  }

  void _showCustomPicker() {
    // Picker(
    //   height: 192,
    //   backgroundColor: Colors.white,
    //   itemExtent: 40,
    //   textScaleFactor: 0,
    //   PassValues: req,
    //   squeeze: 1,
    //   builderHeader: (_)=> const SizedBox.shrink(),

    //   selectionOverlay: Container(
    //     padding: const EdgeInsets.all(5),
    //     decoration: const BoxDecoration(
    //       border: Border.symmetric(
    //         horizontal: BorderSide(
    //           color: Colors.black12,
    //           width: 1.0,
    //         ),
    //       ),
    //     ),
    //   ),
    //   onchanged: (req) {
    //     print("the req is : $req");
    //   },
    //   adapter: PickerDataAdapter(
    //     data: [
    //       for (int i = 0; i < months.length; i++)
    //         PickerItem(
    //           text: Center(
    //             child: Text(
    //               months[i],
    //               textAlign: TextAlign.right,
    //             ),
    //           ),
    //           value: i,
    //           children: [
    //             for (int i = 0; i < years.length; i++)
    //               PickerItem(
    //                   text: Center(
    //                     child: Text(
    //                       years[i],
    //                       textAlign: TextAlign.left,
    //                     ),
    //                   ),
    //                   value: i),
    //           ],
    //         ),
    //     ],

    //   ),

    // ).showModal(context);
  }
}
