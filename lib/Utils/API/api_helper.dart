import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:split_easy/Screens/UtilityScreens/warning.dart';

class ApiHelper {
  static final String base_url="https://e369-2405-201-4003-f06d-216-3eff-fe70-8168.ngrok-free.app/";

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
        return data["accessToken"]+"-"+data["userId"];
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
  
}