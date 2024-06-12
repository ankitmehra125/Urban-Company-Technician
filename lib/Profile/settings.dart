import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool enableNotification = false;
  bool showReminder = false;
  bool opencamera = false;

  var version = "1.0.1.9(27)";

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: mQuery.size.height * 0.14,
            padding: EdgeInsets.symmetric(
                horizontal: mQuery.size.width * 0.045
            ),
            color: Colors.white,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                    ),
                    SizedBox(width: mQuery.size.width * 0.033),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 24, fontFamily: 'RobotoBold'),
                    ),
                  ],
                ),
                SizedBox(height: mQuery.size.height * 0.03,)
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Common",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'RobotoBold'
                  ),),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Enable Notification",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoMedium'
                      ),),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: enableNotification,
                          trackOutlineColor: MaterialStatePropertyAll(
                            Colors.transparent
                          ),
                          activeTrackColor: Colors.black,
                          inactiveTrackColor: Color(0xffD9D9D9),
                          inactiveThumbColor: Colors.white,
                          onChanged: (value)
                          {
                            setState(() {
                              enableNotification = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Show reminder",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium'
                      ),),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: showReminder,
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          activeTrackColor: Colors.black,
                          inactiveTrackColor: Color(0xffD9D9D9),
                          inactiveThumbColor: Colors.white,
                          onChanged: (value)
                          {
                            setState(() {
                              showReminder = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Turn off camera when start a \nvideo call",style:
                      TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium'
                      ),),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: opencamera,
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          activeTrackColor: Colors.black,
                          inactiveTrackColor: Color(0xffD9D9D9),
                          inactiveThumbColor: Colors.white,
                          onChanged: (value)
                          {
                            setState(() {
                              opencamera = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: mQuery.size.height*0.01,),
                  Divider(color: Color(0xffD9DBDE),),
                  SizedBox(height: mQuery.size.height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("App Version",style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoMedium'
                      ),),
                      Text(version,style: TextStyle(
                        color: Color(0xff9BA1A8),
                        fontFamily: 'RobotoMedium'
                      ),)
                    ],
                  ),

                  SizedBox(height: mQuery.size.height*0.01,),
                  Divider(color: Color(0xffD9DBDE),),
                  SizedBox(height: mQuery.size.height*0.01,),
                  Text("Password",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMedium'
                  ),),
                  Text("You can reset your password if you want or using pin",style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff7C858F),
                    fontFamily: 'RobotoMedium'
                  ),),
                  SizedBox(height: mQuery.size.height*0.023,),
                  Container(
                    width: mQuery.size.width*0.45,
                    height: mQuery.size.height*0.055,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text("RESET PASSWORD",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoBold'
                      ),),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
