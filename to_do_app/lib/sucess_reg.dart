import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_app/screens/add_to_do_item.dart';
import 'package:to_do_app/screens/to_do_detail_screen.dart';
import 'package:http/http.dart' as http;

import 'config.dart';

class SuccessReg extends StatefulWidget {
  const SuccessReg({super.key, this.token});
  final String? token;

  @override
  _SuccessRegState createState() => _SuccessRegState();
}

class _SuccessRegState extends State<SuccessReg> {
  List<Map<String, dynamic>> todoList = [];
  late String? userId; // ✅ Allow null values

  @override
  void initState() {
    super.initState();
    decodeToken();
  }

  void decodeToken() async {
    try {
      if (widget.token?.isNotEmpty ?? false) {
        // ✅ Safe null check
        Map<String, dynamic> jwtDecoder = JwtDecoder.decode(widget.token!);

        if (jwtDecoder.containsKey('_id') && jwtDecoder['_id'] != null) {
          userId = jwtDecoder['_id'].toString(); // ✅ Ensure it's a string
          await getData(); // Fetch data only if userId is valid
        } else {
          Get.snackbar('Error', 'User ID not found in token');
          print('Error: _id not found in token');
        }
      } else {
        Get.snackbar('Error', 'Token is empty or null');
        print('Error: Token is empty');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to decode token: $e');
      print('Error decoding token: $e');
    }
  }

  Future<void> getData() async {
    if (userId == null || userId!.isEmpty) {
      Get.snackbar('Error', 'User ID is missing');
      return;
    }
    var regBody = {
      "userId": userId,
    };
    try {
      var url = Uri.parse(todoData);

      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        print(jsonRes);
        List<dynamic> items = jsonRes['success'];

        setState(() {
          todoList = items.map((item) {
            return {
              'id': item['_id'] ?? 'null',
              'todoId': item['todoId'] ?? item['_id'] ?? 'null',
              'title': item['title'] ?? 'Untitled',
              'description': item['desc'] ?? 'No description available',
            };
          }).toList();
        });

        Get.snackbar('Success', 'Data fetched successfully!');
      } else {
        Get.snackbar('Error', 'Failed to fetch data: ${response.body}');
        print(response.body);
      }
    } catch (e) {
      Get.snackbar('Error', 'Network error: $e');
    }
  }

  Future<void> deleteTodoFromServer(String todoId, int index) async {
    if (userId == null || userId!.isEmpty) {
      Get.snackbar('Error', 'User ID is missing');
      return;
    }
    var regBody = {
      "userId": userId,
      "todoId": todoId,
    };
    try {
      final url = Uri.parse(todoDelete);

      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      if (response.statusCode == 200) {
        setState(() {
          todoList.removeAt(index);
        });
        Get.snackbar('Success', 'Todo deleted successfully');
      } else {
        Get.snackbar('Error', 'Failed to delete todo');
        print('Delete failed: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Network error: $e');
    }
  }

  void _addTodoItem(String title, String description) {
    setState(() {
      todoList.add({
        'title': title.isNotEmpty ? title : 'Untitled',
        'description':
            description.isNotEmpty ? description : 'No description available',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'To-Do List',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: todoList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list_alt, size: 80, color: Colors.grey.shade400),
                    const SizedBox(height: 10),
                    Text(
                      "No To-Do Items Yet!",
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => TodoDetailsScreen(
                            title: todoList[index]['title'] ??
                                'Untitled', // ✅ Safe null check
                            description: todoList[index]['description'] ??
                                'No description available',
                          ));
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: const Icon(Icons.task, color: Colors.white),
                        ),
                        title: Text(
                          todoList[index]['title'] ??
                              'Untitled', // ✅ Prevent null crashes
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(
                          (todoList[index]['description'] ??
                                  'No description available')
                              .split('\n')
                              .first,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        trailing: IconButton(
                          icon:
                              const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            final todoId = todoList[index]['todoId']?.toString();

                            if (todoId == null || todoId.isEmpty) {
                              Get.snackbar('Error', 'Todo ID is missing');
                              return;
                            }

                            deleteTodoFromServer(todoId, index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    AddTodoScreen(onAdd: _addTodoItem, token: widget.token),
              ),
            );
            await getData();
          },
          icon: const Icon(Icons.add),
          label: const Text("New Task"),
          backgroundColor: Colors.blueAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
