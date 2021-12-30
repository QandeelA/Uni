import 'dart:html';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;
import 'dart:io' as io;
import 'dart:io' show Platform, Process, ProcessResult;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
/*
void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

   String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Row(
          children: <Widget>[
         Expanded (
      child: ElevatedButton(
      child: Text('Create Excel'), onPressed: createExcel),

    ) ,
   Expanded (
    child: ElevatedButton(
    child: Text('Open Excel'), onPressed: openFile),

    )
    ]
      ),
        );
  }
  Future openFile() async {
    // get file
    final result = await FilePicker.platform.pickFiles(
        type: FileType.any, allowMultiple: false);
    if (result.files.first != null) {
      var fileBytes = result.files.first.bytes;
      var fileName = result.files.first.name;

      // upload file
      await FirebaseStorage.instance.ref('uploads/$fileName').putData(
          fileBytes);
    }
  }

    /*final file = await pickFile();
    if (file ==null)
      return file;
    print ('Path: ${file.path}');
    OpenFile.open(file.path);
  }
  Future<io.File> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    if (result==null)return null;
    return io.File(result.files.first.path);
  }*/

    Future<void> createExcel() async {
      Workbook workbook = Workbook();
      Worksheet sheet = workbook.worksheets[0];
      sheet.getRangeByName('A1').setText('Hello World!');
      List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      if (kIsWeb) {
        AnchorElement(
            href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64
                .encode(bytes)}')
          ..setAttribute('download', 'Output.xlsx')
          ..click();
      } else {
        String path = (await getApplicationSupportDirectory()).path;
        String fileName =
        io.Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
        io.File file = io.File(fileName);
        await file.writeAsBytes(bytes, flush: true);
        OpenFile.open(fileName);
      }
    }
  }
