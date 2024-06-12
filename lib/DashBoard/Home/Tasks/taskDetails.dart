import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/extends/colors/constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:pinput/pinput.dart';
import 'package:usc_technician/DashBoard/BottomNav.dart';
import 'package:usc_technician/DashBoard/Home/Tasks/tasks.dart';
import 'package:usc_technician/DashBoard/Home/home_page.dart';
import '../../../AUTH/login_page.dart';
import '../../../Global/global_var.dart';

String generateOTP() {
  Random random = Random();
  return (1000 + random.nextInt(9000)).toString();
}

String generateOTP2() {
  Random random = Random();
  return (1000 + random.nextInt(9000)).toString();
}



bool showError2 = false;  // for pickup
bool showError3 = false;  // for delivery

bool afterOTPTap = false; // it track that we tap the "Verify OTP" container
bool afterOntheDelivery = false; // it will after tap the
// row and then we have OTP
// container

String mobileNumber2 = "6789653478";

String mobileNumber3 = "9988776543";

class TaskDetails extends StatefulWidget {
  final String taskTitle;

  const TaskDetails({Key? key, required this.taskTitle}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool isAcceptTask = false;

  bool isUpdateTask = false;

  bool isFromCompleted = false;



  var initialRating = 4;

  TextEditingController feedbackController = TextEditingController();

  Map<String, dynamic> userData = {
    'username': 'Demi Hickman',
    'address': '4517 Washington Ave.\nManchester, Kentucky 39495',
    'profileImage': 'https://s3-alpha-sig.figma.com/img/6f83/a63a/55aca232de7a53f95b7101aa1e8375a0?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=o80YuOuEh5Tn0vgBpSqBQr0OSBRXgPpWhlRAwx8a~oFDBpWP5vJgSVHuMPzu0NZM29ysHc03MS0TYAEYDvuJ0Z0Ec-OME9rdCzlJdzhftwJcb~7x3-xNmsKizcBbARYuh4OfTE74xAHeK9L3dS81S8VVK2AtrGSYcOjhaMgHtXGy0MwvU1Iba2SQ2w-zvNJNKZ-~fBG~iXmXcuDIscx24olgawPZhLfrjdjwJA7ZC4OI2~xYurH3GIKP7e~sHRP84JkfGMtpPqcEAz95c--'
        "NCNWjmzN5yCJIIP6ApT0JDGb55apH-Vk2myAQFzoZfPnNr0vw3zLFJQZ18W62nOq0MA__",
  };

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: mQuery.size.height * 0.06),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return HomePage();
                          }));
                        },
                        child: SvgPicture.asset(
                            "assets/images/dashboard_images/home_images/circleBack.svg"),
                      ),
                      SizedBox(width: mQuery.size.width * 0.045),
                      Text(
                        "Task Details",
                        style: TextStyle(
                            fontSize: 24, color: Colors.black, fontFamily: 'RobotoBold'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
              color: Colors.white,
              height: mQuery.size.height * 0.023),
          SizedBox(height: mQuery.size.height * 0.01),

          fromDP == "DeliveryPackage" ?

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width * 0.045,
                ),
                child: Column(
                  children: [
                    Container(
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
                                SvgPicture.asset("assets/images/dashboard_images/highFive.svg",
                                  width: mQuery.size.width*0.14,
                                ),
                                SizedBox(width: mQuery.size.width * 0.023),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.taskTitle,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'RobotoBold',
                                      ),
                                    ),
                                    Text(
                                      "#571224",
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
                                      "QAR 49",
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
                                              SvgPicture.asset(
                                                  "assets/images/dashboard_images/home_images/miniClock.svg"),
                                              SizedBox(width: mQuery.size.width * 0.01),
                                              Text(
                                                "3h",
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
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isAcceptTask) {
                                                print("Hello");
                                              } else {
                                                acceptTaskPopUp(context);
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: mQuery.size.height * 0.035,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: mQuery.size.width * 0.03,
                                            ),
                                            color: Color(0xffFBBE4A),
                                            child: Center(
                                              child: Text(
                                                "In Progress",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'RobotoMedium',
                                                ),
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
                                    Text(
                                      "16 hours left",
                                      style: TextStyle(
                                        color: Color(0xffEF4E4E),
                                        fontSize: 12,
                                        fontFamily: 'RobotoMedium',
                                      ),
                                    ),
                                    SizedBox(height: mQuery.size.height * 0.016),
                                    Text("Pickup Address",style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'RobotoBold',
                                        color: Colors.black
                                    ),),
                                    SizedBox(height: mQuery.size.height*0.01,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/dashboard_images/home_images/blackLoctaion.svg"),
                                        SizedBox(width: mQuery.size.width * 0.023),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "4517 Washington Ave.",
                                              style: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 13,
                                                fontFamily: 'RobotoMedium',
                                              ),
                                            ),
                                            Text(
                                              "1.3 Km",
                                              style: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 13,
                                                fontFamily: 'RobotoMedium',
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),

                                    SizedBox(height: mQuery.size.height * 0.016),
                                    Text("Delivery Address",style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'RobotoBold',
                                        color: Colors.black
                                    ),),
                                    SizedBox(height: mQuery.size.height*0.01,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/dashboard_images/home_images/blackLoctaion.svg"),
                                        SizedBox(width: mQuery.size.width * 0.023),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "4517 Washington Ave.",
                                              style: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 13,
                                                fontFamily: 'RobotoMedium',
                                              ),
                                            ),
                                            Text(
                                              "2.3 Km",
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.01),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: mQuery.size.height * 0.02,
                        bottom: mQuery.size.height * 0.023,
                        left: mQuery.size.width * 0.034,
                        right: mQuery.size.width * 0.034,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pickup Information",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              color: Color(0xff9BA1A8),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ProfilePicture(
                                        name: "",
                                        fontsize: 10,
                                        radius: 14,
                                        img: userData['profileImage'], // Use the profile image from the map
                                      ),
                                      SizedBox(width: mQuery.size.width * 0.023),
                                      Text(
                                        userData['username'], // Use the username from the map
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'RobotoBold',
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: mQuery.size.height * 0.016),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/dashboard_images/home_images/blackLoctaion.svg",
                                      ),
                                      SizedBox(width: mQuery.size.width * 0.023),
                                      Text(
                                        userData['address'], // Use the address from the map
                                        style: TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 12,
                                          fontFamily: 'RobotoBold',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              // SvgPicture.asset(
                              //   "assets/images/dashboard_images/home_images/callButton.svg",
                              //   width: mQuery.size.width * 0.23,
                              // ),
                            ],
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Container(
                            width: double.infinity,
                            height: 162,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/images/dashboard_images/home_images/tcMapBg.png",
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffD5D5D5),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Text(
                            "View Details",
                            style: TextStyle(
                              fontFamily: 'RobotoMedium',
                              color: Color(0xff094457),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.01),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: mQuery.size.height * 0.02,
                        bottom: mQuery.size.height * 0.023,
                        left: mQuery.size.width * 0.034,
                        right: mQuery.size.width * 0.034,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Information",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              color: Color(0xff9BA1A8),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ProfilePicture(
                                        name: "",
                                        fontsize: 10,
                                        radius: 14,
                                        img: userData['profileImage'], // Use the profile image from the map
                                      ),
                                      SizedBox(width: mQuery.size.width * 0.023),
                                      Text(
                                        userData['username'], // Use the username from the map
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'RobotoBold',
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: mQuery.size.height * 0.016),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/dashboard_images/home_images/blackLoctaion.svg",
                                      ),
                                      SizedBox(width: mQuery.size.width * 0.023),
                                      Text(
                                        userData['address'], // Use the address from the map
                                        style: TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 12,
                                          fontFamily: 'RobotoBold',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              // SvgPicture.asset(
                              //   "assets/images/dashboard_images/home_images/callButton.svg",
                              //   width: mQuery.size.width * 0.23,
                              // ),
                            ],
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Container(
                            width: double.infinity,
                            height: 162,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/images/dashboard_images/home_images/tcMapBg.png",
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffD5D5D5),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Text(
                            "View Details",
                            style: TextStyle(
                              fontFamily: 'RobotoMedium',
                              color: Color(0xff094457),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

              :
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width * 0.045,
                ),
                child: Column(
                  children: [
                    Container(
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
                                SvgPicture.asset("assets/images/dashboard_images/highFive.svg",
                                  width: mQuery.size.width*0.14,
                                ),
                                SizedBox(width: mQuery.size.width * 0.023),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.taskTitle,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'RobotoBold',
                                      ),
                                    ),
                                    Text(
                                      "#571224",
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
                                      "QAR 49",
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
                                              SvgPicture.asset(
                                                  "assets/images/dashboard_images/home_images/miniClock.svg"),
                                              SizedBox(width: mQuery.size.width * 0.01),
                                              Text(
                                                "3h",
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
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isAcceptTask) {
                                                print("Hello");
                                              } else {
                                                acceptTaskPopUp(context);
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: mQuery.size.height * 0.035,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: mQuery.size.width * 0.03,
                                            ),
                                            color: Color(0xffFFD7D7),
                                            child: Center(
                                              child: Text(
                                                isAcceptTask ? "Update Status" : "Accept Task",
                                                style: TextStyle(
                                                  color: Color(0xffC62B30),
                                                  fontSize: 12,
                                                  fontFamily: 'RobotoMedium',
                                                ),
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
                                    Text(
                                      "16 hours left",
                                      style: TextStyle(
                                        color: Color(0xffEF4E4E),
                                        fontSize: 12,
                                        fontFamily: 'RobotoMedium',
                                      ),
                                    ),
                                    SizedBox(height: mQuery.size.height * 0.016),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/dashboard_images/home_images/blackLoctaion.svg"),
                                        SizedBox(width: mQuery.size.width * 0.023),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "4517 Washington Ave.",
                                              style: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 13,
                                                fontFamily: 'RobotoMedium',
                                              ),
                                            ),
                                            Text(
                                              "1.3 Km",
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
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          acceptTaskPopUp(context);

                                          if (isAcceptTask) {
                                            print("Hello");
                                          } else {
                                            acceptTaskPopUp(context);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: mQuery.size.width * 0.23,
                                        height: mQuery.size.height * 0.045,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xff247200),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'RobotoBold',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: mQuery.size.height * 0.01),
                                    GestureDetector(
                                      onTap: ()
                                      {
                                        declineTaskPopUp(context);
                                      },
                                      child: Container(
                                        width: mQuery.size.width * 0.23,
                                        height: mQuery.size.height * 0.045,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xffB21515),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Decline",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'RobotoBold',
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.032),


                    // when navigate from the Completed in bottomsheet
                    isFromCompleted ?
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: mQuery.size.height*0.02
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 7
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mQuery.size.width*0.045
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Task Completeness",style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'RobotoBold'
                                        ),),
                                        Container(
                                          width: mQuery.size.width*0.07,
                                          height: mQuery.size.height*0.045,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle
                                          ),
                                          child: Center(
                                            child: Icon(Icons.check,color: Colors.white,
                                              size: mQuery.size.width*0.045,),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Cleanliness",style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'RobotoBold'
                                        ),),
                                        Container(
                                          width: mQuery.size.width*0.07,
                                          height: mQuery.size.height*0.045,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle
                                          ),
                                          child: Center(
                                            child: Icon(Icons.check,color: Colors.white,
                                              size: mQuery.size.width*0.045,),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Customer Approval",style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'RobotoBold'
                                        ),),
                                        Container(
                                          width: mQuery.size.width*0.07,
                                          height: mQuery.size.height*0.045,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle
                                          ),
                                          child: Center(
                                            child: Icon(Icons.check,color: Colors.white,
                                              size: mQuery.size.width*0.045,),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: Color(0xffEBEEF0),),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: mQuery.size.width*0.045
                                ),
                                child: Text("Work Rating",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'RobotoBold'
                                ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: mQuery.size.height*0.023,),
                        Container(
                          width: double.infinity,
                          height: mQuery.size.height * 0.34,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Color(0xffDADADA)
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Feedback",style: TextStyle(
                                      color: Color(0xff1F2937),
                                      fontSize: 20,
                                      fontFamily: 'RobotoBold'
                                  ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Please rate your experience below",style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'RobotoMedium',
                                      color: Color(0xff4B5563)
                                  ),),
                                ],
                              ),
                              SizedBox(height: mQuery.size.height*0.01,),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mQuery.size.width*0.075
                                ),
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                      unratedColor: Color(0xffDADADA),
                                      initialRating: initialRating.toDouble(),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemSize: mQuery.size.height * 0.045,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Color(0xffFFCB45),
                                      ),
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          initialRating = rating.toInt();
                                        });
                                      },
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text("$initialRating/5 stars",style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff6B7280),
                                        fontFamily: 'RobotoMedium'
                                    ),)
                                  ],
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.023,),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mQuery.size.width*0.06
                                ),
                                child: Text("Additional feedback",style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontSize: 13,
                                    fontFamily: 'RobotoMedium'
                                ),),
                              ),
                              SizedBox(height: mQuery.size.height*0.005,),
                              Container(
                                width: double.infinity,
                                height: mQuery.size.height*0.12,
                                padding: EdgeInsets.symmetric(
                                    horizontal: mQuery.size.width*0.045
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: mQuery.size.width*0.03
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: Color(0xffD1D5DB),
                                    )
                                ),
                                child: TextField(
                                  controller: feedbackController,
                                  cursorColor: Colors.grey,
                                  maxLines: null,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'RobotoMedium',
                                      color: Color(0xff4B5563)
                                  ),
                                  decoration: InputDecoration(
                                      hintText: "My feedback!!",
                                      hintStyle: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'RobotoMedium',
                                          color: Color(0xff4B5563)
                                      ),
                                      border: InputBorder.none
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                        :
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: mQuery.size.height * 0.02,
                        bottom: mQuery.size.height * 0.023,
                        left: mQuery.size.width * 0.034,
                        right: mQuery.size.width * 0.034,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CUSTOMER INFORMATION",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              color: Color(0xff9BA1A8),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ProfilePicture(
                                        name: "",
                                        fontsize: 10,
                                        radius: 14,
                                        img: userData['profileImage'], // Use the profile image from the map
                                      ),
                                      SizedBox(width: mQuery.size.width * 0.023),
                                      Text(
                                        userData['username'], // Use the username from the map
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'RobotoBold',
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: mQuery.size.height * 0.016),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/dashboard_images/home_images/blackLoctaion.svg",
                                      ),
                                      SizedBox(width: mQuery.size.width * 0.023),
                                      Text(
                                        userData['address'], // Use the address from the map
                                        style: TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 12,
                                          fontFamily: 'RobotoBold',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              SvgPicture.asset(
                                "assets/images/dashboard_images/home_images/callButton.svg",
                                width: mQuery.size.width * 0.23,
                              ),
                            ],
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Container(
                            width: double.infinity,
                            height: 162,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/images/dashboard_images/home_images/tcMapBg.png",
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffD5D5D5),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.016),
                          Text(
                            "View Details",
                            style: TextStyle(
                              fontFamily: 'RobotoMedium',
                              color: Color(0xff094457),
                            ),
                          )
                        ],
                      ),
                    ),



                    SizedBox(height: mQuery.size.height * 0.035),

                    isFromCompleted ? SizedBox() :
                    fromTask ?
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status",style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'RobotoBold',
                                fontSize: 17
                            ),),
                            GestureDetector(
                                onTap: ()
                                {
                                  updateTask(context);
                                },
                                child: SvgPicture.asset("assets/images/dashboard_images/home_images/tabler_edit.svg"))
                          ],
                        ),
                        SizedBox(height: mQuery.size.height*0.023,),
                        /// Missing widgets here (not completed)
                        Container(
                          width: double.infinity,
                          height: mQuery.size.height*0.2,
                          color: Colors.yellow,
                        )
                      ],
                    )

                        :
                    isUpdateTask ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status",style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontSize: 17
                        ),),
                        GestureDetector(
                            onTap: ()
                            {
                              updateTask(context);
                            },
                            child: SvgPicture.asset("assets/images/dashboard_images/home_images/tabler_edit.svg"))
                      ],
                    )
                        : Center(
                      child: Text(
                        "Reject",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'RobotoBold',
                            color: Color(0xffCA3939),
                            decorationColor: Color(0xffCA3939),
                            decoration: TextDecoration.underline),
                      ),
                    ) ,

                  ],
                ),
              ),
            ),
          ),







          SizedBox(height: mQuery.size.height * 0.01),
          fromDP == "DeliveryPackage" ?
          GestureDetector(
            onTap: () {
              packageDetailsBottomSheet(context);
            },
            child: Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffD9D9D9),
                  border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isAcceptTask ? SvgPicture.asset("assets/images/dashboard_images/home_images/refreshIcon.svg")
                      : SvgPicture.asset("assets/images/dashboard_images/home_images/acceptIcon.svg"),
                  SizedBox(width: mQuery.size.width * 0.023),
                  Text(
                    (isUpdateTask || fromTask) ? "Update"
                        :
                    isAcceptTask ? "Update Status" : "Accept Task",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'RobotoBold'),
                  )
                ],
              ),
            ),
          )
              :
          GestureDetector(
            onTap: () {
              setState(() {
                if (isAcceptTask) {
                  updateTask(context);
                }
                else if(fromTask)
                {
                  fromTaskupdateTask(context);
                }

                else {
                  setState(() {
                    acceptTaskPopUp(context);
                  });

                }
              });
            },
            child: Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffD9D9D9),
                  border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isAcceptTask ? SvgPicture.asset("assets/images/dashboard_images/home_images/refreshIcon.svg")
                      : SvgPicture.asset("assets/images/dashboard_images/home_images/acceptIcon.svg"),
                  SizedBox(width: mQuery.size.width * 0.023),
                  Text(
                    (isUpdateTask || fromTask) ? "Update"
                        :
                    isAcceptTask ? "Update Status" : "Accept Task",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'RobotoBold'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: mQuery.size.height*0.016,)
        ],
      ),
    );
  }


  // PopUp for show Task
  void acceptTaskPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var mQuery = MediaQuery.of(context);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Container(
                height: mQuery.size.height * 0.65,
                width: mQuery.size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/dashboard_images/home_images/Illustration.svg",
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Take this task?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'RobotoMedium',
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.032,),
                    Center(
                      child: Text(
                        "Service kondensor AC dan tiga",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "kipas angin minim mollit non",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "deserunt ",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium',
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.032,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAcceptTask = true; // Toggle the accept status
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Text(
                            "YES, TAKE THIS TASK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'RobotoBold'
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.023,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                              color: Color(0xff9BA1A8),
                              fontFamily: 'RobotoBold',
                              fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // PopUp for decline Task
  void declineTaskPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var mQuery = MediaQuery.of(context);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Container(
                height: mQuery.size.height * 0.65,
                width: mQuery.size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/dashboard_images/home_images/Illustration.svg",
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Decline this task?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'RobotoMedium',
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.032,),
                    Center(
                      child: Text(
                        "Service kondensor AC dan tiga",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "kipas angin minim mollit non",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "deserunt ",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium',
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.032,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Text(
                            "Are you Decline the Task",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'RobotoBold'
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.023,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                              color: Color(0xff9BA1A8),
                              fontFamily: 'RobotoBold',
                              fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void updateTask(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context)
        {
          return Container(
            width: double.infinity,
            height: mQuery.size.height*0.47,
            padding: EdgeInsets.only(
              right: mQuery.size.width*0.045,
              left: mQuery.size.width*0.045,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: mQuery.size.height*0.032,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Update Task",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'RobotoBold'
                    ),),
                    GestureDetector(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: Colors.black,))
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.023,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Accepted",style: TextStyle(
                        color: Color(0xffFBBE4A),
                        fontSize: 16,
                        fontFamily: 'RobotoMedium'
                    ),),
                    Container(
                      width: mQuery.size.width*0.07,
                      height: mQuery.size.height*0.045,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.check,color: Colors.white,
                          size: mQuery.size.width*0.045,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      isUpdateTask = true;
                      Navigator.pop(context);
                    });

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("In Progress",style: TextStyle(
                          color: Color(0xffFBBE4A),
                          fontSize: 16,
                          fontFamily: 'RobotoMedium'
                      ),),
                      Container(
                        width: mQuery.size.width*0.07,
                        height: mQuery.size.height*0.045,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(Icons.check,color: Colors.white,
                            size: mQuery.size.width*0.045,),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                Text("Rescheduled",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'RobotoMedium'
                ),),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                Text("On the way",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'RobotoMedium'
                ),),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                Text("Completed",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'RobotoMedium'
                ),),
              ],
            ),
          );
        }
    );
  }

  void fromTaskupdateTask(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context)
        {
          return Container(
            width: double.infinity,
            height: mQuery.size.height*0.47,
            padding: EdgeInsets.only(
              right: mQuery.size.width*0.045,
              left: mQuery.size.width*0.045,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: mQuery.size.height*0.032,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Update Task",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'RobotoBold'
                    ),),
                    GestureDetector(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: Colors.black,))
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.023,),
                Text("Open",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'RobotoMedium'
                ),),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                GestureDetector(
                  onTap: ()
                  {
                    // setState(() {
                    //   isUpdateTask = true;
                    //   Navigator.pop(context);
                    // });

                  },
                  child: Text("In Progress",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'RobotoMedium'
                  ),),
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                Text("Pending",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'RobotoMedium'
                ),),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                Text("Reschedule",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'RobotoMedium'
                ),),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      isFromCompleted = true;
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Completed",style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'RobotoMedium'
                      ),),
                      Container(
                        width: mQuery.size.width*0.07,
                        height: mQuery.size.height*0.045,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(Icons.check,color: Colors.white,
                            size: mQuery.size.width*0.045,),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }


  void packageDetailsBottomSheet(BuildContext context)
  {
    var mQuery = MediaQuery.of(context);

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context)
        {
          return Container(
            width: double.infinity,
            height: mQuery.size.height*0.47,
            padding: EdgeInsets.only(
              right: mQuery.size.width*0.045,
              left: mQuery.size.width*0.045,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: mQuery.size.height*0.032,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Package Details",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'RobotoBold'
                    ),),
                    GestureDetector(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: Colors.black,))
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.023,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("In progress",style: TextStyle(
                        color: Color(0xffFBBE4A),
                        fontSize: 16,
                        fontFamily: 'RobotoMedium'
                    ),),
                    Container(
                      width: mQuery.size.width*0.07,
                      height: mQuery.size.height*0.045,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.check,color: Colors.white,
                          size: mQuery.size.width*0.045,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                GestureDetector(
                  onTap: ()
                  {
                    otp2 = generateOTP();

                    afterOTPTap ?
                    _showOTPBottomSheet2(context,enteredMobileNo!,otp) :
                    _showOTPBottomSheet(context, enteredMobileNo!, otp);

                    setState(() {
                      afterOTPTap = !afterOTPTap;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("On the Pickup",style: TextStyle(
                          color: Color(0xffFBBE4A),
                          fontSize: 16,
                          fontFamily: 'RobotoMedium'
                      ),),
                      Container(
                        width: mQuery.size.width*0.07,
                        height: mQuery.size.height*0.045,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(Icons.check,color: Colors.white,
                            size: mQuery.size.width*0.045,),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Picked Up",style: TextStyle(
                        color: afterOTPTap ? Color(0xffFBBE4A) : Colors.black,
                        fontSize: 16,
                        fontFamily: 'RobotoMedium'
                    ),),
                    afterOTPTap ? Container(
                      width: mQuery.size.width*0.07,
                      height: mQuery.size.height*0.045,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.check,color: Colors.white,
                          size: mQuery.size.width*0.045,),
                      ),
                    ) : Container()
                  ],
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      afterOntheDelivery = !afterOntheDelivery;
                    });
                    _showOTPBottomSheet2(context, mobileNumber3!, otp2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("On the Delivery",style: TextStyle(
                          color: afterOTPTap ? Color(0xffFBBE4A) : Colors.black,
                          fontSize: 16,
                          fontFamily: 'RobotoMedium'
                      ),),
                      afterOTPTap ? Container(
                        width: mQuery.size.width*0.07,
                        height: mQuery.size.height*0.045,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(Icons.check,color: Colors.white,
                            size: mQuery.size.width*0.045,),
                        ),
                      ) : Container()
                    ],
                  ),
                ),
                SizedBox(height: mQuery.size.height*0.01,),
                Divider(color: Color(0xffDCDFE3),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivered",style: TextStyle(
                        color: afterOntheDelivery ? Color(0xffFBBE4A) : Colors
                            .black,
                        fontSize: 16,
                        fontFamily: 'RobotoMedium'
                    ),),
                    afterOntheDelivery ? Container(
                      width: mQuery.size.width*0.07,
                      height: mQuery.size.height*0.045,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.check,color: Colors.white,
                          size: mQuery.size.width*0.045,),
                      ),
                    ) : Container()
                  ],
                ),

              ],
            ),
          );
        }
    );
  }


  void _showOTPBottomSheet(BuildContext context, String mobileNumber, String otp) {
    var mQuery = MediaQuery.of(context);

    final defaultPinTheme = PinTheme(
      width: mQuery.size.width * 0.16,
      height: mQuery.size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      textStyle: TextStyle(
        fontSize: mQuery.size.height * 0.04,
        fontFamily: 'RobotoBold',
      ),
    );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: double.infinity,
              height: mQuery.size.height * 0.4,
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
              decoration: BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mQuery.size.height * 0.024),
                    Text(
                      "Enter OTP",
                      style: TextStyle(fontSize: 18, fontFamily: 'RobotoBold'),
                    ),
                    SizedBox(height: mQuery.size.height * 0.006),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "We have sent a OTP to",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                          TextSpan(
                            text: " $mobileNumber2\n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                          TextSpan(
                            text: "Enter 4 digit code that mentioned in the SMS  $otp",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                          TextSpan(
                            text: " $otp2",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'RobotoBold',
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.026),
                    Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme.copyWith(
                        textStyle: TextStyle(
                          fontSize: mQuery.size.height * 0.04,
                          fontFamily: 'RobotoBold',
                          color: showError2 && checkOTP2 != otp2 ? Colors.red :
                          Colors.black,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          checkOTP2 = value;
                          showError2 = false;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          checkOTP2 = value;
                          showError2 = false;
                        });
                      },
                    ),
                    SizedBox(height: mQuery.size.height * 0.01),

                    showError2 && checkOTP2.isEmpty
                        ? Text(
                      "Please Enter OTP",
                      style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        color: Colors.red,
                      ),
                    )
                        : showError2 && checkOTP2.isNotEmpty && checkOTP2 != otp2
                        ? Text(
                      "Incorrect OTP. Please Enter Correct OTP",
                      style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        color: Colors.red,
                      ),
                    )
                        : Text(""),

                    SizedBox(height: mQuery.size.height*0.01,),
                    GestureDetector(
                      onTap: () {
                        if (checkOTP2.isEmpty) {
                          setState(() {
                            showError = true;
                          });
                        } else {
                          if (checkOTP2 == otp2) {
                            //////////
                            packageDetailsBottomSheet(context);
                          } else {
                            setState(() {
                              showError2 = true;
                            });
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: mQuery.size.height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffD9D9D9),
                          border: Border.all(color: Color(0xff000000)),
                        ),
                        child: Center(
                          child: Text(
                            "Verify OTP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.02),
                    Center(
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontFamily: 'RobotoBold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.35),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }


  // for delivery
  void _showOTPBottomSheet2(BuildContext context, String mobileNumber, String
  otp3) {
    var mQuery = MediaQuery.of(context);

    final defaultPinTheme = PinTheme(
      width: mQuery.size.width * 0.16,
      height: mQuery.size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      textStyle: TextStyle(
        fontSize: mQuery.size.height * 0.04,
        fontFamily: 'RobotoBold',
      ),
    );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: double.infinity,
              height: mQuery.size.height * 0.4,
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
              decoration: BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mQuery.size.height * 0.024),
                    Text(
                      "Enter OTP",
                      style: TextStyle(fontSize: 18, fontFamily: 'RobotoBold'),
                    ),
                    SizedBox(height: mQuery.size.height * 0.006),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "We have sent a OTP to",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                          TextSpan(
                            text: " $mobileNumber3\n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                          TextSpan(
                            text: "Enter 4 digit code that mentioned in the SMS  $otp",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                          TextSpan(
                            text: " $otp3",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'RobotoBold',
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.026),
                    Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme.copyWith(
                        textStyle: TextStyle(
                          fontSize: mQuery.size.height * 0.04,
                          fontFamily: 'RobotoBold',
                          color: showError3 && checkOTP3 != otp3 ? Colors.red :
                          Colors.black,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          checkOTP3 = value;
                          showError3 = false;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          checkOTP3 = value;
                          showError3 = false;
                        });
                      },
                    ),
                    SizedBox(height: mQuery.size.height * 0.01),

                    showError3 && checkOTP3.isEmpty
                        ? Text(
                      "Please Enter OTP",
                      style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        color: Colors.red,
                      ),
                    )
                        : showError3 && checkOTP3.isNotEmpty && checkOTP3 !=
                        otp3
                        ? Text(
                      "Incorrect OTP. Please Enter Correct OTP",
                      style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        color: Colors.red,
                      ),
                    )
                        : Text(""),

                    SizedBox(height: mQuery.size.height*0.01,),
                    GestureDetector(
                      onTap: () {
                        if (checkOTP3.isEmpty) {
                          setState(() {
                            showError3 = true;
                          });
                        } else {
                          if (checkOTP3 == otp3) {
                            //////////
                            // packageDetailsBottomSheet(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return BottomNav();
                            }));
                          } else {
                            setState(() {
                              showError3 = true;
                            });
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: mQuery.size.height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffD9D9D9),
                          border: Border.all(color: Color(0xff000000)),
                        ),
                        child: Center(
                          child: Text(
                            "Verify OTP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.02),
                    Center(
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontFamily: 'RobotoBold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.35),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}











