import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinput/pinput.dart';
import '../Global/global_var.dart';
import 'location_page.dart';

final authentication = GetStorage();

// Function to generate a random 4-digit OTP
String generateOTP() {
  Random random = Random();
  return (1000 + random.nextInt(9000)).toString();
}
bool showError = false;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phonenoController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/customer_images/Ss.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mQuery.size.height * 0.016),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: ()
                      {
                        authentication.write("Authentication", "Guest");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return LocationPage();
                            }));
                      },
                      child: Text(
                        "Guest Login",
                        style: TextStyle(
                          fontFamily: 'RobotoBold',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Image.asset("assets/images/customer_images/cartoon.png"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to USC",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'RobotoBold',
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.04),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'RobotoMedium',
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.022),
                    Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(
                              "assets/images/customer_images/phone.svg",
                            ),
                          ),
                          SizedBox(width: mQuery.size.width * 0.02),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'RobotoMedium',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  enteredMobileNo = value;
                                });
                              },
                              controller: phonenoController,
                              cursorColor: Colors.black54,
                              maxLength: 10,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter your phone number",
                                hintStyle: TextStyle(
                                  fontFamily: 'RobotoMedium',
                                  color: Colors.black54,
                                ), 
                                contentPadding: EdgeInsets.symmetric(vertical: 2),
                                counter: SizedBox.shrink(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: mQuery.size.height*0.1,),
              GestureDetector(
                onTap: () {
                  if (enteredMobileNo == null ||
                      enteredMobileNo!.isEmpty ||
                      enteredMobileNo!.length < 10) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                            enteredMobileNo!.isEmpty
                                ? "Please enter your mobile number"
                                : "Please enter a valid mobile number",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontFamily: 'RobotoMedium',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'RobotoMedium',
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    // Generate OTP
                     otp = generateOTP();
                    _showOTPBottomSheet(context, enteredMobileNo!, otp);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: mQuery.size.height * 0.075,
                  margin: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffD9D9D9),
                    border: Border.all(color: Color(0xff000000)),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'RobotoBold',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mQuery.size.height * 0.016),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.02),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "By signing up, you agree to the ",
                          style: TextStyle(
                            fontFamily: 'SatoshiRegular',
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: " and",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SatoshiRegular',
                            fontSize: 14,
                          ),
                        )
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Privacy Policy,",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'RobotoBold',
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: " including",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SatoshiRegular',
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: " Cookie Use.",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'RobotoBold',
                                fontSize: 14,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
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
                            text: " $mobileNumber \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                          TextSpan(
                            text: "Enter 4 digit code that mentioned in the SMS",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'SatoshiRegular',
                            ),
                          ),
                          TextSpan(
                            text: " $otp",
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
                          color: showError && checkOTP != otp ? Colors.red : Colors.black,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          checkOTP = value;
                          showError = false;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          checkOTP = value;
                          showError = false;
                        });
                      },
                    ),
                    SizedBox(height: mQuery.size.height * 0.01),

                    showError && checkOTP.isEmpty
                        ? Text(
                      "Please Enter OTP",
                      style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        color: Colors.red,
                      ),
                    )
                        : showError && checkOTP.isNotEmpty && checkOTP != otp
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
                        if (checkOTP.isEmpty) {
                          setState(() {
                            showError = true;
                          });
                        } else {
                          if (checkOTP == otp) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return LocationPage();
                            }));
                          } else {
                            setState(() {
                              showError = true;
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
