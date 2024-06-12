import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usc_technician/DashBoard/Home/Tasks/taskDetails.dart';

import '../home_page.dart';

bool fromTask = false;

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Map<String, dynamic>> activeBookingDataList = [
    {
      'product': "Refrigerator",
      'code': "#571224",
      'qar1': 49,
      'qar2': 197,
      'zone': "Mar 23, 2024 10:00 AM",
      'time': "45 min",
      'status': "Accepted",
    },
    {
      'product': "Water Chillers",
      'code': "#571225",
      'qar1': 59,
      'qar2': 207,
      'zone': "Mar 24, 2024 11:00 AM",
      'time': "50 min",
      'status': "In process",
    },
  ];
  

  bool isOnGoing = true;
  bool isCompleted = false;
  bool isCancelled = false;

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                height: mQuery.size.height*0.053,),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                    ),
                    SizedBox(width: mQuery.size.width * 0.033),
                    Text(
                      "Tasks",
                      style: TextStyle(fontSize: 24, fontFamily: 'RobotoBold'),
                    ),
                    Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/images/profile_images/circularSearch.svg")
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
              height: mQuery.size.height * 0.02),

          Container(
            color: Colors.white,
            height: mQuery.size.height*0.032,
            child: Divider(
              color: Color(0xffDADADA),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height*0.055,
                    margin : EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.045
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width*0.02
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF1F1F1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap : ()
                          {
                            setState(() {
                              isOnGoing = true;
                              isCompleted = false;
                              isCancelled = false;
                            });
                          },
                          child: Container(
                            width: mQuery.size.width*0.25,
                            height: mQuery.size.height*0.04,
                            decoration: BoxDecoration(
                                color: isOnGoing ? Colors.black : Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("On going",style: TextStyle(
                                  color: isOnGoing ? Colors.white : Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'RobotoBold'
                              ),),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              isOnGoing = false;
                              isCompleted = true;
                              isCancelled = false;
                            });
                          },
                          child: Container(
                            width: mQuery.size.width*0.25,
                            height: mQuery.size.height*0.04,
                            decoration: BoxDecoration(
                                color: isCompleted ? Colors.black : Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Completed",style: TextStyle(
                                  color: isCompleted ? Colors.white : Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'RobotoBold'
                              ),),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              isOnGoing = false;
                              isCompleted = false;
                              isCancelled = true;
                            });
                          },
                          child: Container(
                            width: mQuery.size.width*0.25,
                            height: mQuery.size.height*0.04,
                            decoration: BoxDecoration(
                                color: isCancelled ? Colors.black : Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Cancelled",style: TextStyle(
                                  color: isCancelled ? Colors.white : Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'RobotoBold'
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: mQuery.size.height*0.045,),
                  if(isOnGoing)
                    onGoingContainerWidgets(context)
                  else if(isCompleted)
                    completedContainerWidgets(context)
                  else
                    cancelledContainerWidgets(context),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget onGoingContainerWidgets(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mQuery.size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
        child: Column(
          children: yourDataList.asMap().entries.map((entry) {
            var index = entry.key;
            var data = entry.value;

            Color statusTextColor = Colors.white; // Default text color
            if (data['status'] == 'Assigned') {
              statusTextColor = Color(0xffC62B30); // Change text color for "Assigned" status
            }

            return GestureDetector(
              onTap: () {
                setState(() {
                  fromTask = !fromTask;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TaskDetails(taskTitle: data['title']);
                      },
                    ),
                  );
                });

              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: mQuery.size.height * 0.023),
                padding: EdgeInsets.only(
                  top: mQuery.size.height * 0.016,
                  bottom: mQuery.size.height * 0.023,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                      child: Row(
                        children: [
                          SvgPicture.asset(data['imagePath'] ?? ""),
                          SizedBox(width: mQuery.size.width * 0.023),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title'] ?? "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'RobotoBold',
                                ),
                              ),
                              Text(
                                data['id'] ?? "",
                                style: TextStyle(
                                  color: Color(0xff6F767E),
                                  fontSize: 10,
                                  fontFamily: 'RobotoMedium',
                                ),
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                data['price'] ?? "",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'RobotoBold',
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: mQuery.size.height * 0.035,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: mQuery.size.width * 0.01,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF5F6F7),
                                      border: Border.all(
                                        color: Color(0xffDCDFE3),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(data['clockImagePath'] ?? ""),
                                        SizedBox(width: mQuery.size.width * 0.01),
                                        Text(
                                          data['time'] ?? "",
                                          style: TextStyle(
                                            color: Color(0xff7C858F),
                                            fontSize: 12,
                                            fontFamily: 'RobotoMedium',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: mQuery.size.width * 0.01),
                                  Container(
                                    height: mQuery.size.height * 0.035,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: mQuery.size.width * 0.03,
                                    ),
                                    color: data['statusColor'] ?? Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        data['status'] ?? "",
                                        style: TextStyle(
                                          color: statusTextColor,
                                          fontSize: 12,
                                          fontFamily: 'RobotoMedium',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.016),
                    DottedLine(
                      dashColor: Color(0xffEDEFF1),
                    ),
                    SizedBox(height: mQuery.size.height * 0.016),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Show "13 hours left" only for the second entry
                              if (index == 1)
                                Text(
                                  "13 hours left",
                                  style: TextStyle(
                                    color: Color(0xffEF4E4E),
                                    fontSize: 12,
                                    fontFamily: 'RobotoMedium',
                                  ),
                                )
                              else
                                Text(
                                  data['timeLeft'] ?? "",
                                  style: TextStyle(
                                    color: Color(0xffEF4E4E),
                                    fontSize: 12,
                                    fontFamily: 'RobotoMedium',
                                  ),
                                ),
                              SizedBox(height: mQuery.size.height * 0.016),
                              Row(
                                children: [
                                  SvgPicture.asset(data['locationImagePath'] ?? ""),
                                  SizedBox(width: mQuery.size.width * 0.023),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['location'] ?? "",
                                        style: TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 13,
                                          fontFamily: 'RobotoMedium',
                                        ),
                                      ),
                                      Text(
                                        data['distance'] ?? "",
                                        style: TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 13,
                                          fontFamily: 'RobotoMedium',
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          // Render the Accept button only for entries other than the second one
                          if (index != 1)
                            Column(
                              children: [
                                Container(
                                  width: mQuery.size.width * 0.23,
                                  height: mQuery.size.height * 0.045,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      data['acceptButtonText'] ?? "",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'RobotoBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }


  Widget completedContainerWidgets(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mQuery.size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
        child: Column(
          children: yourDataList.asMap().entries.map((entry) {
            var index = entry.key;
            var data = entry.value;

            Color statusTextColor = Colors.white; // Default text color
            if (data['status'] == 'Assigned') {
              statusTextColor = Color(0xffC62B30); // Change text color for "Assigned" status
            }

            return GestureDetector(
              onTap: () {
                setState(() {
                  fromTask = !fromTask;

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return TaskDetails(taskTitle: data['title']);
                  //     },
                  //   ),
                  // );
                });

              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: mQuery.size.height * 0.023),
                padding: EdgeInsets.only(
                  top: mQuery.size.height * 0.016,
                  bottom: mQuery.size.height * 0.023,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                      child: Row(
                        children: [
                          SvgPicture.asset(data['imagePath'] ?? ""),
                          SizedBox(width: mQuery.size.width * 0.023),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title'] ?? "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'RobotoBold',
                                ),
                              ),
                              Text(
                                data['id'] ?? "",
                                style: TextStyle(
                                  color: Color(0xff6F767E),
                                  fontSize: 10,
                                  fontFamily: 'RobotoMedium',
                                ),
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                data['price'] ?? "",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'RobotoBold',
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: mQuery.size.height * 0.035,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: mQuery.size.width * 0.01,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF5F6F7),
                                      border: Border.all(
                                        color: Color(0xffDCDFE3),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(data['clockImagePath'] ?? ""),
                                        SizedBox(width: mQuery.size.width * 0.01),
                                        Text(
                                          data['time'] ?? "",
                                          style: TextStyle(
                                            color: Color(0xff7C858F),
                                            fontSize: 12,
                                            fontFamily: 'RobotoMedium',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: mQuery.size.width * 0.01),
                                  Container(
                                    height: mQuery.size.height * 0.035,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: mQuery.size.width * 0.03,
                                    ),
                                    color: Color(0xffF5D9FF),
                                    child: Center(
                                      child: Text("Completed",
                                        style: TextStyle(
                                          color: Color(0xffC61BFF),
                                          fontSize: 12,
                                          fontFamily: 'RobotoMedium',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.016),
                    DottedLine(
                      dashColor: Color(0xffEDEFF1),
                    ),
                    SizedBox(height: mQuery.size.height * 0.016),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Show "13 hours left" only for the second entry
                              if (index == 1)
                                Text(
                                  "13 hours left",
                                  style: TextStyle(
                                    color: Color(0xffEF4E4E),
                                    fontSize: 12,
                                    fontFamily: 'RobotoMedium',
                                  ),
                                )
                              else
                                Text(
                                  data['timeLeft'] ?? "",
                                  style: TextStyle(
                                    color: Color(0xffEF4E4E),
                                    fontSize: 12,
                                    fontFamily: 'RobotoMedium',
                                  ),
                                ),
                              SizedBox(height: mQuery.size.height * 0.016),
                              Row(
                                children: [
                                  SvgPicture.asset(data['locationImagePath'] ?? ""),
                                  SizedBox(width: mQuery.size.width * 0.023),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['location'] ?? "",
                                        style: TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 13,
                                          fontFamily: 'RobotoMedium',
                                        ),
                                      ),
                                      Text(
                                        data['distance'] ?? "",
                                        style: TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 13,
                                          fontFamily: 'RobotoMedium',
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          // Render the Accept button only for entries other than the second one
                          if (index != 1)
                            Column(
                              children: [
                                Container(
                                  width: mQuery.size.width * 0.23,
                                  height: mQuery.size.height * 0.045,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      data['acceptButtonText'] ?? "",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'RobotoBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }




  Widget cancelledContainerWidgets(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(height: mQuery.size.height*0.3,),
        Center(
          child: Text("Cancelled Tasks here",style: TextStyle(
              fontFamily: 'RobotoBold'
          ),),
        ),
      ],
    );
  }
}


// SizedBox(height: mQuery.size.height*0.053,),