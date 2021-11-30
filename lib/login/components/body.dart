import 'package:flutter/material.dart';
import 'package:peristock/Login/components/background.dart';
import 'package:peristock/components/rounded_button.dart';
import 'package:peristock/components/rounded_input_field.dart';
import 'package:peristock/components/rounded_password_field.dart';
import 'package:peristock/Services/authentication.dart';
import 'package:peristock/searchBook.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  body_state createState() => body_state();
}

class body_state extends State<Body> {
  String username;
  String password;
  int auth;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.35,
            ),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {
                username = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                var value = await Authentication.login(username, password);
                if (value == 200) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchBook()));
                } else {
                  print("error bosss");
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error Login'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Wrong username or password'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('retry'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }

                // loginCheck(username, password);
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  loginCheck(String username, String password) {
    Authentication.login(username, password).then((value) {
      setState(() {
        this.auth = value;
      });
    }).catchError((error) {
      print("print error : " + error.toString());
    });
  }
}
