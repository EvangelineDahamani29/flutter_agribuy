import 'package:agribuy_flutter/tools/app_tools.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController repassword = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Sign Up'),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'Full Name',
                textIcon: Icons.person,
                controller: fullname),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'Gender',
                textIcon: Icons.group,
                controller: gender),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'Phone number',
                textIcon: Icons.phone,
                textType: TextInputType.number,
                controller: phone),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'Email',
                textIcon: Icons.email,
                controller: email),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: 'Password',
                textIcon: Icons.lock,
                controller: password),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: 'Confirm Password',
                textIcon: Icons.lock,
                controller: repassword),
            appButton(
              btnTxt: 'Sign up',
              onBtnclicked: verifyDetails,
              btnPadding: 50.0,
              btnColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  verifyDetails() {
    if (fullname.text == '') {
      showSnackBar('Full name field cannot be empty', scaffoldKey);
      return;
    }
    if (gender.text == '') {
      showSnackBar('Gender field cannot be empty', scaffoldKey);
      return;
    }
    if (phone.text == '') {
      showSnackBar('Phone number field cannot be empty', scaffoldKey);
      return;
    }

    if (email.text == '') {
      showSnackBar('Email field cannot be empty', scaffoldKey);
      return;
    }

    if (password.text == '') {
      showSnackBar('Password field cannot be empty', scaffoldKey);
      return;
    }
    if (repassword.text == '') {
      showSnackBar('Confirm Password', scaffoldKey);
      return;
    }
    if (password.text != repassword.text) {
      showSnackBar("Passwords don't match", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
  }
}
