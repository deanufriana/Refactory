import 'package:flutter/material.dart';
import 'package:refactory_test/widget/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final _scaffoldkeys = GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final key = '${email.text}_${password.text}';
      final checkUser = prefs.containsKey(key);
      if (checkUser) {
        final isWasLogin = prefs.containsKey('loginCount_$key');
        int countLogin = 0;
        if (isWasLogin) {
          countLogin = prefs.getInt('loginCount_$key');
        }
        countLogin = countLogin + 1;
        await prefs.setString('userLogin', prefs.getString(key));
        await prefs.setInt('loginCount_$key', countLogin);
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        final snackBar = SnackBar(
          content: Text(
            'username & password tidak ditemukan ! Silahkan lakukan registrasi terlebih dahulu',
          ),
        );
        _scaffoldkeys.currentState.showSnackBar(snackBar);
      }
    }
  }

  void _goToRegister() {
    Navigator.of(context).pushNamed('/register');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldkeys,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height - 100,
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    onPressed: _onLogin,
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: _goToRegister,
                    child: Text('Register'),
                  ),
                ),
                LocationWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
