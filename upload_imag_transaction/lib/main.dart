import 'package:flutter/material.dart';

//page
import 'Page/upload_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload File Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UploadFilePage(),
    );
  }
}
