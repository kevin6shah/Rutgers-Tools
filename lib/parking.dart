import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Parking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Parking();
  }
}

class _Parking extends State<Parking> {
  final List<String> typeParking = [
    'Commuter Zone A',
    'Commuter Zone B',
    'Commuter Zone C',
    'Commuter Zone D',
    'Commuter Zone L',
    'Commuter Zone H',
    'Night Commuter',
    'Resident',
    'Visitor'
  ].toList();
  final List<String> campus =
      ['Busch', 'College Avenue', 'Livingston', 'Cook/Douglass'].toList();
  String permitSelected;
  String campusSelected;
  @override
  Widget build(BuildContext context) {
    final parkingOptions = typeParking
        .map(
          (String index) => DropdownMenuItem<String>(
                value: index,
                child: Text(
                  index,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 25.0,
                  ),
                ),
              ),
        )
        .toList();
    final campusItems = campus
        .map(
          (String index) => DropdownMenuItem<String>(
                value: index,
                child: Text(
                  index,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 25.0,
                  ),
                ),
              ),
        )
        .toList();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: <Widget>[
          Hero(
            tag: 'parking',
            child: Icon(
              Icons.local_parking,
              color: Colors.blue[800],
            ),
            transitionOnUserGestures: true,
          ),
        ],
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text(
          'Rutgers Parking',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Column(
                children: <Widget>[
                  Divider(
                    height: 8.0,
                    color: Colors.transparent,
                  ),
                  Text(
                    'Current Time: ${TimeOfDay.now().format(context)}',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 17.0,
                    ),
                  ),
                  Divider(
                    height: 8.0,
                    color: Colors.transparent,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 5.0, right: 5.0),
                          child: Center(
                            child: Text(
                              'What Kind Of A Permit Do You Have?',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Center(
                          child: DropdownButton<String>(
                            hint: Text('Type'),
                            value: permitSelected,
                            items: parkingOptions,
                            onChanged: (s) {
                              setState(() {
                                permitSelected = s;
                              });
                            },
                            iconSize: 22.0,
                          ),
                        ),
                        Divider(
                          height: 16.0,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 8.0,
                    color: Colors.transparent,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 5.0, right: 5.0),
                          child: Center(
                            child: Text(
                              'What Campus Do You Want To Park On?',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Center(
                          child: DropdownButton<String>(
                            hint: Text('Campus'),
                            value: campusSelected,
                            items: campusItems,
                            onChanged: (s) {
                              setState(() {
                                campusSelected = s;
                              });
                            },
                            iconSize: 22.0,
                          ),
                        ),
                        Divider(
                          height: 16.0,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                    color: Colors.transparent,
                  ),
                  RaisedButton(
                    color: Colors.red[900],
                    elevation: 5.0,
                    child: Text(
                      'Find Parking',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 17.0,
                      ),
                    ),
                    onPressed: () {
                      findParking(permitSelected, campusSelected, context);
                    },
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

void findParking(String permitSelected, String campusSelected, context) {
  if (permitSelected == 'Commuter Zone B' && campusSelected == 'Livingston') {
    String displayStr =
        '(6PM - 2AM) Lots 107, 108, 109, 110, 111, 112, Scarlet, Green, Yellow\n\n(6PM - 8AM) Lot 101';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone B' && campusSelected == 'Busch') {
    String displayStr =
        '(6AM - 2AM)  Stadium West Lot\n\n(6PM - 2AM) Lots 50, 51, 51A, 51B, 53A, 54A, 58, 58A, 59, 60A, 60B, 61, 63, 63A, 63B, 63C, 64, 66B, 68 and Gated Lot 55 \n\n(6PM - 8AM) Lot 67';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone B' &&
          campusSelected == 'Cook/Douglass' ||
      permitSelected == 'Commuter Zone A' &&
          campusSelected == 'Cook/Douglass' ||
      permitSelected == 'Commuter Zone D' &&
          campusSelected == 'Cook/Douglass') {
    String displayStr =
        '(6PM - 2AM) Lots 94, 95, 98A, 98B and Lipman Drive\n\n(6PM-8AM) Lot 97\n\n(8PM - 2AM) Lot 78\n\n(6PM - 2AM) Lots 71A, 74A, 75, 76, 79, 81, 83, 84, 86, 88, 96, 96A, Douglass Deck, Corwin, and Gated lot 70\n\n(6PM - 8AM) Lot 82\n\n(7:30PM-2AM)  79A';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone B' &&
          campusSelected == 'College Avenue' ||
      permitSelected == 'Commuter Zone C' &&
          campusSelected == 'College Avenue' ||
      permitSelected == 'Commuter Zone L' &&
          campusSelected == 'College Avenue') {
    String displayStr =
        '(6PM - 2AM) Lots 11A, 13, 16, 20, 26, 30, 32, 33, 38, College Ave Deck \n\n(6PM - 8AM) Lot 13';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone A' && campusSelected == 'Busch' ||
      permitSelected == 'Commuter Zone C' && campusSelected == 'Busch' ||
      permitSelected == 'Commuter Zone D' && campusSelected == 'Busch' ||
      permitSelected == 'Commuter Zone L' && campusSelected == 'Busch' ||
      permitSelected == 'Commuter Zone H' && campusSelected == 'Busch') {
    String displayStr =
        '(6PM - 2AM) Lots 50, 51, 51A, 51B, 53A, 54A, 58, 58A, 59, 60A, 60B, 61, 63, 63A, 63B, 63C, 64, 66B, 68, Stadium West and Gated lot 55\n\n(6PM – 8AM) Lot 67';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone A' &&
      campusSelected == 'College Avenue') {
    String displayStr =
        '(6AM – 2AM) Lots 20, 26, 30 and College Ave Deck \n\n(6PM – 2AM) Lots 11A, 13, 16, 32, 33, 38\n\n(6PM – 8AM) Lot 13';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone A' &&
          campusSelected == 'Livingston' ||
      permitSelected == 'Commuter Zone C' && campusSelected == 'Livingston' ||
      permitSelected == 'Commuter Zone D' && campusSelected == 'Livingston') {
    String displayStr =
        '(6PM – 2AM) Lots 107, 108, 109, 110, 111, 112, Scarlet, Green, Yellow\n\n(6PM - 8AM) Lot 101';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone C' &&
          campusSelected == 'Cook/Douglass' ||
      permitSelected == 'Commuter Zone H' &&
          campusSelected == 'Cook/Douglass') {
    String displayStr =
        '(6AM - 2AM) Lots 98A, 98B, 99C and 99D\n\n(6PM - 2AM) Lots 94, 95, and Lipman Drive\n\n(6PM - 8AM) Lot 97\n\n(8PM - 2AM) Lot 78\n\n(6PM - 2AM) Lots 71A, 74A, 75, 76, 79, 81, 83, 84, 86, 88, 96, 96A, Douglass Deck, Corwin, and Gated lot 70 \n\n(6PM - 8AM) Lot 82\n\n(7:30PM - 2AM) 79A';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone D' &&
      campusSelected == 'College Avenue') {
    String displayStr =
        '(6PM - 2AM) Lots 13, 16, 20, 26, 30, 32, 33, 38, College Ave Deck \n\n(6PM - 8AM) Lot 13';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone L' &&
      campusSelected == 'Cook/Douglass') {
    String displayStr =
        '(6PM - 2AM) Lots 94, 95, 98A, and Lipman Drive\n\n(6PM-8AM) Lot 97\n\n(6PM - 2AM) Lots 71A, 74A, 75, 76, 79, 81, 83, 84, 86, 88, 96, 96A, Douglass Deck, Corwin and Gated lot 70\n\n(6PM - 8AM) Lot 82\n\n(7:30PM-2AM)  79A';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone L' &&
          campusSelected == 'Livingston' ||
      permitSelected == 'Commuter Zone L' && campusSelected == 'Livingston') {
    String displayStr =
        '(6AM - 2AM) Yellow\n\n(6PM - 2AM) Lots 107, 108, 109, 110, 111, 112, Scarlet, Green \n\n(6PM - 8AM) Lot 101';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Commuter Zone H' &&
      campusSelected == 'College Avenue') {
    String displayStr =
        '(6PM - 2AM) Lots 11, 13, 16, 20, 26, 30, 32, 33, 38, College Ave Deck \n\n(6PM - 8AM) Lot 13';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Night Commuter' &&
      campusSelected == 'Cook/Douglass') {
    String displayStr =
        '(4PM - 2AM) Lots 94, 95, 98A, 98B, Douglass Deck and Lipman Drive\n\n(4PM - 8AM) Lot 82, 97\n\n(4PM - 2AM) Lots 71A, 74A, 75, 76, 79, 81, 83, 84, 86, 88, 96, 96A, Douglass Deck, Corwin and Gated lot 70 \n\n(7:30PM - 2AM)  79A';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Night Commuter' &&
      campusSelected == 'College Avenue') {
    String displayStr =
        '(4PM - 2AM) Lots 11A, 13, 16, 20, 26, 30, 32, 33, 38, College Ave Deck \n\n(4PM - 8AM) Lot 13';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Night Commuter' && campusSelected == 'Busch') {
    String displayStr =
        '(4PM - 2AM) Lots 51, 51A, 51B, 53A, 54A, 58, 58A, 59, 60A, 60B, 61, 63, 63A, 63B, 63C, 64, 66B, 68, Stadium West Lot and Gated Lot 55 \n\n(4PM - 8AM) Lot 67\n\n(8PM - 2AM) Lot 50';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Night Commuter' &&
      campusSelected == 'Livingston') {
    String displayStr =
        '(4PM - 2AM) Lots 107, 108, 109, 110, 111, 112, Scarlet, Green and Yellow\n\n(4PM - 8AM) Lot 101';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Resident' && campusSelected == 'Livingston') {
    String displayStr =
        'LIV Assignment (24 hours) Lots 103 and 105 \n\n(8PM-2AM) Lots 101,103,105,107,108,109,110,111, 112, Scarlet, Green and Yellow ';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Resident' && campusSelected == 'Busch') {
    String displayStr =
        'BRS Assignment (24 hours) Lots 51, 58B & C, 62, 65A-D, 66A, 67, 67A, Johnson, Marvin, Nichols and Russell apartment lots\n\n(8PM - 2AM) Lot 50\n\n(8PM-2AM) Lots 51, 51A, 51B, 53A, 54, 54A, 55, 58, 58A, 59, 60A & B, 61, 63, 63A-C, 64, 66A, 67, 68 and Stadium West Lot \n\n(8PM-8AM) Lot 67';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Resident' &&
      campusSelected == 'Cook/Douglass') {
    String displayStr =
        '99 Assignment (24 hours) Lots 99A-D\n\nHel Assignment (24 hours) Helyar House lot\n\n(8PM-2AM) Lots 98A,98B, 99A-D and Lipman Drive \n\n(8:00PM-8:00AM) Lot 97 \n\n(8PM - 2AM) Lot 78\n\nGIB Assignment (24 hours) Lots 74 and 74A\n\nHND Assignment (24 hours) Lot 80\n\nJAM Assignment (24 hours) Corwin lots and lot 76\n\nKAT Assignment (24 hours) Katzenbach lot or lot 76\n\nLIP Assignment (24 hours) Lippincott lot or lot 76\n\nNLS Assignment (24 hours) Lot 76\n\n76 Assignments (24 hours)-Lot 76\n\n(8PM-2AM) Lots 70, 71A,74A,75,76,79, 79A,81,82,83,84,86,88,94,95,96,96A and Douglass deck \n\n(8:00PM-8:00AM) Lot 97,';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Resident' &&
      campusSelected == 'College Avenue') {
    String displayStr =
        '(8PM-2AM) Lots 11A,13,16,26,30,32,33, 38\n\n(8PM-8AM) Lots 13, 20 and the College Ave deck';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Visitor' && campusSelected == 'Busch') {
    String displayStr = '(8AM-2AM) Lot 48';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Visitor' && campusSelected == 'Livingston') {
    String displayStr =
        '30 Minute Parking Near Livingston Plaza\n\nWeekend Parking (Friday 5PM - Monday 6AM) Yellow Lot, Green Lot\n\nWeekday Parking (Monday - Friday: 4PM - 2AM) Lot 112A Rutgers Cinema Lot';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  } else if (permitSelected == 'Visitor' && campusSelected == 'Cook/Douglass') {
    String displayStr = '(8AM-2AM) Lot 808 Near the Ag Musuem';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneralPage(permitSelected, campusSelected, displayStr)));
  }
}

class GeneralPage extends StatelessWidget {
  final String permitSelected;
  final String campusSelected;
  Text display;
  GeneralPage(this.permitSelected, this.campusSelected, String displayStr) {
    display = Text(
      displayStr,
      style: TextStyle(
        fontFamily: 'Raleway',
        color: Colors.black,
        fontSize: 18.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$permitSelected $campusSelected',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        children: <Widget>[
          Divider(
            height: 8.0,
            color: Colors.transparent,
          ),
          Text(
            'Current Time: ${TimeOfDay.now().format(context)}',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 17.0,
            ),
          ),
          Divider(
            height: 8.0,
            color: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: Card(
                child: Container(
                  child: display,
                  padding: EdgeInsets.all(15.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  String url1 = 'https://maps.rutgers.edu/#/?lat=40.500753&lng=-74.447925&parking=true&sidebar=true&zoom=13';
  if (await canLaunch(url1)) {
    await launch(url1);
  } else {
    throw 'Could not launch $url1';
  }
}
