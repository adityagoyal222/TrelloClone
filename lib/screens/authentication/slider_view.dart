import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class SliderView extends StatefulWidget {

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: PageIndicatorContainer(
        indicatorColor: Colors.grey[800],
        indicatorSelectorColor: Colors.white,
        align: IndicatorAlign.bottom,
        length: 3,
        indicatorSpace: 10.0,
        shape: IndicatorShape.circle(size:8),
        child: PageView(
          controller: controller,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Text(
                    'Hello Trello!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Ready to start getting stuff done?',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 225.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/updated-layouts-sync.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 225.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/butler.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Get organized',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0, 60.0, 0),
                    child: Text(
                      'Make a Trello board to organize anything with anyone.',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 17.0,
                          fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 225.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/updated-layouts-collab.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Team up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0, 60.0, 0),
                    child: Text(
                      'Invite people to join your board, all for free.',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 17.0,
                          fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
