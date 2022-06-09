import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:lzstring/lzstring.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//service
import 'package:upload_imag_transaction/service/api.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadFilePage> createState() => _UploadFilePage();
}

class _UploadFilePage extends State<UploadFilePage> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Api api = Api();
          final XFile? image =
              await _picker.pickImage(source: ImageSource.gallery);

          List<int> imagebytes = await image!.readAsBytes(); //convert to bytes
          String baseimage = base64Encode(imagebytes);

          String? compressedStringSync = LZString.compressSync('Some String');
          print(compressedStringSync);
          List<int> original = utf8.encode(baseimage);

          //Compress data
          List<int> compressed = gzip.encode(original);

          print(original.length);
          print(compressed.length);
          api
              .uploadFile(zip: compressed)
              .then((value) => {print('todo bien'), print(value)});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
