import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:workout_app/pages/heartrate_tab.dart';
import 'package:workout_buddy/utils/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:marquee/marquee.dart';
import 'package:wave_progress_widget/wave_progress.dart';
import '../data_models/sensor.dart';
import 'workouts_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  int tabIndex = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference _sensorRef = FirebaseDatabase.instance.reference().child("Sensor");
  DatabaseReference _ledRef = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold() {
    DisplayList workoutList = new DisplayList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Buddy"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              AuthProvider().logOut();
            },
            child: Text("Log Out"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.accessibility),
              text: "Workouts",),
            Tab(
              icon: Icon(MaterialCommunityIcons.weight),
              text: "Current Sensor Data",),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 30,
            //child: _buildMarquee()
          ),
          Expanded(
            child: StreamBuilder(
                stream: _sensorRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      !snapshot.hasError &&
                      snapshot.data.snapshot.value != null) {
                    var _sens =
                    Sensor.fromJson(snapshot.data.snapshot.value['Json']);
                    print("Data1: ${_sens.data}, Data2: ${_sens.data2}");
                    //_setMarqueeText(_dht);
                    return IndexedStack(
                      index: tabIndex,
                      children: [
                        workoutList,
                        _sensorLayout(_sens),
                        //heartrate,
                        //_humidityLayout(_sens)
                      ],
                    );
                  } else {
                    return Center(
                      child: Text("NO DATA YET"),
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }

  Widget _sensorLayout(Sensor _sens) {
    return Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // RaisedButton(
            //   onPressed: () {
            //     _ledRef.update({"LED_STATUS": "ON"});
            //   },
            //   child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
            // ),
            //add here if top column
            Container(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                "Muscle Activity",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Bicep",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "Shoulder",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FAProgressBar(
                      progressColor: Colors.red,
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      size: 75,
                      currentValue: _sens.data.round(),
                      changeColorValue: 60,
                      changeProgressColor: Colors.green,
                      maxValue: 100,
                      displayText: "",
                      borderRadius: 20,
                      animatedDuration: Duration(milliseconds: 500),
                    ),
                    FAProgressBar(
                      progressColor: Colors.red,
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      size: 75,
                      currentValue: _sens.data2.round(),
                      changeColorValue: 60,
                      changeProgressColor: Colors.green,
                      maxValue: 100,
                      displayText: "",
                      borderRadius: 20,
                      animatedDuration: Duration(milliseconds: 500),
                    ),
                  ]),
            ),
            /*Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: FAProgressBar(
              progressColor: Colors.red,
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              size: 200,
              currentValue: _sens.data2.round(),
              changeColorValue: 60,
              changeProgressColor: Colors.green,
              maxValue: 100,
              displayText: "",
              borderRadius: 16,
              animatedDuration: Duration(milliseconds: 500),
            ),
          ),
        ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${_sens.data.toStringAsFixed(0)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "${_sens.data2.toStringAsFixed(0)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
          ],
        ));
  }

}
