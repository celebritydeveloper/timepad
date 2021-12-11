import 'package:flutter/material.dart';

class TaskModel {
  final Color color;
  final IconData icon;
  final String title;
  final List<String> tags;
  Duration time;
  final String status;

  TaskModel(
    this.color,
    this.icon,
    this.title,
    this.tags,
    this.time,
    this.status,
  );
}
