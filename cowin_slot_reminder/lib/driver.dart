import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pushNotification.dart';

class Driver {

  String searchType;
  String pinCode = '';
  String state = '';
  int districtId = -1;
  String vaccineType = '';
  DateTime date;
  //String api_response = '';
  String doseNumber = '';
  String url = '';
  int minAgeLimit = 0;
  int stopMe;
  PushNotification pn = new PushNotification();
  Driver() {
    this.date = DateTime.now();
    this.stopMe = 0;
    this.searchType = 'pincode';
  }

   callApi()  async{
    String url = '';
    var res;
    switch (searchType) {
      case 'pincode':
        {
          url =
              'https://cdn-api.co-vin.in//api/v2/appointment/sessions/public/findByPin?pincode=' +
                  pinCode +
                  '&date=' +
                  DateFormat("dd-MM-yyyy").format(date);
        }
        break;
      case 'district':
        {
          url =
              'https://cdn-api.co-vin.in//api/v2/appointment/sessions/public/findByDistrict?district_id=' +
                  districtId.toString() +
                  '&date=' +
                  DateFormat("dd-MM-yyyy").format(date);
        }
        break;
    }

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IlNzWnNCTmhaY0YzUTlTNHRycFFCVEJ5TlJSSSIsImtpZCI6IlNzWnNCTmhaY0YzUTlTNHRycFFCVEJ5TlJSSSJ9.eyJhdWQiOiJodHRwczovL25ld2hlYWx0aGVudi5henVyZWhlYWx0aGNhcmVhcGlzLmNvbSIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0L2E0OTNkYzQ5LTk4ODctNDExMS1hZTU3LWEwNDgwYmI4YzY2Mi8iLCJpYXQiOjE1OTQwMDg4NTYsIm5iZiI6MTU5NDAwODg1NiwiZXhwIjoxNTk0MDEyNzU2LCJhY3IiOiIxIiwiYWlvIjoiQVZRQXEvOFFBQUFBRy9WZ2Y4UE1jeHZva09vQmVyWlE1NmdvSWxvMjk5a2hjakhBQ1V1WGtLSEcxcjN3c25mbGpOdkdFRlFoMkJJdDRlb3crQ1FkbWdqWG5mNDZaQWZnUEJmeE50RU0zZmt3Z0tqL0kxYmE5VVE9IiwiYW1yIjpbInB3ZCJdLCJhcHBpZCI6IjRlMjE3YzBjLTUzNTAtNGQxYy1iMTY5LTAyOGE1MmJjN2M1NSIsImFwcGlkYWNyIjoiMSIsImVtYWlsIjoic21hcnR2aXNpb25haTFAb3V0bG9vay5jb20iLCJmYW1pbHlfbmFtZSI6IktoYW4iLCJnaXZlbl9uYW1lIjoiQXJiYWIiLCJpZHAiOiJsaXZlLmNvbSIsImlwYWRkciI6IjE1Ny4zNy4yMjQuMTE2IiwibmFtZSI6IkFyYmFiIEtoYW4iLCJvaWQiOiJhNGEzNzI0Ni1iYjJhLTQ4NzQtYWYxZi1mYmJkYzZiOTEzMjciLCJzY3AiOiJ1c2VyX2ltcGVyc29uYXRpb24iLCJzdWIiOiIwM2FBTG5namJUcVJuVzU1TlNtT3ZiZUpqdWdLYkY5clFST082QlE5ZFE0IiwidGlkIjoiYTQ5M2RjNDktOTg4Ny00MTExLWFlNTctYTA0ODBiYjhjNjYyIiwidW5pcXVlX25hbWUiOiJsaXZlLmNvbSNzbWFydHZpc2lvbmFpMUBvdXRsb29rLmNvbSIsInV0aSI6ImlTeEVya1BzdDB1UWVRYWRuZ2htQUEiLCJ2ZXIiOiIxLjAifQ.DBiVQ9bHpBQetPvMUGbow77Jqw4g3H7nDcG6k4TXvInhg3zwJjMgsyOxnZTx8-5le2HP5sSXCFkum-WXEI_eG7LCcymKrx7GfYprcSiAl6EOi-SNX9ugKei26TSeX-gc7j7uFIfCb9o1OSVUh9D27Php_wgwIO84DvkyIFdELa0QawIrKMuGBVrgSFxd1ANlPT3hoUvcbtwqC3UL-ByXJndBpr94FTCt2RK_qFryRsXRVpp7lfxRLz4M0lSHqPGUVIW2wwvtD1eBiMyjSMVkM5lVOhILveMhIYUt0ikhpkpDF5kP_S6DkN8x4V3446tHYEeFajzafRoBuPy4Uht2FA'
    };
    //print(url);
    var request = http.Request('GET', Uri.parse(url));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      res =  response.stream.bytesToString();
    } else {
      //print('in else');
      res = response.reasonPhrase;
    }
    //api_response = res;
    return res;
    print('testing');
    //print(json.decode(api_response));
  }

//
  clear(){
    searchType = 'pincode';
    pinCode = '';
    state = '';
    districtId = -1;
    vaccineType = '';
    doseNumber = 'available_capacity_dose1';
    url = '';
    minAgeLimit = 0;
  }
  showAlertDialog(BuildContext context,msg) {
    // Create button
    Widget okButton = MaterialButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool checkValues() {
    if ((
            vaccineType != '' &&
            doseNumber != '' &&
            minAgeLimit != 0) &&
        (pinCode != '' || (state != '' && districtId != 0))) {
      return true;
    } else {
      return false;
    }
  }

  void notify(context)  async{
    var api_response;
    var counter = 0;
    //print(state+" "+searchType+" "+pinCode+" "+vaccineType+" "+doseNumber);
   // print(minAgeLimit);
   // print(districtId);
    if (!checkValues()) {
     showAlertDialog(context,"Please fill all the details.");
   } else {
      while (true) {
         api_response =  await callApi();
        if (api_response == 'Bad Request') {
          showAlertDialog(context,
              "Either you may have entered the details wrong, or Govt. servers are busy right now. Please try again !!! ");
          break;
        }
        else if (api_response == '') {
          counter ++;
          continue;
        }
        else {
          var response = json.decode(api_response)['sessions'];
          var area = [];
          var capacity = [];
          for (var i = 0; i < response.length; i++) {
            if (vaccineType == "Any") {
              if (response[i][doseNumber] > 0 &&
                  response[i]['min_age_limit'] == minAgeLimit) {
                area.add(response[i]["name"]);
                capacity.add(response[i][doseNumber]);
              }
            } else {
              if (response[i][doseNumber] > 0 &&
                  response[i]['min_age_limit'] == minAgeLimit &&
                  response[i]["vaccine"] == vaccineType) {
                area.add(response[i]["name"]);
                capacity.add(response[i][doseNumber]);
              }
            }
          }
          if (area.length > 0) {
            send_notification(area, capacity);
            break;
          }
          sleep(const Duration(seconds: 3));
          counter ++;
        }
      }
    }
  }

  void send_notification(List area, List capacity) async {

    var data = '';
    for (int i = 0; i < area.length; i++) {
      data = " "+ data + area[i] +",";
    }
    var message = "Slots available: "+data;
    pn.showNotification(message);
}
}
