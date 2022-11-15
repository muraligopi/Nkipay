import 'package:Nkipay/pages/homepage.dart';
import 'package:Nkipay/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//getting current user details from fs..
class current_user_details extends StatefulWidget {
  const current_user_details({Key? key}) : super(key: key);

  @override
  State<current_user_details> createState() => _current_user_detailsState();
}

double cur_bal = 0;
String role = '';

String cur_api = '';

class _current_user_detailsState extends State<current_user_details> {
  @override
  void initstate() {
    super.initState();
  }

  final List<String> imgList = [
    'https://lh3.googleusercontent.com/GJAnttuWVk8IcpLlkMVMjyPWkgGc1-8_kFGoKa5GDP21rMKZt4AztM-hn5Q6WQdKFEg=w400-h600-rw',
    'https://lh3.googleusercontent.com/gNBb6s2J9aRrQE8wk6mppKbb46uYcW1p5EuzknTZF3Ds6hYM9QrWgO8rdlQDyY2A7Vmi=w200-h300-rw',
    'https://lh3.googleusercontent.com/IGPFCdnnT8Sp1kI___pIWlWFRlLaKgAzu7eP_QXw0FbZQ_gg3WvXqbhbiWaE9_hVEGd4Bw=w200-h300-rw',
    'https://lh3.googleusercontent.com/GVpOcjU50jtPmlNbB331263RgHv_NEqE-FnweqvUWleO94Ckvrznw05kwUGk1oKp5GA=w200-h300-rw',
    'https://lh3.googleusercontent.com/t58TiR9gox0kZ9o1GBY5qN6Ywg2HjaQ6n2cUPc_KYJntdcsVl5CGKOPjLwMcapUhD2fr-w=w200-h300-rw',
    'https://lh3.googleusercontent.com/zZ1ZSFCBB4iiA6MEOaZxHJX214soedvkqwRHGB58gnODQeVQUI1ID3wpEje-SOWFOavQNA=w200-h300-rw'
  ];

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          admin(),
          const SizedBox(
            height: 5.0,
          ),
          userdetail(),
          const SizedBox(
            height: 20.0,
          ),
          Recommended(),
        ],
      ),
    );
  }

  Widget CarouselContainer() {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.9,
        height: 600,
        aspectRatio: 0.8,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imgList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
              child: Image.network(
                url,
                width: 500.0,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget Recommended() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: labelContainer('Recommended for you'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CarouselContainer(),
          ),
        ],
      ),
    );
  }

  Widget labelContainer(String labelVal) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            labelVal,
            style: TextStyle(
                color: Color.fromARGB(255, 143, 19, 238),
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          const Text(
            'MORE',
            style: TextStyle(
                color: Color.fromARGB(255, 143, 19, 238),
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  //admin
  Widget admin() {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 10,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('email id', isEqualTo: 'gopi16567@gmail.com')
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
              if (snap.hasError) {
                return const Text('something went wrong');
              }
              return ListView(
                  children: snap.data!.docs.map((documents) {
                cur_api = documents['current_api'];
                print(cur_bal.runtimeType);
                return Column(
                  children: [
                    Center(
                      child: Container(
                          //color: kPrimaryColor,
                          //width: MediaQuery.of(context).size.width / 2,
                          //height: 100,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(50),
                          //     gradient: const LinearGradient(colors: [
                          //       kPrimaryColor,
                          //       kPrimaryColor
                          //       //Colors.white
                          //     ])),
                          // child: Padding(
                          //   padding: const EdgeInsets.all(defaultPadding),
                          //   child: Column(
                          //     children: [
                          //       // Text(
                          //       //   "Username : " + documents['username'],
                          //       //   style: GoogleFonts.josefinSans(
                          //       //     fontWeight: FontWeight.bold,
                          //       //     color: Color.fromARGB(255, 247, 243, 243),
                          //       //     // height: 1.3,
                          //       //     fontSize: 16.0,
                          //       //   ),
                          //       // ),
                          //       // Text(
                          //       //   "Current api : " + documents['current_api'],
                          //       //   style: GoogleFonts.josefinSans(
                          //       //     fontWeight: FontWeight.bold,
                          //       //     color: Color.fromARGB(255, 248, 246, 246),
                          //       //     height: 1.3,
                          //       //     fontSize: 16.0,
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                          ),
                    ),
                  ],
                );
              }).toList());
            }),
      ),
    );
  }

  //user details
  Widget userdetail() {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        // padding: const EdgeInsets.all(18.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('email id', isEqualTo: user.email!)
                .snapshots(),
            //.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Text('something went wrong');
              }
              return ListView(
                  children: snapshot.data!.docs.map((document) {
                cur_bal = document['current_Balance'];
                role = document['role'];
                //api = document['current_api'];
                print(cur_bal);

                return Column(
                  children: [
                    Center(
                      child: Container(
                        //color: kPrimaryColor,
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 2,
                        //height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(colors: [
                              kPrimaryColor,
                              kPrimaryColor
                              //Colors.white
                            ])),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          // padding: const EdgeInsets.all(defaultPadding),
                          child: Column(
                            children: [
                              Text(
                                "Username : " + document['username'],
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 247, 243, 243),
                                  // height: 1.3,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                "Current Balance : " +
                                    document['current_Balance'].toString(),
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 248, 246, 246),
                                  height: 1.3,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "Email: " + document['email id'],
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 244, 243, 243),
                                  height: 1.3,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "Role : " + document['role'].toString(),
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 249, 248, 248),
                                  height: 1.3,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "current_api : " + cur_api,
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 249, 248, 248),
                                  height: 1.3,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: "Add money",
                      icon: const Icon(
                        Icons.add,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      child: const Text(
                        'Add money',
                        style: TextStyle(color: Color.fromARGB(255, 16, 0, 0)),
                      ),
                    ),
                  ],
                );
              }).toList());
            }),
      ),
    );
  }
}

// Widget userdetail1() {
//   return StreamBuilder<Object>(
//       stream: null,
//       builder: (context, snapshot) {
//         return SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 10,
//           child: Container(
//             // width: MediaQuery.of(context).size.width / 4,
//             // height: MediaQuery.of(context).size.height / 3,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(),
//               // padding: const EdgeInsets.all(18.0),
//               child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('users')
//                       .where('email id', isEqualTo: user.email!)
//                       .snapshots(),
//                   //.snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (snapshot.hasError) {
//                       return const Text('something went wrong');
//                     }
//                     return ListView(
//                         children: snapshot.data!.docs.map((document) {
//                       cur_bal = document['current_Balance'];
//                       role = document['role'];
//                       //api = document['current_api'];
//                       print(cur_bal);

//                       return Column(
//                         children: [
//                           Center(
//                             child: Container(
//                               //color: kPrimaryColor,

//                               height: MediaQuery.of(context).size.height / 10,
//                               width: MediaQuery.of(context).size.width,
//                               //height: 100,
//                               // decoration: BoxDecoration(
//                               //     borderRadius: BorderRadius.circular(20),
//                               //     gradient: const LinearGradient(colors: [
//                               //       Colors.transparent,
//                               //       kPrimaryLightColor
//                               //       //Colors.white
//                               //     ])),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: defaultPadding),
//                                 // padding: const EdgeInsets.all(defaultPadding),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     // Text(
//                                     //   "Username : " + document['username'],
//                                     //   style: GoogleFonts.josefinSans(
//                                     //     fontWeight: FontWeight.bold,
//                                     //     color:
//                                     //         const Color.fromARGB(255, 247, 243, 243),
//                                     //     // height: 1.3,
//                                     //     fontSize: 14.0,
//                                     //   ),
//                                     // ),
//                                     Text(
//                                       "Closing Balance : " +
//                                           document['current_Balance']
//                                               .toString(),
//                                       style: GoogleFonts.josefinSans(
//                                         fontWeight: FontWeight.bold,
//                                         color: Color.fromARGB(255, 0, 0, 0),
//                                         height: 1.3,
//                                         fontSize: 16.0,
//                                       ),
//                                     ),
//                                     // Text(
//                                     //   "Email: " + document['email id'],
//                                     //   style: GoogleFonts.josefinSans(
//                                     //     fontWeight: FontWeight.bold,
//                                     //     color:
//                                     //         const Color.fromARGB(255, 244, 243, 243),
//                                     //     height: 1.3,
//                                     //     fontSize: 16.0,
//                                     //   ),
//                                     // ),
//                                     // Text(
//                                     //   "Role : " + document['role'].toString(),
//                                     //   style: GoogleFonts.josefinSans(
//                                     //     fontWeight: FontWeight.bold,
//                                     //     color:
//                                     //         const Color.fromARGB(255, 249, 248, 248),
//                                     //     height: 1.3,
//                                     //     fontSize: 16.0,
//                                     //   ),
//                                     // ),
//                                     // Text(
//                                     //   "current_api : " + cur_api,
//                                     //   style: GoogleFonts.josefinSans(
//                                     //     fontWeight: FontWeight.bold,
//                                     //     color:
//                                     //         const Color.fromARGB(255, 249, 248, 248),
//                                     //     height: 1.3,
//                                     //     fontSize: 16.0,
//                                     //   ),
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList());
//                   }),
//             ),
//           ),
//         );
//       });
// }
