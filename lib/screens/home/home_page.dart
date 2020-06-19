import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'GET STARTED',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              children: <Widget>[
                Container(
                    child: Image(
                  image: AssetImage('assets/images/home.jpg'),
                )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Stay on track and up-to-date',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Invite people to boards and cards, add comments, and adjust due dates all from the new Trello Home. We'll show the most important activity here.",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
