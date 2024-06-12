import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_page.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int selectedIndex = 0;

  void handleTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
            SizedBox(height: mQuery.size.height * 0.2),
            Text(
              "Welcome User",
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'RobotoBold',
              ),
            ),
            SizedBox(height: mQuery.size.height*0.03,),
            Text(
              "Select Language",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'RobotoMedium',
              ),
            ),
            SizedBox(height: mQuery.size.height * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => handleTap(0),
                    child: Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.068,
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.1),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0 ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                      child: Row(
                        children: [
                          Text(
                            "ENGLISH",
                            style: TextStyle(
                              fontSize: 15,
                              color: selectedIndex == 0 ? Colors.white : Colors.black,
                              fontFamily: 'RobotoMedium',
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: VerticalDivider(
                              thickness: 1.5,
                              color: selectedIndex == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(width: mQuery.size.width*0.024,),
                          Image.asset("assets/images/customer_images/usaFlag.png"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.03),
                  InkWell(
                    onTap: () => handleTap(1),
                    child: Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.068,
                      padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.1),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1 ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Arabic",
                            style: TextStyle(
                              fontSize: 15,
                              color: selectedIndex == 1 ? Colors.white : Colors.black,
                              fontFamily: 'RobotoMedium',
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: VerticalDivider(
                              thickness: 1.5,
                              color: selectedIndex == 1 ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(width: mQuery.size.width*0.024,),
                          Image.asset("assets/images/customer_images/urFlag.png"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.28,),
                ],
              ),
            ),
            GestureDetector(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoginPage();
                }));
              },
              child: Container(
                width: double.infinity,
                height: mQuery.size.height*0.075,
                margin: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width*0.12
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffD9D9D9),
                    border: Border.all(
                        color: Color(0xff000000)
                    )
                ),
                child: Center(
                  child: Text("Lets Get Started",style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    fontFamily: 'RobotoBold'
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
