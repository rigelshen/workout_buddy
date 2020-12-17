import 'package:flutter/material.dart';
import 'package:workout_buddy/data_models/workouts.dart';
import 'workout_mod.dart';

class DisplayList extends StatefulWidget {
  @override
  _DisplayListState createState() => _DisplayListState();
}

class _DisplayListState extends State<DisplayList> {
  // final Workout bicepCurl = Workout(name: "Bicep Curl", bicepGoal: 100, chestGoal: 50, changeOfAngle: 170, difficulty: 30);
  // final Workout pushUp = Workout(name: "Push Up", bicepGoal: 100, chestGoal: 50, changeOfAngle: 90, difficulty: 35);
  // final Workout testWorkout = Workout(name: "Test Workout", bicepGoal: 50, chestGoal: 100, changeOfAngle: 20, difficulty: 100);

  final List<Workout> lst = [
    Workout(name: "Bicep Curl", bicepGoal: 100, chestGoal: 50, changeOfAngle: 170, difficulty: 30,
        descrip: "A workout that involves the brachioradialis, front deltoid and the main target on biceps brachii. Start with the dumbbell in hand. Your elbows should rest at your sides and your forearms should extend out in front of your body. Bring the dumbbells all the up to your shoulders by bending your elbows. Once at the top, hold for a second by squeezing the muscle. Reverse the curl slowly and repeat"),
    Workout(name: "Push Up", bicepGoal: 100, chestGoal: 50, changeOfAngle: 90, difficulty: 35,
        descrip: "A workout that builds both upper-body and core strength. It is a compound exercise that uses muscles in the chest, shoulders, triceps, back, abs, and even the legs. You get on the floor on all fours, positioning your hands slightly wider than your shoulders. Extend your legs to balance on your hands and toes. Keep your body in a straight line from head to toe without sagging in the middle or arching your back. Contract your abs and tighten your core by pulling your belly button toward your spine. Keep a tight core throughout the entire pushup. Bend your elbows and lower yourself until your elbows are at a 90 degree angle. Contract your chest and push back up through your hands in the start position. Don't lock out the elbows; keep them slightly bent"),
    Workout(name: "Test Workout", bicepGoal: 50, chestGoal: 100, changeOfAngle: 20, difficulty: 100,
        descrip: "Pucker up your lips, and slam them on your friend's lips"),
    Workout(name: "Test Workout2", bicepGoal: 100, chestGoal: 100, changeOfAngle: 360, difficulty: 900,
        descrip: "Idk what to do, just do whatever you want"),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lst.length,
      itemBuilder: (context, index) {
        return WorkoutTile(workout: lst[index],);
      },
    );
  }
}

class WorkoutTile extends StatelessWidget {
  final Workout workout;
  WorkoutTile({this.workout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.red[workout.difficulty],
          ),
          title: Text(workout.name),
          subtitle: Text("Bicep Sensor Goal: ${workout.bicepGoal}, Chest Sensor Goal: ${workout.chestGoal}, Angle Change Goal: ${workout.changeOfAngle}"),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkoutMod(workoutInstance: workout,),
              ),
            );
          },
        ),
      ),
    );
  }
}