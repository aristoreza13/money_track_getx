import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/timeline_controller.dart';

class TimelineView extends GetView<TimelineController> {
  const TimelineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Basics'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
