import 'package:art_studio_app/models/schedule.dart';
import 'package:art_studio_app/objects/sessions_sorter.dart';
import 'package:flutter_test/flutter_test.dart';

List<Schedule> getSessions() {
  return [
    Schedule(
      id: 1,
      workshopId: 1,
      date: DateTime(2020, DateTime.january, 16, 18, 30),
      location: "Узбекистан",
      numberOfSeats: 10,
    ),

    Schedule(
      id: 2,
      workshopId: 1,
      date: DateTime(2020, DateTime.january, 15, 16, 30),
      location: "Узбекистан",
      numberOfSeats: 10,
    ),
    Schedule(
      id: 3,
      workshopId: 1,
      date: DateTime(2020, DateTime.january, 15, 18, 30),
      location: "Узбекистан",
      numberOfSeats: 10,
    ),
    Schedule(
      id: 4,
      workshopId: 1,
      date: DateTime(2020, DateTime.january, 16, 16, 30),
      location: "Узбекистан",
      numberOfSeats: 10,
    ),
  ];
}

void main() {
  group("Sessions sorter", () {
    test("Extract dates from sessions array", () {
      final sorter = SessionsSorter();
      final sessions = getSessions();
      expect(sorter.extractDates(sessions), [
        DateTime(2020, DateTime.january, 16),
        DateTime(2020, DateTime.january, 15),
      ]);
    });
    test("Sort sessions", () {
      final sorter = SessionsSorter();
      final unsortedSessions = [
        Schedule(
          id: 1,
          workshopId: 1,
          date: DateTime(2020, DateTime.january, 16),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
        Schedule(
          id: 1,
          workshopId: 1,
          date: DateTime(2020, DateTime.january, 15),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
        Schedule(
          id: 1,
          workshopId: 1,
          date: DateTime(2020, DateTime.january, 14),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
        Schedule(
          id: 1,
          workshopId: 1,
          date: DateTime(2020, DateTime.january, 19),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
        Schedule(
          id: 1,
          workshopId: 1,
          date: DateTime(2020, DateTime.january, 9),
          location: "Узбекистан",
          numberOfSeats: 10,
        ),
      ];
      final sortedSessions = sorter.sortSessions(unsortedSessions);
      expect(sortedSessions[0].date, DateTime(2020, DateTime.january, 9));
      expect(sortedSessions[1].date, DateTime(2020, DateTime.january, 14));
      expect(sortedSessions[2].date, DateTime(2020, DateTime.january, 15));
      expect(sortedSessions[3].date, DateTime(2020, DateTime.january, 16));
      expect(sortedSessions[4].date, DateTime(2020, DateTime.january, 19));
    });
    test("Sort dates", () {
      final sorter = SessionsSorter();
      final unsortedDates = [
        DateTime(2020, DateTime.january, 16),
        DateTime(2020, DateTime.january, 15),
        DateTime(2020, DateTime.january, 14),
        DateTime(2020, DateTime.january, 19),
        DateTime(2020, DateTime.january, 9),
      ];
      expect(sorter.sortDates(unsortedDates), [
        DateTime(2020, DateTime.january, 9),
        DateTime(2020, DateTime.january, 14),
        DateTime(2020, DateTime.january, 15),
        DateTime(2020, DateTime.january, 16),
        DateTime(2020, DateTime.january, 19),
      ]);
    });

    test("Sessions datetime cut", () {
      final sorter = SessionsSorter();
      expect(
        sorter.cutTime(DateTime(2020, DateTime.january, 15, 18, 30)),
        DateTime(2020, DateTime.january, 15),
      );
    });
    test("Sort and complete sessions", () {
      final sorter = SessionsSorter();
      final sessions = getSessions();
      final sortedSessions = sorter.organizeSessions(sessions);
      expect(sortedSessions.keys.length, 2);
      expect(sortedSessions[DateTime(2020, DateTime.january, 15)]!.length, 2);
      expect(sortedSessions[DateTime(2020, DateTime.january, 16)]!.length, 2);
      expect(
        sortedSessions[DateTime(2020, DateTime.january, 15)]![0].date.hour,
        16,
      );
      expect(
        sortedSessions[DateTime(2020, DateTime.january, 15)]![1].date.hour,
        18,
      );
      expect(
        sortedSessions[DateTime(2020, DateTime.january, 16)]![0].date.hour,
        16,
      );
      expect(
        sortedSessions[DateTime(2020, DateTime.january, 16)]![1].date.hour,
        18,
      );
    });
  });
}

// {
//       DateTime(2020, DateTime.january, 15): [
//         Schedule(
//           id: 2,
//           workshopId: 1,
//           date: DateTime(2020, DateTime.january, 15, 16, 30),
//           location: "Узбекистан",
//           numberOfSeats: 10,
//         ),
//         Schedule(
//           id: 3,
//           workshopId: 1,
//           date: DateTime(2020, DateTime.january, 15, 18, 30),
//           location: "Узбекистан",
//           numberOfSeats: 10,
//         ),
//       ],
//       DateTime(2020, DateTime.january, 16): [
//         Schedule(
//           id: 4,
//           workshopId: 1,
//           date: DateTime(2020, DateTime.january, 16, 16, 30),
//           location: "Узбекистан",
//           numberOfSeats: 10,
//         ),
//         Schedule(
//           id: 1,
//           workshopId: 1,
//           date: DateTime(2020, DateTime.january, 16, 18, 30),
//           location: "Узбекистан",
//           numberOfSeats: 10,
//         ),
//       ],
//     };
