import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:usc_technician/DashBoard/Home/Tasks/taskDetails.dart';
import 'package:usc_technician/Profile/myprofile.dart';

var location = "New York City";

String fromDP = "";

List<Map<String, dynamic>> yourDataList = [
  {
    'imagePath': "assets/images/dashboard_images/highFive.svg",
    'title': "Water Chillers",
    'id': "#571224",
    'price': "QAR 49",
    'clockImagePath': "assets/images/dashboard_images/home_images/miniClock.svg",
    'time': "3h",
    'statusColor': Color(0xffFBBE4A),
    'status': "In Progress",
    'timeLeft': "16 hours left",
    'locationImagePath': "assets/images/dashboard_images/home_images/blackLoctaion.svg",
    'location': "4517 Washington Ave.",
    'distance': "1.3 Km",
    'acceptButtonText': "Accept",
    'declineButtonText': "Decline",
  },
  {
    'imagePath': "assets/images/dashboard_images/highFive.svg",
    'title': "Refrigerator",
    'id': "#571224",
    'price': "QAR 49",
    'clockImagePath': "assets/images/dashboard_images/home_images/miniClock.svg",
    'time': "3h",
    'statusColor': Color(0xffFFD7D7),
    'status': "Assigned",
    'timeLeft': "16 hours left",
    'locationImagePath': "assets/images/dashboard_images/home_images/blackLoctaion.svg",
    'location': "4517 Washington Ave.",
    'distance': "1.3 Km",
    'acceptButtonText': "Accept",
    'declineButtonText': "Decline",
  },
  {
    'imagePath': "assets/images/dashboard_images/highFive.svg",
    'title': "Delivery \nPackages",
    'id': "#571224",
    'price': "QAR 49",
    'clockImagePath': "assets/images/dashboard_images/home_images/miniClock.svg",
    'time': "3h",
    'statusColor': Color(0xffFFD7D7),
    'status': "Assigned",
    'timeLeft': "16 hours left",
    'locationImagePath': "assets/images/dashboard_images/home_images/blackLoctaion.svg",
    'location': "4517 Washington Ave.",
    'distance': "1.3 Km",
    'acceptButtonText': "Accept",
    'declineButtonText': "Decline",
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = true;

  List<Map<String, dynamic>> taskData = [
    {"taskName": "New Task", "taskNo": "5"},
  ];

  List<Map<String, dynamic>> taskData2 = [
    {"taskName": "Previous Task", "taskNo": "20"},
  ];

  List<Map<String, dynamic>> taskData3 = [
    {"taskName": "Previous Task", "taskNo": "20"},
  ];

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mQuery.size.height * 0.055),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: mQuery.size.width * 0.045,
              right: mQuery.size.width * 0.045,
              bottom: mQuery.size.height * 0.023,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/dashboard_images/home_images/location.png"),
                    SizedBox(width: mQuery.size.width * 0.023),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Location",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'RobotoBold',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          location,
                          style: TextStyle(
                            fontFamily: 'RobotoMedium',
                            fontSize: 9,
                            color: Color(0xff818085),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/images/dashboard_images/home_images/filledBell.svg"),
                    SizedBox(width: mQuery.size.width * 0.032),
                    ProfilePicture(
                      name: "",
                      fontsize: 10,
                      radius: 14,
                      img:
                      "https://s3-alpha-sig.figma.com/img/6f83/a63a/55aca232de7a53f95b7101aa1e8375a0?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=o80YuOuEh5Tn0vgBpSqBQr0OSBRXgPpWhlRAwx8a~oFDBpWP5vJgSVHuMPzu0NZM29ysHc03MS0TYAEYDvuJ0Z0Ec-OME9rdCzlJdzhftwJcb~7x3-xNmsKizcBbARYuh4OfTE74xAHeK9L3dS81S8VVK2AtrGSYcOjhaMgHtXGy0MwvU1Iba2SQ2w-zvNJNKZ-~fBG~iXmXcuDIscx24olgawPZhLfrjdjwJA7ZC4OI2~xYurH3GIKP7e~sHRP84JkfGMtpPqcEAz95c--"
                          "NCNWjmzN5yCJIIP6ApT0JDGb55apH-Vk2myAQFzoZfPnNr0vw3zLFJQZ18W62nOq0MA__",
                    ),
                  ],
                ),
                SizedBox(height: mQuery.size.height * 0.016),
                Row(
                  children: [
                    Text(
                      isActive ? "Active" : "InActive",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'RobotoMedium',
                        color: Colors.black,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: isActive,
                        onChanged: (value) {
                          setState(() {
                            isActive = value;
                          });
                        },
                        activeTrackColor: Colors.black,
                        thumbColor: MaterialStateProperty.all(Colors.white),
                        inactiveTrackColor: Color(0xff777777),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mQuery.size.height * 0.016),
                Row(
                  children: [
                    Container(
                      width: mQuery.size.width * 0.32,
                      height: mQuery.size.height * 0.1,
                      padding: EdgeInsets.only(left: mQuery.size.width * 0.045),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskData[0]["taskName"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.01),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/dashboard_images/home_images/circleClock.svg"),
                              SizedBox(width: mQuery.size.width * 0.023),
                              Text(
                                taskData[0]["taskNo"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: 'RobotoBold',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: mQuery.size.width * 0.045),
                    Container(
                      width: mQuery.size.width * 0.32,
                      height: mQuery.size.height * 0.1,
                      padding: EdgeInsets.only(left: mQuery.size.width * 0.045),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskData2[0]["taskName"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.01),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/dashboard_images/home_images/circleClock.svg"),
                              SizedBox(width: mQuery.size.width * 0.023),
                              Text(
                                taskData2[0]["taskNo"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: 'RobotoBold',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mQuery.size.height * 0.016),
                Text(
                  "Tasks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'RobotoBold',
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.023),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                child: Column(
                  children: yourDataList.map((data) {
                    Color statusTextColor = Colors.white; // Default text color
                    if (data['status'] == 'Assigned') {
                      statusTextColor = Color(0xffC62B30); // Change text color for "Assigned" status
                    }
                    return GestureDetector(
                      onTap: () {
                        if (data['title'] == 'Delivery \nPackages') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                fromDP = "DeliveryPackage";
                                return TaskDetails(taskTitle: data['title']);
                              },
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetails(taskTitle: data['title']),
                            ),
                          );
                        }
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
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    data['clockImagePath'] ?? ""),
                                                SizedBox(
                                                    width: mQuery.size.width *
                                                        0.01),
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
                                          SizedBox(
                                              width:
                                              mQuery.size.width * 0.01),
                                          Container(
                                            height: mQuery.size.height * 0.035,
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                              mQuery.size.width * 0.03,
                                            ),
                                            color: data['statusColor'] ??
                                                Colors.transparent,
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
                            SizedBox(
                                height: mQuery.size.height * 0.016),
                            DottedLine(
                              dashColor: Color(0xffEDEFF1),
                            ),
                            SizedBox(
                                height: mQuery.size.height * 0.016),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mQuery.size.width * 0.03),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['timeLeft'] ?? "",
                                        style: TextStyle(
                                          color: Color(0xffEF4E4E),
                                          fontSize: 12,
                                          fontFamily: 'RobotoMedium',
                                        ),
                                      ),
                                      SizedBox(
                                          height: mQuery.size.height * 0.016),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              data['locationImagePath'] ?? ""),
                                          SizedBox(
                                              width: mQuery.size.width *
                                                  0.023),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                  Column(
                                    children: [
                                      Container(
                                        width: mQuery.size.width * 0.23,
                                        height: mQuery.size.height * 0.045,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Color(0xff247200),
                                        ),
                                        child: Center(
                                          child: Text(
                                            data['acceptButtonText'] ?? "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'RobotoBold',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: mQuery.size.height * 0.01),
                                      Container(
                                        width: mQuery.size.width * 0.23,
                                        height: mQuery.size.height * 0.045,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Color(0xffB21515),
                                        ),
                                        child: Center(
                                          child: Text(
                                            data['declineButtonText'] ?? "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'RobotoBold',
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
