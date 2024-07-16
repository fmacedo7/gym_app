import 'package:flutter/material.dart';
import 'package:gym_app/theme/colors.dart';

class WorkoutCards extends StatelessWidget {
  final List<Widget> children;
  const WorkoutCards({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: screenHeight * 0.3,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: baseBlack,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
