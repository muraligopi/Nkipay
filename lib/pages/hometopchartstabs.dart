import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTopChartsTabs extends StatefulWidget {
  //final Widget child;

  HomeTopChartsTabs({Key? key}) : super(key: key);

  _HomeTopChartsTabsState createState() => _HomeTopChartsTabsState();
}

class _HomeTopChartsTabsState extends State<HomeTopChartsTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          ImageContainer(),
        ],
      ),
    );
  }

  Widget ImageContainer() {
    return Container(
      height: 50.0,
      child: Center(child: Text('TopCharts')),
    );
  }
}
