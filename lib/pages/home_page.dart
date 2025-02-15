import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/constants/container_week_size.dart';
import 'package:gym_app/constants/padding.dart';
import 'package:gym_app/models/workout_model.dart';
import 'package:gym_app/widget/image_picker.dart';
import 'package:gym_app/widget/week_schedule.dart';
import 'package:gym_app/widget/workout_cards.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> weeks = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            'https://www.youtube.com/embed/xDaBywsDams?si=OVAg7AA2csSQwi3Y'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      key: const ValueKey<String>('home_page'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(edgePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ImageProfilePicker(),
                      ),
                      Text(
                        'Hi, Julia!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.menu),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Consumer<WorkoutModel>(
                      builder: (context, workoutModel, child) {
                        return Text(
                          workoutModel.workout,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(7, (index) {
                      return WorkoutCards(
                        children: [
                          Center(
                            child: FlickVideoPlayer(flickManager: flickManager),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              const Text(
                'Schedule',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: weeks.map((week) {
                  return WeekSchedule(
                    borderColor: WeekContainerConstants.borderColor,
                    weekDayColor: WeekContainerConstants.currentColorDay,
                    weekDay: week,
                    onTap: () {
                      Provider.of<WorkoutModel>(context, listen: false)
                          .setSelectedDay(week);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
