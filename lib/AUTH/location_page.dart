import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../DashBoard/BottomNav.dart';




class LocationPage extends StatefulWidget {
  const LocationPage({Key? key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/customer_images/Ss.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height*0.3,),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset("assets/images/customer_images/location.svg"),
                  SizedBox(height: mQuery.size.height*0.02,),
                  Text("Enable precise",style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'RobotoMedium'
                  ),),
                  Text("location",style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'RobotoMedium'
                  ),),
                  SizedBox(height: mQuery.size.height*0.02,),
                  Text("To search for the best nearby service,",style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontFamily: 'RobotoBold'
                  ),),
                  Text("we want to know your current",style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontFamily: 'RobotoBold'
                  ),),
                  Text("location",style: TextStyle(
                      color: Color(0xff8E8E93),
                      fontFamily: 'RobotoBold'
                  ),),

                ],
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage("assets/images/customer_images/map.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SizedBox(
                          width: mQuery.size.width * 0.84,
                          height: mQuery.size.height * 0.5,
                          child: Column(
                            children: [
                              SizedBox(height: mQuery.size.height*0.02,),
                              Text("Allow 'app' to use ",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'RobotoBold'
                              )
                              ),
                              Text("your location?",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'RobotoBold'
                              ),
                              ),
                              SizedBox(height: mQuery.size.height*0.005,),
                              Text("Your precise location is used to show",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Text("your position on the map, get",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Text("directions, estimate travel times and",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Text("improve search results",style: TextStyle(
                                  fontFamily: 'SatoshiRegular',
                                  fontSize: 14,
                                  color: Colors.black
                              ),),
                              Expanded(child: SizedBox()),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24
                                ),
                                child: Column(
                                  children: [
                                    Divider(),
                                    GestureDetector(
                                      onTap: ()
                                      {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                          return const BottomNav();
                                        }));
                                      },
                                      child: Text("Allow Once",style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff007AFF),
                                          fontFamily: 'RobotoMedium'
                                      ),),
                                    ),
                                    Divider(),
                                    Text("Allow While Using the App",style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff007AFF),
                                        fontFamily: 'RobotoMedium'
                                    ),),
                                    Divider(),
                                    Text("Don’t Allow",style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff007AFF),
                                        fontFamily: 'RobotoMedium'
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: mQuery.size.height*0.01)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: mQuery.size.height*0.075,
                margin : EdgeInsets.symmetric(
                    horizontal: mQuery.size.width*0.045
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffD9D9D9),
                    border: Border.all(
                        color: Color(0xff000000)
                    )
                ),
                child: Center(
                  child: Text("Enable Location Services",style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'RobotoBold'
                  ),),
                ),
              ),
            ),
            SizedBox(height: mQuery.size.height*0.02,),
            Text("🔒 Magical secured text to make all",style: TextStyle(
                color: Color(0xff8E8E93),
                fontFamily: 'RobotoMedium',
                fontSize: 12
            ),),
            Text("security concerns go away.",style: TextStyle(
                color: Color(0xff8E8E93),
                fontFamily: 'RobotoMedium',
                fontSize: 12
            ),),
            SizedBox(height: mQuery.size.height*0.032,)
          ],
        ),
      ),
    );
  }
}
