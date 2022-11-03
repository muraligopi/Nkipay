import 'package:flutter/material.dart';

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
          const SizedBox(
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
