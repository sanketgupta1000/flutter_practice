import "dart:convert";

import "package:http/http.dart";

class WorldTimeService
{

  static const _baseUrl = "https://api.ipgeolocation.io/timezone?apiKey=d76763297c4f4dd4a923f784e96753ee&tz=";

  WorldTimeService({required this.timezone});

  final String timezone;

  // method to get the current time
  Future<DateTime> getCurrentTime() async
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
    return currentUtc;

  }

}