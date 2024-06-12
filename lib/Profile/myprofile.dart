import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usc_technician/AUTH/welcome_page.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var initialRating = 1;
  bool isMyBalanceExpanded = false;

  // User data
  final Map<String, dynamic> userData = {
    'name': 'Bill Gates',
    'id': '#003542',
    'profession': 'HVAC Technician',
    'rating': 4.7,
    'image': 'https://s3-alpha-sig.figma.com/img/6f83/a63a/55a'
        'ca232de7a53f95b7101aa1e8375a0?Expires=1716768000&Key-Pair-Id='
        'APKAQ4GOSFWCVNEHN3O4&Signature=RVIACvekV-p9avE-At72NaSq9kB~2V2k2F8oRkiglSGMwLMAq9hpoOb0fraILbz4WZOVetn3gc7SOEGeBwLr1l7abLHgW~PhXQ4dL4qVcZipwIBD1ViF7zSwcFbheYcgYVpWL3Yva1z86WG9ONmjN7wl5Jl3Mw5nB3G7wXyPSAuqGJHv5m~OVfM5rQ3ZFSHsfeC1FBpCMAqA0YLxeKMIn3ATyvK3OwQgReAf-rIrz6kPv1ulQGF4SltpmczM7lxouSvJFujfr~1HlkkZcO9WjM~kUN9klOkWy6UtGapdwt1mO6DqdZ-zRqbrhG8ObVWXCdiIvEUOVELEt6f618mAYA__'
  };

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
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
                      "Profile",
                      style: TextStyle(fontSize: 24, fontFamily: 'RobotoBold'),
                    ),
                    Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/images/profile_images/ep_edit.svg")
                  ],
                ),
                SizedBox(height: mQuery.size.height * 0.03,)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width * 0.045,
                        vertical: mQuery.size.height * 0.016
                    ),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ProfilePicture(
                            name: "",
                            fontsize: 10,
                            radius: 41,
                            img: userData['image'],
                          ),
                        ),
                        Text(userData['name'], style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontFamily: 'RobotoBold'
                        ),),
                        Row(
                          children: [
                            Text("ID ${userData['id']} . ${userData['profession']}", style: TextStyle(
                              color: Color(0xffDFDFDF),
                              fontSize: 13,
                            ),),
                            SizedBox(width: mQuery.size.width * 0.032,),
                            RatingBar.builder(
                              unratedColor: Color(0xffDADADA),
                              initialRating: initialRating.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemSize: mQuery.size.height * 0.025,
                              allowHalfRating: true,
                              itemCount: 1,
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
                            SizedBox(width: mQuery.size.width * 0.016,),
                            Text("${userData['rating']}", style: TextStyle(
                                color: Color(0xffDADADA),
                                fontSize: 16,
                                fontFamily: 'RobotoMedium'
                            ),)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.032,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width * 0.055
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: mQuery.size.height * 0.023,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMyBalanceExpanded = !isMyBalanceExpanded;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mQuery.size.width*0.045
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset
                                  ("assets/images/profile_images/balanceIcon.svg",
                                  color: isMyBalanceExpanded ? Color(0xff5074FF) : Colors
                                      .black,
                                ),
                                SizedBox(width: mQuery.size.width*0.023,),
                                Text("My Balance",style: TextStyle(
                                    color: isMyBalanceExpanded ? Color(0xff5074FF) : Colors
                                        .black,
                                    fontFamily: 'RobotoMedium'
                                ),),
                                SizedBox(width: mQuery.size.width*0.055,),
                                Text("QAR 1,560",style: TextStyle(
                                    color: Color(0xff9BA1A8),
                                    fontSize: 13,
                                    fontFamily: 'RobotoMedium'
                                ),),
                                Expanded(child: SizedBox()),
                                Icon( isMyBalanceExpanded ? Icons
                                    .keyboard_arrow_down
                                    : Icons
                                    .arrow_forward_ios, color: Color(0xff9BA1A8),
                                    size: isMyBalanceExpanded ? mQuery.size.height*0.036
                                        : mQuery.size.height*0.022)
                              ],
                            ),
                          ),
                        ),
                        if(isMyBalanceExpanded) // Only show if expanded
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: mQuery.size.height*0.016,),
                              Divider(color: Color(0xffD9DBDE),),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mQuery.size.width*0.045
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ProfilePicture(name: "",
                                          radius: 15,
                                          fontsize: 10,
                                          img: "https://s3-alpha-sig.figma.com/img/6f83/a63a/55aca232de7a53f95b7101aa1e8375a0?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RVIACvekV-p9avE-At72NaSq9kB~2V2k2F8oRkiglSGMwLMAq9hpoOb0fraILbz4WZOVetn3gc7SOEGeBwLr1l7abLHgW~PhXQ4dL4qVcZipwIBD1ViF7zSwcFbheYcgYVpWL3Yva1z86WG9ONmjN7wl5Jl3Mw5nB3G7wXyPSAuqGJHv5m~OVfM5rQ3ZFSHsfeC1FBpCMAqA0YLxeKMIn3ATyvK3OwQgReAf-rIrz6kPv1ulQGF4SltpmczM7lxouSvJFujfr~1HlkkZcO9WjM~kUN9klOkWy"
                                              "6UtGapdwt1mO6DqdZ-zRqbrhG8ObVWXCdiIvEUOVELEt6f618mAYA__",
                                        ),
                                        SizedBox(width: mQuery.size.width*0.023,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("June 21, 2024",style: TextStyle(
                                                color: Color(0xff242D35),
                                                fontFamily: 'RobotoMedium'
                                            ),),
                                            Text("Withdraw to BNI Bank",style: TextStyle(
                                                color: Color(0xffA1A7AD),
                                                fontSize: 12,
                                                fontFamily: 'RobotoMedium'
                                            ),)
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text("-QAR 65",style: TextStyle(
                                            color: Color(0xffCA3939),
                                            fontFamily: 'RobotoMedium'
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: mQuery.size.height*0.016,),
                                    Row(
                                      children: [
                                        ProfilePicture(name: "",
                                          radius: 15,
                                          fontsize: 10,
                                          img: "https://s3-alpha-sig.figma.com/img/d393/2549/a3cd29e9f262bc554628c5bfead0494c?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YuozEaHdfVBSnnZ8~GCaYsWZH~pFvh8DtDP6FxXPYkozxCvFtlTaiKDwCO-9zkGJ9knV-JQWGT3ABHktH9AjdLlX~DzygibMX7-uWz-jhKEVYe~BgzjRjJLJsI69hp8fTI9DT8bIhwQrVvl0eRQCznNlE0UpOp0GdtzoUrSJaNv203iBxu1muijqEtyyBOKUEgBAwARtQcqvYQkZ5D421qVPG5wQ"
                                              "7uJELLeGw-u5kBD~gNZ4fGqSzQu7dpAdDAc6TVJXHA7i2NNlOPqUN47KIhSyqu4Ey6DilQ2Pd10sp4YUPRskuUFfkblYGdTrOq8P6egQhnLJUgYny8edkzLHtA__",
                                        ),
                                        SizedBox(width: mQuery.size.width*0.023,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("June 21, 2024",style: TextStyle(
                                                color: Color(0xff242D35),
                                                fontFamily: 'RobotoMedium'
                                            ),),
                                            Text("Withdraw to Doha Bank",style: TextStyle(
                                                color: Color(0xffA1A7AD),
                                                fontSize: 12,
                                                fontFamily: 'RobotoMedium'
                                            ),)
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text("-QAR 65",style: TextStyle(
                                            color: Color(0xffCA3939),
                                            fontFamily: 'RobotoMedium'
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: mQuery.size.height*0.016,),
                                    Row(
                                      children: [
                                        ProfilePicture(
                                          name: "",
                                          radius: 15,
                                          fontsize: 10,
                                          img: "https://s3-alpha-sig.figma.com/img/2e92/b4ad/6c4d4c601258595c0e575d384c091223?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=I9j3~mCxD6iD0Kn2gRJczpiJGSLH4pIFGnUYBroNsbzDCWT1cLde2NZbR0F4vkkEZQOMfXf8qbKDfQpnKcSmcx7AzBA8kYwj8xAiFsbzSQ5vNHRWqJ~Oo3lQ4bEGZLd4WCC2qW6mElwwvY9r0S2ps-CkxxvGlZyQZ~evxp5JF6E80UEAxuUvj-MImPZ3vE~w43j48qVjF2sQF-A4Aw8I4pgoHVwaoqAPb8f2Pp27"
                                              "wKohuod2IDQVhDa4E1SiMiv8oRNYiN~XHG5e2HvEPwAwIQcdgGwStkgIlxes2BAqQV~nZlcZYeNrcryTXcnHyIkctRqrzj6O4DKvZJnHuY~ovg__",
                                        ),
                                        SizedBox(width: mQuery.size.width*0.023,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("June 21, 2024",style: TextStyle(
                                                color: Color(0xff242D35),
                                                fontFamily: 'RobotoMedium'
                                            ),),
                                            Text("Withdraw to Barwa Bank",style: TextStyle(
                                                color: Color(0xffA1A7AD),
                                                fontSize: 12,
                                                fontFamily: 'RobotoMedium'
                                            ),)
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text("-QAR 65",style: TextStyle(
                                            color: Color(0xffCA3939),
                                            fontFamily: 'RobotoMedium'
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: mQuery.size.height*0.016,),
                                    Row(
                                      children: [
                                        ProfilePicture(name: "",
                                          radius: 15,
                                          fontsize: 10,
                                          img: "https://s3-alpha-sig.figma.com/img/6f83/a63a/55aca232de7a53f95b7101aa1e8375a0?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RVIACvekV-p9avE-At72NaSq9kB~2V2k2F8oRkiglSGMwLMAq9hpoOb0fraILbz4WZOVetn3gc7SOEGeBwLr1l7abLHgW~PhXQ4dL4qVcZipwIBD1ViF7zSwcFbheYcgYVpWL3Yva1z86WG9ONmjN7wl5Jl3Mw5nB3G7wXyPSAuqGJHv5m~OVfM5rQ3ZFSHsfeC1FBpCMAqA0YLxeKMIn3ATyvK3OwQgReAf-rIrz6kPv1ulQGF4SltpmczM7lxouSvJFujfr~1HlkkZcO9WjM~kUN9klOkWy"
                                              "6UtGapdwt1mO6DqdZ-zRqbrhG8ObVWXCdiIvEUOVELEt6f618mAYA__",
                                        ),
                                        SizedBox(width: mQuery.size.width*0.023,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("June 21, 2024",style: TextStyle(
                                                color: Color(0xff242D35),
                                                fontFamily: 'RobotoMedium'
                                            ),),
                                            Text("Withdraw to Ahli Bank",style: TextStyle(
                                                color: Color(0xffA1A7AD),
                                                fontSize: 12,
                                                fontFamily: 'RobotoMedium'
                                            ),)
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text("-QAR 65",style: TextStyle(
                                            color: Color(0xffCA3939),
                                            fontFamily: 'RobotoMedium'
                                        ),)
                                      ],
                                    ),
              
                                    SizedBox(height: mQuery.size.height*0.023,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("View More",style: TextStyle(
                                            color: Color(0xffA0CCF8),
                                            fontFamily: 'RobotoMedium'
                                        ),),
                                        SizedBox(width: mQuery.size.width*0.016,),
                                        Icon(Icons.keyboard_arrow_down,color: Color(0xffA0CCF8),)
                                      ],
                                    ),
                                    SizedBox(height: mQuery.size.height*0.023,),
                                    Container(
                                      width: double.infinity,
                                      height: mQuery.size.height*0.055,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black
                                          ),
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Center(
                                        child: Text("Withdraw",style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: 'RobotoMedium'
                                        ),),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: mQuery.size.height*0.01,),
                        Divider(),
                        SizedBox(height: mQuery.size.height*0.023,),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mQuery.size.width*0.045
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/profile_images/settingIcon.svg"),
                              SizedBox(width: mQuery.size.width*0.023,),
                              Text("Settings",style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMedium'
                              ),),

                              Expanded(child: SizedBox()),
                              Icon(Icons.arrow_forward_ios, color: Color(0xff9BA1A8),size: mQuery.size.height*0.022)
                            ],
                          ),
                        ),


                        SizedBox(height: mQuery.size.height*0.01,),
                        Divider(),
                        SizedBox(height: mQuery.size.height*0.023,),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mQuery.size.width*0.045
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset
                                ("assets/images/dashboard_images/home_images/infoIcon.svg"),
                              SizedBox(width: mQuery.size.width*0.023,),
                              Text("About",style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMedium'
                              ),),
                              Expanded(child: SizedBox()),
                              Icon(Icons.arrow_forward_ios, color: Color(0xff9BA1A8),size: mQuery.size.height*0.022)
                            ],
                          ),
                        ),


                        SizedBox(height: mQuery.size.height*0.01,),
                        Divider(),
                        SizedBox(height: mQuery.size.height*0.023,),
                        GestureDetector(
                          onTap: ()
                          {
                            logoutPop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mQuery.size.width*0.045
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset
                                  ("assets/images/profile_images/logout.svg",
                                  color: Color(0xffCA3939),),
                                SizedBox(width: mQuery.size.width*0.023,),
                                Text("Logout",style: TextStyle(
                                    color: Color(0xffCA3939),
                                    fontFamily: 'RobotoMedium'
                                ),),
                                Expanded(child: SizedBox()),
                                Icon(Icons.arrow_forward_ios, color: Color(0xff9BA1A8),size: mQuery.size.height*0.022)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }


  void logoutPop(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var mQuery = MediaQuery.of(context);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Container(
                height: mQuery.size.height * 0.55,
                width: mQuery.size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/profile_images/logoutImage.svg",
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffCA3939),
                        fontFamily: 'RobotoBold',
                      ),
                    ),
                    SizedBox(height: mQuery.size.height * 0.032,),
                    Center(
                      child: Text(
                        "Are you sure you want to log out?",
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => WelcomePage()),
                                (route) => false, // Here, you define the condition when to stop removing routes. In this case, it always returns false, so it removes all routes.
                          );

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
                            "YES, Logout",
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
}
