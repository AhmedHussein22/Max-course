import 'package:chat_app/services/firebase_auth.dart';
import 'package:chat_app/ui/views/auth/signup/signup.dart';
import 'package:chat_app/ui/widgets/already_have_an_account_acheck.dart';
import 'package:chat_app/ui/widgets/inputfield.dart';
import 'package:chat_app/ui/widgets/roundbutton.dart';
import 'package:chat_app/utilities/loading.dart';
import 'package:chat_app/utilities/responsive.dart';

import './background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String error = "";
  String pass = "";
  String mail = "";
  final _formKey = GlobalKey<FormState>();
  bool isLoasing =false;
  final Services _auth = Services();
  void _tryLoginFun() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      setState(() => isLoasing = true);
      dynamic result = await _auth.signINWithMailAndPass(mail, pass);
      if (result == null) {
        setState(() {
          error = "Invalid Mail OR Password";
          isLoasing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screesize = MediaQuery.of(context);
    Responsive _responsive = Responsive(screensize: screesize);
    double size = _responsive.getheightsize(screesize.size.height);
    ThemeData theme = Theme.of(context);
    return isLoasing ? Loading():Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: theme.textTheme.headline1,
              ),
              SizedBox(height: size * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size * 0.35,
              ),
              SizedBox(height: size * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                icon: Icons.email,
                validatorFun: (value) {
                  if (value.isEmpty || !value.contains("@")) {
                    return "Pleas Enter Correct Email";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    mail = value;
                  });
                },
              ),
              RoundedInputField(
                validatorFun: (value) {
                  if (value.length < 6) {
                    return "Pleas Enter Correct Password";
                  }
                  return null;
                },
                hintText: "Password",
                issecure: true,
                icon: Icons.lock,
                onChanged: (value) {
                  setState(() {
                    pass = value;
                  });
                },
              ),
              SizedBox(height: size * 0.001),
              Text(error,
                  style: theme.textTheme.headline2.copyWith(color: Colors.red)),
              RoundedButton(
                text: "LOGIN",
                press: () => _tryLoginFun(),
              ),
              SizedBox(height: size * 0.01),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUp();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
