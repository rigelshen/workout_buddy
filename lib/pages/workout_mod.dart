import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:workout_buddy/data_models/workouts.dart';

class WorkoutMod extends StatefulWidget {
  final Workout workoutInstance;

  const WorkoutMod({this.workoutInstance});

  @override
  _WorkoutModState createState() => _WorkoutModState();
}

class _WorkoutModState extends State<WorkoutMod> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // DatabaseReference _sensorRef = FirebaseDatabase.instance.reference().child("Sensor");
  // DatabaseReference _ledR
  String url = "https://youtu.be/91-CSXXpQqU";
  String image = "assets/logo_2.jpg";

  @override
  Widget build(BuildContext context) {

    if(widget.workoutInstance.name == "Bicep Curl"){
      url = "https://youtu.be/uO_CNYidOw0";
      image = "assets/bicepCurl.jpg";
    }
    else if (widget.workoutInstance.name == "Push Up"){
      url = "https://youtu.be/_l3ySVKYVJ8";
      image = "assets/pushUp.jpg";
    }
    else if (widget.workoutInstance.name == "Test Workout"){
      url = "https://youtu.be/Zd8vzIRQLLM";
      image = "assets/logo_2.jpg";
    }
    else if (widget.workoutInstance.name == "Test Workout2"){
      url = "https://youtu.be/7nwthT8K9qM";
      image = "assets/logo_2.jpg";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.workoutInstance.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(image),
                ),
                const SizedBox(height: 10,),
                RaisedButton(
                  child: Text("Video Demonstration", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  onPressed: () {
                    FlutterYoutube.playYoutubeVideoByUrl(apiKey: "AIzaSyBhl9TFiWEn7imBIPRJIfpJcxuQrIMy_Ng", videoUrl: url);
                  },
                ),
                const SizedBox(height: 10,),
                Text("${widget.workoutInstance.descrip}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
