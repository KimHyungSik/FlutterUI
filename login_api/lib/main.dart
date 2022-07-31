import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login_request.dart';
import 'dart:developer' as developer;

import 'BaseUrl.dart';
import 'login_response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                requestLogin(emailController.text, passwordController.text).then((value) => {
                  developer.log("value: $value", name: "main.dart")
                });
              },
              child: const Text("로그인"),
            )
          ],
        ),
      ),
    );
  }
}

Future<LoginResponse> requestLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse("${BASE_URL}admin/api/v1/auth/login"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(LoginRequest(email: email, password: password).toJson()),
  );
  return parseLoginResponse(response.body);
}

LoginResponse parseLoginResponse(String responseBody) {
  final Map<String, dynamic> parsed = jsonDecode(responseBody);
  return LoginResponse.fromJson(parsed);
}
