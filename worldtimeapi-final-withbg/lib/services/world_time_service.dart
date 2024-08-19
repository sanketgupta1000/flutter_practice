import "dart:convert";
import "dart:ffi";

import "package:http/http.dart";

class WorldTimeService
{

  static const _baseUrl = "https://api.ipgeolocation.io/timezone?apiKey=35b71c97e1fb438c8aac5d17b3edefeb&tz=";

  WorldTimeService({required this.timezone, required this.location});

  final String timezone;
  // location
  final String location;
  // the current time, can be set by calling getCurrentTime()
  DateTime? currentTime;

  // is it day time?
  bool isDayTime = false;

  // method to get the current time
  Future<void> getCurrentTime() async
  {
    Response resp = await get(Uri.parse(_baseUrl+timezone));

    Map<String, dynamic> respMap = jsonDecode(resp.body);

    DateTime currentUtc = DateTime.parse(respMap["date_time_ymd"]);
    print(currentUtc);
    // but we don't want the utc. we want the local time
    String date_time_ymd = respMap["date_time_ymd"];
    String offsetSign = date_time_ymd[19];
    String hourOffset = date_time_ymd.substring(20, 22);
    String minOffset = date_time_ymd.substring(22, 24);
    print(hourOffset);
    print(minOffset);
    if(offsetSign=="+")
    {
      print("inside +");
      currentUtc = currentUtc.add(Duration(hours: int.parse(hourOffset), minutes: int.parse(minOffset)));
    }
    else
    {
      currentUtc = currentUtc.subtract(Duration(hours: int.parse(hourOffset), minutes: int.parse(minOffset)));
    }

    print(currentUtc);
    currentTime = currentUtc;

    if((currentUtc.hour>6)&&(currentUtc.hour<20))
    {
      isDayTime = true;
    }

  }

}