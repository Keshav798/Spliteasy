import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:split_easy/Screens/UtilityScreens/warning.dart';
import 'package:split_easy/Utils/SharedPreferences/shared_preferences_helper.dart';

class ApiHelper {
  static final String base_url="http://localhost:3000/";

  static Future<String?> loginUser(String email,String password,BuildContext context) async{
    
    final url = Uri.parse(base_url+"api/user/login"); // Replace with your API endpoint
    final headers = {
      'Content-Type': 'application/json'
    };
    final Map<String,dynamic> body={
      "email":email,
      "password":password
    };

    try {
      final response = await http.post(
        url, 
        headers: headers,
        body: json.encode(body));
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        // Parse the JSON response
        print('Data fetched: $data');
        return data["accessToken"]+":"+data["userId"];
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        showWarning(context, data["message"]);
        return null;
      }
    } catch (error) {
      print('Error: $error');
      showWarning(context, error.toString());
      return null;
    }
  }

  static Future<bool> registerUser(String name,String email,String password,BuildContext context) async{
    final url = Uri.parse(base_url+"api/user"); // Replace with your API endpoint
    final headers = {
      'Content-Type': 'application/json'
    };
    final Map<String,dynamic> body={
      "name":name,
      "email":email,
      "password":password
    };

    try {
      final response = await http.post(
        url, 
        headers: headers,
        body: json.encode(body));
      final data = json.decode(response.body);

      if (data["message"]=="Success") {
        // Parse the JSON response
        print('Data fetched: $data');
        return true;
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        showWarning(context, data["message"]);
        return false;
      }
    } catch (error) {
      print('Error: $error');
      showWarning(context, error.toString());
      return false;
    }
  }
  
  static Future<Map<String, dynamic>?> getUser() async {
    String? token = await SharedPreferencesHelper.getAuthToken();
    String? userId = await SharedPreferencesHelper.getUserId();

    if (token == null || userId == null) {
      if (token == null) print("token is null");
      if (userId == null) print("userId is null");
      return null;
    }

    final url = Uri.parse(base_url + "api/user/" + userId);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    try {
      //print('Request URL: $url');
      //print('Request Headers: $headers');

      final response = await http.get(url, headers: headers);
      //print('Response Status Code: ${response.statusCode}');
      //print('Response Body: ${response.body}');

      // Check if the response is JSON
      if (response.headers['content-type']?.contains('application/json') ?? false) {
        final data = json.decode(response.body);

        if (data["message"] == "Success") {
          //print('Data fetched: $data');
          return data["user"];
        } else {
          print('Failed to fetch data: ${data["message"]}');
          return null;
        }
      } else {
        print('Non-JSON response received: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

  static Future<List<dynamic>?> getUserShares() async {
    String? token = await SharedPreferencesHelper.getAuthToken();
    String? userId = await SharedPreferencesHelper.getUserId();

    if (token == null || userId == null) {
      if (token == null) print("token is null");
      if (userId == null) print("userId is null");
      return null;
    }

    final url = Uri.parse(base_url + "api/user/" + userId + "/shares");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    try {
      //print('Request URL: $url');
      //print('Request Headers: $headers');

      final response = await http.get(url, headers: headers);
      //print('Response Status Code: ${response.statusCode}');
      //print('Response Body: ${response.body}');

      // Check if the response is JSON
      if (response.headers['content-type']?.contains('application/json') ?? false) {
        final data = json.decode(response.body);

        if (data["message"] == "Success") {
          //print('Data fetched: $data');
          return data["shares"];
        } else {
          print('Failed to fetch data: ${data["message"]}');
          return null;
        }
      } else {
        print('Non-JSON response received: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

    static Future<Map<String, dynamic>?> getStaticSplitData(String splitId) async {
    String? token = await SharedPreferencesHelper.getAuthToken();

    if (token == null) {
      if (token == null) print("token is null");
      return null;
    }

    final url = Uri.parse(base_url + "api/split/" + splitId + "/static");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    try {
      //print('Request URL: $url');
      //print('Request Headers: $headers');

      final response = await http.get(url, headers: headers);
      //print('Response Status Code: ${response.statusCode}');
      //print('Response Body: ${response.body}');

      // Check if the response is JSON
      if (response.headers['content-type']?.contains('application/json') ?? false) {
        final data = json.decode(response.body);

        if (data["message"] == "Success") {
          //print('Data fetched: $data');
          return data["split"];
        } else {
          print('Failed to fetch data: ${data["message"]}');
          return null;
        }
      } else {
        print('Non-JSON response received: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

}