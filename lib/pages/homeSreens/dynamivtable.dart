import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../homepage.dart';

class dynamicTable extends StatefulWidget {
  const dynamicTable({Key? key}) : super(key: key);

  @override
  State<dynamicTable> createState() => _dynamicTableState();
}

class _dynamicTableState extends State<dynamicTable> {
  late final List<Map<String, dynamic>> _allData = [];
  List<Map<String, dynamic>> _filterData = [];
  TextEditingController _filter = TextEditingController();
  List columnData = [
    //'Transaction_id',
    "phone_number".toString(),
    //"Member_id",
    'user_email'.toString(),
    //'Service',
    //'Provider',
    //'Account',
    'amount'.toString(),
    //'Credit',
    //'Debit',
    //'Balance',
    'Status'.toString(),
    //'Op_id'
  ];
  getdata() async {
    print('getdata');
    FirebaseFirestore.instance
        .collection('Transaction_Histroy')
        .where('user_email', isEqualTo: user.email!)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var dat = doc.data() as Map<String, dynamic>;
        setState(() {
          _allData.add(dat);
          _filterData = _allData;
        });
      });
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _filter.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword, String filter) {
    print(enteredKeyword);
    print(filter);
    // print(_allData);
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allData;
    } else {
      results = _allData
          .where((user) => user["${filter}"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print(results);
      setState(() {
        _filterData = results;
      });
    }
  }

  var valueProvider;
  Widget getProvider(String filter) {
    // print(Course);

    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Transaction_Histroy')
        .where('user_email', isEqualTo: user.email!)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return DropdownButton(
              hint: Text(
                'choose Provider',
              ),
              items: snapshot.data!.docs.map((DocumentSnapshot document) {
                return DropdownMenuItem(
                  child: Text(document.id),
                  value: document.id,
                );
              }).toList(),
              value: valueProvider,
              onChanged: (value) {
                Navigator.of(context).pop(_filter.text);
                setState(() {
                  valueProvider = value.toString();
                  _runFilter(valueProvider, filter);
                });
              });
        });
  }

  var selectedValue = 'choose the value';
  Future openDialoge(String filter) {
    if (filter == 'Provider') {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Provide Filter'),
                content: getProvider(filter),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(_filter.text);
                      },
                      child: Text('Close'))
                ],
              ));
    } else {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('title'),
                content: TextField(
                  controller: _filter,
                  decoration: const InputDecoration(labelText: 'Search'),
                  autofocus: true,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(_filter.text);
                        print(filter);
                        _runFilter(_filter.text, filter);
                        print(_filter.text);
                      },
                      child: Text('submit'))
                ],
              ));
    }
  }

  statusUpload(String status, String id) {
    print(status);
    print(id);
    var collection = FirebaseFirestore.instance.collection('Transaction');
    collection
        .doc('$id')
        .update({'Status': '$status'}) // <-- Updated data
        .then((_) => setState(() {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
              print('Success');
            }))
        .catchError((error) => print('Failed: $error'));
  }

  var _choosenStatus;
  Future updateStatus(String Uid) {
    return showDialog(
        context: context,
        builder: (Context) => AlertDialog(
              title: Text('update status'),
              content: DropdownButton<String>(
                focusColor: Colors.white,
                value: _choosenStatus,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: <String>[
                  'PENDING',
                  'SUCESSS',
                  'FAIL',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Text(
                  'please updated status',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (value) {
                  Navigator.of(context).pop(_filter.text);
                  setState(() {
                    _choosenStatus = value;
                    statusUpload(_choosenStatus, Uid);
                  });
                },
              ),
            ));
  }

  dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        dividerThickness: 2,
        border: TableBorder.all(width: 1, color: Colors.black12),
        columns: columnData
            .map((e) => DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            e,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                openDialoge(e);
                              },
                              icon: Icon(Icons.filter_alt_sharp))
                        ],
                      )
                    ],
                  ),
                ))
            .toList(),
        rows: _filterData
            .map((userData) => DataRow(cells: [
                  // DataCell(Text(userData['Transaction_id'])),
                  DataCell(Text(userData['phone_number'].toString())),
                  DataCell(Text(userData['user_email'].toString())),
                  // DataCell(Text(userData['pay_at'])),
                  // DataCell(Text(userData['Service'])),
                  //DataCell(Text(userData['Provider'])),
                  //DataCell(Text(userData['Account'])),
                  DataCell(Text(userData['amount'].toString())),
                  //DataCell(Text(userData['Credit'])),
                  //DataCell(Text(userData['Debit'])),
                  //DataCell(Text(userData['Balance'])),
                  DataCell(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              userData['status'].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  //updateStatus(userData['Uid']);
                                },
                                icon: Icon(Icons.edit))
                          ],
                        )
                      ],
                    ),
                  ),
                  //DataCell(Text(userData['Op_id'])),
                ]))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: dataBody(),
          )
        ],
      ),
    );
  }
}
