import 'package:flutter/material.dart';
import 'package:trello_clone/screens/authentication/slider_view.dart';
import 'login.dart';
import 'signup.dart';

class Authenticate extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue[600],
      body: Column(
        children: <Widget>[
          SliderView(),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ButtonTheme(
                  height: 45,
                  child: RaisedButton(
                    color: Colors.green[500],
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                    onPressed : () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  ),
                ),
                ButtonTheme(
                  
                  height: 45,
                  child: RaisedButton(
                    color: Colors.green[500],
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                    onPressed : () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                    },
                  ),
                ),
                
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child:Text(
              'By creating an account, you agree to our Terms of Service and Privacy Policy.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}