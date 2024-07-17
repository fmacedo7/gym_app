import 'package:flutter/material.dart';

class WorkoutModel with ChangeNotifier {
  String _selectedDay = 'Mon';
  final Map<String, String> _workouts = {
    'Mon':'Triceps and Back',
    'Tue':'Biceps and Chest',
    'Wed':'Legs and Calf',
    'Thu':'Shoulders and Abs',
    'Fri':'Full Body',
  };

  String get selectedDay => _selectedDay;
  String get workout => _workouts[_selectedDay]!;

  void setSelectedDay (String day){
    _selectedDay = day;
    notifyListeners();
  }
}