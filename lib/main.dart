import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

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
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _otplessFlutterPlugin = Otpless();
  final String appId = "GYAZZUKY316G1H8ZOGFC"; // Replace with your actual App ID

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoginPage();
    });
  }

  void showLoginPage() {
    var arg = {
      'appId': appId,
    };

    _otplessFlutterPlugin.openLoginPage((result) {
      var message = "";
      if (result['data'] != null) {
        final token = result['response']['token'];
        message = "token: $token";
      } else {
        message = result['errorMessage'];
      }
      // You can handle the message as needed
      print(message);
    }, arg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
