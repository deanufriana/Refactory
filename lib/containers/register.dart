import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:refactory_test/widget/location.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  Register({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final picker = ImagePicker();
  File _image;

  Future<void> _onRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = '${email.text}_${password.text}';
    final checkUser = prefs.containsKey(key);
    if (checkUser) {
      final snackbar = SnackBar(
        content: Text('email sudah teregistrasi'),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
      return;
    }

    if (_image == null) {
      final snackbar = SnackBar(
        content: Text('Silahkan Upload Photo Profile'),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
      return;
    }

    if (_formKey.currentState.validate()) {
      final Directory getPath = await getApplicationDocumentsDirectory();
      final String path = getPath.path;

      final File newImage = await _image.copy('$path/${username.text}.png');

      Map user = <String, dynamic>{
        "username": username.text,
        "email": email.text,
        "password": password.text,
        "imagePath": newImage.path
      };

      await prefs.setString(
        key,
        json.encode(user),
      );
      final snackbar = SnackBar(
        content: Text('Registrasi Berhasil !!'),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.of(context).pop();
      });
    }
  }

  Future<void> getFile(uploadType) async {
    File file;
    if (uploadType == 'file') {
      final picker = await FilePicker.getFile(
        type: FileType.custom,
        allowedExtensions: ['jpg'],
      );
      file = File(picker.path);
    } else {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    }
    setState(() {
      _image = file;
    });
  }

  void getBottomUpload() async {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.file_upload),
                title: new Text('File'),
                onTap: () => getFile('file'),
              ),
              new ListTile(
                leading: new Icon(Icons.camera),
                title: new Text('Camera'),
                onTap: () => getFile('camera'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Masukan Username',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Username belum di isi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: _image == null ? Colors.black : Colors.white,
                      ),
                      title: new Text(
                        'Foto Profile',
                        style: TextStyle(
                          color: _image == null ? Colors.black : Colors.white,
                        ),
                      ),
                      tileColor:
                          _image == null ? Colors.transparent : Colors.green,
                      onTap: getBottomUpload,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukan Email',
                      ),
                      validator: (value) {
                        bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value);
                        if (value.isEmpty) {
                          return 'Email belum di isi';
                        } else if (!emailValid) {
                          return 'Email tidak sesuai format';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukan Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password belum di isi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: _onRegister,
                        child: Text('Register'),
                      ),
                    ),
                    LocationWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
