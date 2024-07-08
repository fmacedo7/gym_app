import 'package:flutter/material.dart';
import '../constants/container_week_size.dart';

class WeekSchedule extends StatelessWidget {
  final Color borderColor;
  final Color weekDayColor;
  final String weekDay;
  final VoidCallback onTap;

  const WeekSchedule({
    super.key,
    required this.borderColor,
    required this.weekDayColor,
    required this.weekDay,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final weekContainerWidth = WeekContainerConstants.containerWidth(context);
    final weekContainerHeight = WeekContainerConstants.containerHeight(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25), // Para aplicar a borda arredondada ao ripple effect
      child: Container(
        width: weekContainerWidth,
        height: weekContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weekDay,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: WeekContainerConstants.currentColorDay,
              ),
            ),
            const Text(
              '01',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
