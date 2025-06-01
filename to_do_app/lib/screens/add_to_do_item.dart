import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../config.dart';

class AddTodoScreen extends StatefulWidget {
  final Function(String, String) onAdd;
  final token;

  const AddTodoScreen({super.key, required this.onAdd, required this.token});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late String userId;

  @override
  void initState() {
    super.initState();
    decodeToken();
  }

  void decodeToken()async {
    try {
      if (widget.token.isNotEmpty) {
        Map<String, dynamic> jwtDecoder = JwtDecoder.decode(widget.token);
        if (jwtDecoder.containsKey('_id')) {
          userId = await jwtDecoder['_id'];
        } else {
          Get.snackbar('Error', 'userId not found');
        }
      } else {
        Get.snackbar('Error', 'Token is empty');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  void addItem() async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      var regBody = {
        "userId": userId,
        "title": titleController.text,
        "desc": descriptionController.text,
      };
      try {
        var response = await http.post(
          Uri.parse(todo), // Replace with your API URL
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );
        var jsonRes = jsonDecode(response.body);
        print(jsonRes);

        if (response.statusCode == 200) {
          Get.snackbar('Success', 'Task added successfully!');
          if (kDebugMode) {
            print(jsonRes);
          }
        } else {
          // Handle error response
          Get.snackbar('Error', 'task addition failed: ${response.body}');
        }
      } catch (e) {
        // Handle network error
        Get.snackbar('Error', 'Network error: $e');
      }
    } else {
      setState(() {
        // Show validation error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add To-Do Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addItem();
                Get.back();
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
