import 'package:flutter/material.dart';
// import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:grade_plus_plus/pages/fragments/ExpandableSection.dart';
import 'package:grade_plus_plus/pages/fragments/TappableElement.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import '../AbstractPage.dart';

class UpdateGrades extends AbstractPage {
  UpdateGrades({Key key})
      : super(
          key: key,
          appBarTitle: 'Update Grades',
          // appBarColorBg: Colors.red,
          // appBarColorTxt: Colors.white,
        );

  _UpdateGradesState createState() => _UpdateGradesState();
}

class _UpdateGradesState extends PageState<UpdateGrades> {
  // final uploader = FlutterUploader();
  String _filePath;
  // FileItem gradesPDF;
  final fileName = "Grade Pdf";

  Widget pathFinder() {
    return new Center(
      child: _filePath == null
          ? new Text('No file selected.')
          : new Text('Path' + _filePath),
    );
  }

  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath(type: FileType.PDF);
      if (filePath == '') {
        return;
      }
      print("File path: " + filePath);
      setState(() {
        this._filePath = filePath;
      });
    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Center(
        child: Column(children: <Widget>[
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              _filePath == null
                  ? new Text('No file selected.')
                  : new Text('Path' + _filePath),
              new FloatingActionButton(
                onPressed: getFilePath,
                tooltip: 'Select file',
                child: new Icon(Icons.sd_storage),
              ),
            ],
          )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TappableElement(
          icon: Icons.file_upload,
          label: 'Upload your Grades',
          onTap: null,
          // onTap: uploader.enqueue(
          //     url: "your upload link", //required: url to upload to
          //     files: [
          //       gradesPDF
          //     ], // required: list of files that you want to upload
          //     method: UploadMethod.POST, // HTTP method  (POST or PUT or PATCH)
          //     headers: {"apikey": "api_123456", "userkey": "userkey_123456"},
          //     data: {
          //       "name": "john"
          //     }, // any data you want to send in upload request
          //     showNotification:
          //         true, // send local notification (android only) for upload status
          //     tag: "upload 1"), // unique tag for upload task
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ExpandableSection(
          title: 'Semester 1',
          content: Column(),
        ),
      )
    ]));
  }
}
