import 'package:art_studio_app/models/schedule.dart';

abstract class ISessionsSorter {
  Map<DateTime, List<Schedule>> organizeSessions(List<Schedule> sessions);
}

class SessionsSorter implements ISessionsSorter {
  const SessionsSorter();

  DateTime cutTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  List<DateTime> extractDates(List<Schedule> sessions) {
    List<DateTime> dates = [];
    for (var session in sessions) {
      final compareDate = cutTime(session.date);
      if (!dates.contains(compareDate)) {
        dates.add(compareDate);
      }
    }
    return dates;
  }

  List<DateTime> sortDates(List<DateTime> unsortedDates) {
    List<DateTime> sortedDates = unsortedDates;
    sortedDates.sort((a, b) => a.compareTo(b));
    return sortedDates;
  }

  List<Schedule> sortSessions(List<Schedule> unsortedSessions) {
    List<Schedule> sortedSessions = unsortedSessions;
    sortedSessions.sort((a, b) => a.date.compareTo(b.date));
    return sortedSessions;
  }

  @override
  Map<DateTime, List<Schedule>> organizeSessions(List<Schedule> sessions) {
    final dates = sortDates(extractDates(sessions));
    List<Schedule> unorganaizedSessions = sessions;
    Map<DateTime, List<Schedule>> organizedSessions = {};
    for (var date in dates) {
      List<Schedule> thisDaySessions = [];
      List<Schedule> currentSessions = List.from(unorganaizedSessions);
      for (var session in currentSessions) {
        if (cutTime(session.date) == date) {
          thisDaySessions.add(session);
          unorganaizedSessions.remove(session);
        }
      }
      organizedSessions.addAll({date: sortSessions(thisDaySessions)});
    }
    return organizedSessions;
  }
}
