abstract class IDateFormater {
  String formatDate(DateTime data);
  String formatTime(DateTime data);
}

class DateFormater implements IDateFormater {
  @override
  String formatDate(DateTime data) {
    String actualMonth = data.month.toString();
    String actualDay = data.day.toString();
    if (data.month < 10) actualMonth = "0${data.month}";
    if (data.day < 10) actualDay = "0${data.day}";
    return "${data.year}-$actualMonth-$actualDay";
  }

  @override
  String formatTime(DateTime data) {
    String actualHour = data.hour.toString();
    String actualMinut = data.minute.toString();
    if (data.hour < 10) actualHour = "0${data.hour}";
    if (data.minute < 10) actualMinut = "0${data.minute}";
    return "$actualHour:$actualMinut";
  }
}
