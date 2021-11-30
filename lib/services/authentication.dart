import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication{

   static Future login(String username, String password) async{
      // print(username);
      // print(password);
      try{
        final response = await http.post(
          Uri.parse("http://192.168.1.3:8080/auth/realms/Demo-Realm/protocol/openid-connect/token"),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          encoding: Encoding.getByName('utf-8'),
          body:{
            'grant_type': 'password',
            'client_id': 'flutter-client',
            'client_secret': '12552703-0ae0-48af-b5f1-486e03a3eca7',
            'username': username,
            'password': password,
          }
        );
        print(response.statusCode.toString());
        if(response.statusCode == 200){
          print(response.body.toString());
          return response.statusCode;
          
        }else{
          return response.statusCode;
        }
      
      }catch(e){
         print(e.toString());
      }
  }
}