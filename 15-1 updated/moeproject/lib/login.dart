import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = 'default'}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = false;
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  bool _keepMeLoggedIn = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    checkKeepMeLoggedInStatus();
  }

  Future<void> checkKeepMeLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _keepMeLoggedIn = prefs.getBool('keepMeLoggedIn') ?? false;
    });

    if (_keepMeLoggedIn) {
      userLogin();
    }
  }

  Future<void> saveKeepMeLoggedInStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('keepMeLoggedIn', value);
  }

  Future<void> userLogin() async {
    String url = "http://10.0.2.2/moe_connection/login.php";
    setState(() {
      _visible = true;
    });

    var data = {
      'ic_number': userController.text,
      'password': pwdController.text,
    };

    var response = await http.post(Uri.parse(url), body: json.encode(data));
    if (response.statusCode == 200) {
      print(response.body);
      var msg = jsonDecode(response.body);

      if (msg['loginStatus'] == true) {
        setState(() {
          _visible = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              name: msg['userInfo']['name'],
              ic: msg['userInfo']['ic_number'],
              email: msg['userInfo']['email'],
              id: msg['userInfo']['id'],
              iccolor: msg['userInfo']['ic_color'],
              birthdate: msg['userInfo']['birthdate'],
              gender: msg['userInfo']['gender'],
              address: msg['userInfo']['address'],
              postalcode: msg['userInfo']['postalcode'],
              phonehome: msg['userInfo']['phonehome'],
              phonemobile: msg['userInfo']['phonemobile'],
              phoneoffice: msg['userInfo']['phoneoffice'],
            ),
          ),
        );
      } else {
        setState(() {
          _visible = false;
          showMessage(msg["message"]);
        });
      }
    } else {
      setState(() {
        _visible = false;
        showMessage("Error during connecting to Server.");
      });
    }
  }

  Future<void> showMessage(String _msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_msg),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: _visible,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: LinearProgressIndicator(),
                ),
              ),
              Container(
                height: 100.0,
              ),
              Icon(
                Icons.group,
                color: Theme.of(context).primaryColor,
                size: 80.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Login Here',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Theme(
                        data: ThemeData(
                          primaryColor: Color.fromRGBO(84, 87, 90, 0.5),
                          primaryColorDark: Color.fromRGBO(84, 87, 90, 0.5),
                          hintColor: Color.fromRGBO(84, 87, 90, 0.5),
                        ),
                        child: TextFormField(
                          controller: userController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            labelText: 'Enter IC number',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color.fromRGBO(84, 87, 90, 0.5),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            hintText: 'IC Number',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your IC number';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Theme(
                        data: ThemeData(
                          primaryColor: Color.fromRGBO(84, 87, 90, 0.5),
                          primaryColorDark: Color.fromRGBO(84, 87, 90, 0.5),
                          hintColor: Color.fromRGBO(84, 87, 90, 0.5),
                        ),
                        child: TextFormField(
                          controller: pwdController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            labelText: 'Enter Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromRGBO(84, 87, 90, 0.5),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Checkbox for 'Keep me logged in'
                      Row(
                        children: [
                          Checkbox(
                            value: _keepMeLoggedIn,
                            onChanged: (value) {
                              setState(() {
                                _keepMeLoggedIn = value ?? false;
                              });
                            },
                          ),
                          Text('Keep me logged in'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              userLogin();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black, // Set text color to black
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
