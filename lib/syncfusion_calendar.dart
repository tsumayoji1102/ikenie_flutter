import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SyncFusionCalendar extends StatelessWidget {
  SyncFusionCalendar({super.key});

  final calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    const monthAppointmentDisplayCount = 4;
    return MaterialApp(
      title: 'SyncFusion Calendar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SfCalendar(
          backgroundColor: Colors.white,
          cellBorderColor: Colors.grey,
          todayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          appointmentTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          blackoutDatesTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          appointmentBuilder: (context, details) {
            final appointment = details.appointments.first;
            return Container(
              color: appointment.color,
              child: Center(
                child: Text(
                  appointment.subject,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          view: CalendarView.month,
          controller: calendarController,
          timeZone: 'Tokyo Standard Time',
          showDatePickerButton: true,
          showNavigationArrow: true,
          allowDragAndDrop: false,
          showTodayButton: true,
          appointmentTimeTextFormat: 'HH:mm',
          dataSource: ScheduleHeaderDataSource(
              displayCount: monthAppointmentDisplayCount),
          onTap: (details) async {},
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            appointmentDisplayCount: monthAppointmentDisplayCount,
            navigationDirection: MonthNavigationDirection.vertical,
            numberOfWeeksInView: 4,
          ),
          resourceViewSettings: const ResourceViewSettings(showAvatar: false),
          timeSlotViewSettings: const TimeSlotViewSettings(
            timeFormat: 'H:mm',
            timeIntervalWidth: 60,
            timelineAppointmentHeight: 60,
          ),
        ),
      ),
    );
  }
}

//
class ScheduleHeaderDataSource extends CalendarDataSource {
  ScheduleHeaderDataSource({required int displayCount}) {
    appointments = _createAppointments(displayCount);
    resources = [];
  }

  List<Appointment> _createAppointments(int displayCount) {
    List<Appointment> appointments = [];
    appointments.addAll(_createAppointmentsInDay(
        displayCount: displayCount, day: 16, isOverDisplayCount: false));
    appointments.addAll(_createAppointmentsInDay(
        displayCount: displayCount, day: 18, isOverDisplayCount: true));
    return appointments;
  }

  List<Appointment> _createAppointmentsInDay({
    required int displayCount,
    required int day,
    required bool isOverDisplayCount,
  }) {
    List<Appointment> appointments = [];
    final maxCount = isOverDisplayCount ? displayCount + 1 : displayCount;
    for (var i = 0; i < maxCount; i++) {
      final appointment = Appointment(
        id: i,
        startTime: DateTime(2024, 6, day, 8 + i),
        endTime: DateTime(2024, 6, day, 17),
        subject: "event $i",
        color: i % 2 == 0 ? Colors.red : Colors.blue,
        resourceIds: [],
      );
      appointments.add(appointment);
    }
    return appointments;
  }
}
