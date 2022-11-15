import 'package:Nkipay/pages/homeSreens/current_user_details.dart';
import 'package:Nkipay/utils/constants.dart';
import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hometoptabs.dart';
import 'gamestoptabs.dart';
import 'moviestoptabs.dart';
import 'bookstoptabs.dart';
import 'musictoptabs.dart';

final user = FirebaseAuth.instance.currentUser!;
final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  //final Widget child;
  HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

Color PrimaryColor = Color(0xFFF1E6FF);
var api = '';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            // leading: const BackButton(
            //   color: Colors.black, // <-- SEE HERE
            // ),
            automaticallyImplyLeading: false,
            toolbarHeight: 60.0,
            backgroundColor: kPrimaryLightColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text("                                 "),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Image.asset(
                //     'assets/Nk_logo-removebg-preview-1.png',
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
                Container(
                  child: Row(children: [
                    Image.asset(
                      'assets/1-removebg-preview.png',
                      height: 100,
                      width: 100,
                    ),
                    Image.asset(
                      'assets/2-removebg-preview.png',
                      height: 150,
                      width: 150,
                    ),
                  ]),
                ),

                // Container(padding: const EdgeInsets.only(top: 8.0), child: ),
                Row(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    //userdetail1(),
                    const Text(" "),
                    Text(
                      "Logout",
                      // style: TextStyle(color: Colors.black),
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 14, 3, 3),
                        // height: 1.3,
                        fontSize: 16.0,
                      ),
                    ),
                    IconButton(
                        tooltip: "Log out",
                        icon: const Icon(
                          Icons.logout,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            showSnackBar(
                                context, "Logged out successfully.....");
                            Navigator.pop(context);
                          }).onError((error, stackTrace) {
                            showSnackBar(context, "$error");
                          });
                        }
                        // _signOut,
                        ),
                  ],
                ),
              ],
            ),

            // title: Padding(
            //   padding: EdgeInsets.only(top: 8.0),
            //   //my :Image.asset('assets/title.png', fit: BoxFit.cover),
            //   // child: _GooglePlayAppBar(),
            // )
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Color.fromARGB(255, 0, 0, 0),
              indicatorWeight: 6.0,
              onTap: (index) {
                setState(() {
                  switch (index) {
                    case 0:
                      PrimaryColor = Color.fromARGB(255, 236, 236, 232);
                      break;
                    case 1:
                      PrimaryColor = Color(0xFFF1E6FF);
                      break;
                    case 2:
                      PrimaryColor = Color(0xffe91e63);
                      break;
                    case 3:
                      PrimaryColor = Color(0xff9c27b0);
                      break;
                    case 4:
                      PrimaryColor = Color(0xFFF1E6FF);
                      break;
                    default:
                  }
                });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      'Pay Bills',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 14, 3, 3),
                        // height: 1.3,
                        fontSize: 16.0,
                      ),
                      // style: TextStyle(
                      //     color: Color.fromARGB(255, 14, 3, 3), fontSize: 18.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'API',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 14, 3, 3),
                        // height: 1.3,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Users',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 14, 3, 3),
                        // height: 1.3,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Report',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 14, 3, 3),
                        // height: 1.3,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Settings',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 14, 3, 3),
                        // height: 1.3,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              HomeTopTabs(0xFFF1E6FF),
              HomeTopTabs(0xFFF1E6FF), //ff5722
              HomeTopTabs(0xFFF1E6FF),
              HomeTopTabs(0xFFF1E6FF),
              HomeTopTabs(0xFFF1E6FF),
              // GamesTopTabs(0xFFF1E6FF), //3f51b5
              // MoviesTopTabs(0xFFF1E6FF), //e91e63
              // BooksTopTabs(0xFFF1E6FF), //9c27b0
              // MusicTopTabs(0xFFF1E6FF), //2196f3 //4CAF50
            ],
          )),
    );
  }
}

void _admin_detailState() {
  child:
  StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('email id', isEqualTo: 'gopi16567@gmail.com')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Text('something went wrong');
        }
        return ListView(
            children: snapshot.data!.docs.map((document) {
          api = document['current_api'];
          print(api);
          return Column(
            children: [
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: const [],
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList());
      });
}

Widget _GooglePlayAppBar() {
  int money = 200;
  String inr = '₹';
  String wallet = money.toString();
  return Container(
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('user_email', isEqualTo: user.email!)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                    children: snapshot.data!.docs.map((document) {
                  return Center(
                    child: Container(
                      color: Colors.purple,
                      height: 100,
                      child: Column(
                        children: [
                          Text("Username : " + document['name']),
                          Text("current Balance : " + document['amount']),
                          Text("User_email : " + document['user_email']),
                        ],
                      ),
                    ),
                  );
                }).toList());
              }),
        ),
        // Container(
        //   child: Text(
        //     " " + user.email! + "  your Current Balance : ",
        //     style: TextStyle(color: Color.fromARGB(255, 16, 0, 0)),
        //   ),
        // ),
        Container(
          child: Text(
            inr + wallet,
            style: TextStyle(color: Color.fromARGB(255, 16, 0, 0)),
          ),
        ),
        Container(
          child: IconButton(
            tooltip: "Add money",
            icon: Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}
