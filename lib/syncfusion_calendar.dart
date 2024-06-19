import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SyncFusionCalendar extends StatelessWidget {
  SyncFusionCalendar({Key? key}) : super(key: key);

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
          //firstDayOfWeek: controller.personalSettingConverter(),
          showDatePickerButton: true,
          showNavigationArrow: true,
          allowDragAndDrop: false,
          showTodayButton: true,
          appointmentTimeTextFormat: 'HH:mm',
          dataSource:
              ScheduleHeaderDataSource(dateCount: monthAppointmentDisplayCount),
          onTap: (details) async {},
          // onViewChanged: (viewChangedDetails) async {
          //   final firstDateOfVisibleMonth = viewChangedDetails.visibleDates[0];
          //   await controller.refreshSchedule(
          //     displayedFirstDate: firstDateOfVisibleMonth,
          //   );
          // },
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
  ScheduleHeaderDataSource({required int dateCount}) {
    appointments = createAppointments(dateCount);
    resources = [];
  }

  List<Appointment> createAppointments(int dateCount) {
    List<Appointment> appointments = [];
    for (var i = 0; i < dateCount + 1; i++) {
      final appointment = Appointment(
        id: i,
        startTime: DateTime(2024, 6, 16, 8 + i),
        endTime: DateTime(2024, 6, 16, 17),
        subject: "event $i",
        color: i % 2 == 0 ? Colors.red : Colors.blue,
        resourceIds: [],
      );
      appointments.add(appointment);
    }
    return appointments;
  }
}
