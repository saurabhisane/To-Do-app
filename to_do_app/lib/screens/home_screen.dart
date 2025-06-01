import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeScreen extends StatefulWidget {
  final token;
  const HomeScreen({super.key, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = "";
  @override
  void initState() {
    super.initState();
    decodeToken();
  }

  void decodeToken() {
    try {
      if (widget.token.isNotEmpty) {
        Map<String, dynamic> jwtDecoder = JwtDecoder.decode(widget.token);
        print(jwtDecoder);
        if (jwtDecoder.containsKey('email')) {
          email = jwtDecoder['email'];
        } else {
          Get.snackbar('Error', 'Email not found');
        }
      } else {
        Get.snackbar('Error', 'Token is empty');
      }
    } catch (e) {
      email = 'Error decoding token: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(email),
        ],
      ),
    );
  }
}
