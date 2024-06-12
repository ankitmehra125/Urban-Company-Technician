import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {


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
                      "About",
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Us",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'RobotoBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("Welcome to United Services Company, your Premier home service provider in Qatar! At United Services Company,"
                        " we take pride in offering top-notch cleaning services across various fields and a wide range of handyman "
                        "services, including plumbing, electrical, carpentry, and more. With a commitment to excellence"
                        " and customer satisfaction, we strive to make your life easier by taking care of your home maintenance needs "
                        "efficiently and professionally.",style: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                    ),),
                
                    SizedBox(height: mQuery.size.height*0.032,),
                    Text("1. Large Appliance",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'RobotoBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.016,),
                    Text("Our dedicated team of cleaning professionals"
                        " is equipped to handle cleaning tasks in residential, commercial, and industrial settings. From regular house cleaning to deep cleaning, we ensure that your space is spotless and hygienic.",style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),),
                
                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("2. Small Appliance",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'RobotoBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.016,),
                    Text("Leaky faucets, clogged drains, or faulty pipes?"
                        " Leave it to our skilled plumbers to fix any plumbing issues promptly and effectively. We offer a comprehensive range of plumbing services to keep your water and sewage systems running smoothly.",style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),),
                
                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("3. Home Appliance",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'RobotoBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.016,),
                    Text("Need electrical repairs, installations,"
                        " or upgrades? Our licensed electricians are here to assist you. Whether it's fixing faulty wiring or installing new lighting fixtures, we ensure safe and reliable electrical solutions for your home or business.",style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),),


                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("4. Industry Appliance",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'RobotoBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.016,),
                    Text(" Your satisfaction is our top priority."
                        " We strive to exceed your expectations with every service we provide.",style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),),
                    SizedBox(height: mQuery.size.height*0.023,),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.23,
                      padding: EdgeInsets.only(
                        left: mQuery.size.width*0.045
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Get in Touch",style: TextStyle(
                            color: Color(0xffFBBE4A),
                            fontFamily: "RobotoBold"
                          ),),
                          Text("Experience the convenience of hassle-free home maintenance with United Services Company. Whether you need cleaning services, plumbing assistance, or any other home service, we're here to help. Contact us today to schedule an appointment or request a quote. Let us take care of your home, so you can focus on what matters most.",style: TextStyle(
                            color: Color(0xffD9D9D9),
                            fontSize: 12,
                            fontFamily: 'RobotoMedium'
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
