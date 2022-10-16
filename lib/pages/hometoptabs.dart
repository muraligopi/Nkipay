import 'package:Nkipay/pages/homeSreens/current_user_details.dart';
import 'package:Nkipay/pages/homeSreens/phoneRechargeMain.dart';
import 'package:Nkipay/pages/homepage.dart';

import 'package:Nkipay/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'homeSreens/current_user_trans.dart';

class HomeTopTabs extends StatefulWidget {
  HomeTopTabs(this.colorVal);
  int colorVal;

  _HomeTopTabsState createState() => _HomeTopTabsState();
}

class _HomeTopTabsState extends State<HomeTopTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 6);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xFFF1E6FF;
    });
  }

  var radius = Radius.circular(10);
  var radius1 = Radius.circular(50);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 5.0,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 2.0,
              indicatorColor: Color.fromARGB(255, 244, 235, 232),
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  icon: Icon(FontAwesomeIcons.compass,
                      color: _tabController.index == 0
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('For You',
                      style: TextStyle(
                          color: _tabController.index == 0
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(Icons.wallet_rounded,
                      color: _tabController.index == 1
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Top Charts',
                      style: TextStyle(
                          color: _tabController.index == 1
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.shapes,
                      color: _tabController.index == 2
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Categories',
                      style: TextStyle(
                          color: _tabController.index == 2
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.solidBookmark,
                      color: _tabController.index == 3
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Family',
                      style: TextStyle(
                          color: _tabController.index == 3
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.solidStar,
                      color: _tabController.index == 4
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Early Access',
                      style: TextStyle(
                          color: _tabController.index == 4
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.lockOpen,
                      color: _tabController.index == 5
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Editors choice',
                      style: TextStyle(
                          color: _tabController.index == 5
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
              ],
              indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: radius,
                    topLeft: radius,
                    bottomLeft: radius1,
                    bottomRight: radius1,
                  )),
                  color: Colors.white60),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              const current_user_details(),
              const phoneRecgargeMain(),
              const currentUserPayment(),
              // Container(
              //   height: 200.0,
              //   child: Center(child: Text('Category')),
              // ),
              Container(
                height: 200.0,
                child: Center(child: Text('Family')),
              ),
              Container(
                height: 200.0,
                child: Center(child: Text('Early Access')),
              ),
              Container(
                height: 200.0,
                child: Center(child: Text('Editor Choice')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _GooglePlayAppBar() {
  int money = 200;
  String inr = '₹';
  String wallet = money.toString();
  return Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Container(
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
                        width: MediaQuery.of(context).size.width / 4,
                        height: 100,
                        child: Column(
                          children: [
                            Text("Username : " + document['name']),
                            Text("current Balance : " +
                                document['amount'].toString()),
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
    ),
  );
}




// Widget _GooglePlayAppBar() {
//   int money = 200;
//   String inr = '₹';
//   String wallet = money.toString();
//   return Container(
//     color: Colors.white,
//     margin: EdgeInsets.symmetric(horizontal: 5),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           child: Text(
//             " " + user.email! + "  your Current Balance : ",
//             style: TextStyle(color: Color.fromARGB(255, 16, 0, 0)),
//           ),
//         ),
//         Container(
//           child: Text(
//             inr + wallet,
//             style: TextStyle(color: Color.fromARGB(255, 16, 0, 0)),
//           ),
//         ),
//         Container(
//           child: IconButton(
//             tooltip: "Add money",
//             icon: Icon(
//               Icons.add,
//               color: kPrimaryColor,
//             ),
//             onPressed: () {},
//           ),
//         ),
//       ],
//     ),
//   );
// }

