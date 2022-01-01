import 'package:chat_app/services/firebase_auth.dart';
import 'package:chat_app/ui/views/auth/login/login.dart';
import 'package:chat_app/ui/widgets/already_have_an_account_acheck.dart';
import 'package:chat_app/ui/widgets/custom_divider.dart';
import 'package:chat_app/ui/widgets/inputfield.dart';
import 'package:chat_app/ui/widgets/roundbutton.dart';
import 'package:chat_app/ui/widgets/show_dialog.dart';
import 'package:chat_app/utilities/colors.dart';
import 'package:chat_app/utilities/loading.dart';
import 'package:chat_app/utilities/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'social_icons.dart';

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
  String username = "";
  final Services _auth = Services();
  bool isLoasing = false;
  final _formKey = GlobalKey<FormState>();
  trySignIN() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      setState(() => isLoasing = true);
      dynamic result = await _auth.regWithMailAndPass(mail, pass, username);
      if (result == null) {
        setState(() {
          error = "The account already exists for that email";
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
    return isLoasing
        ? Loading()
        : Background(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size * 0.03),
                    Text(
                      "SIGNUP",
                      style: theme.textTheme.headline1,
                    ),
                    SizedBox(height: size * 0.03),
                    SvgPicture.asset(
                      "assets/icons/signup.svg",
                      height: size * 0.3,
                    ),
                    SizedBox(height: size * 0.03),
                    RoundedInputField(
                      hintText: "Your Email",
                      icon: Icons.email,
                      onChanged: (value) {
                        setState(() {
                          mail = value;
                        });
                      },
                      validatorFun: (value) {
                        if (value.isEmpty || !value.contains("@")) {
                          return "Pleas Enter Correct Email";
                        }
                        return null;
                      },
                    ),
                    RoundedInputField(
                      hintText: "User Name",
                      icon: Icons.person,
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      validatorFun: (value) {
                        if (value.length < 3 || value.length > 15) {
                          return "Pleas Enter User Name between 3-15 charts";
                        }
                        return null;
                      },
                    ),
                    RoundedInputField(
                      issecure: true,
                      hintText: "Password",
                      icon: Icons.lock,
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      },
                      validatorFun: (value) {
                        if (value.length < 6) {
                          return "Pleas Enter Password more than 6 chart";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size * 0.001),
                    Text(error, style: theme.textTheme.headline2.copyWith(color: Colors.red),),
                    RoundedButton(
                      text: "SIGNUP",
                      press: () => trySignIN(),
                    ),
                    
                    SizedBox(height: size * 0.001),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      },
                    ),
                    OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocalIcon(
                          icon: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: OFFWhite_COLOR,
                            size: size * 0.045,
                          ),
                          press: () {
                            print("facebook");
                            _auth.signUpWithFacebook();
                          },
                        ),
                        SocalIcon(
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: OFFWhite_COLOR,
                            size: size * 0.03,
                          ),
                          press: () {
                            print("google");
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
