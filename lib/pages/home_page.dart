import 'package:flutter/material.dart';
import 'package:gym_app/constants/container_week_size.dart';
import 'package:gym_app/constants/padding.dart';
import 'package:gym_app/widget/image_picker.dart';
import 'package:gym_app/widget/week_schedule.dart';
import 'package:gym_app/widget/workout_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> weeks = ['Mon', 'Tus', 'Wed', 'Thi', 'Fri'];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(edgePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bícipes e Costas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(7, (index) {
                      return const WorkoutCards(
                        children: [],
                      );
                    }),
                  ),
                ),
              ),
              // const Spacer(),
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
                    onTap: () {},
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
