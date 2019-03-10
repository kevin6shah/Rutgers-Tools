import 'package:flutter/material.dart';
import 'dininghall.dart';
import 'parking.dart';
import 'academic.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
      MaterialApp(home: MyApp()),
    );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<String> info = ['Info', 'Settings'];
  void action(String item) {
    debugPrint(item);
  }

  @override
  Widget build(BuildContext context) {
    var futureBuild = FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return wait(context);
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text(
                  '\nError: Not Connected To The Internet\n\n${snapshot.error}');
            return getLocations(context, snapshot);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Rutgers Dining Hall',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
        backgroundColor: Colors.red[900],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: action,
            itemBuilder: (context) {
              return info.map((String choice) {
                return PopupMenuItem<String>(
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black87,
          child: Column(
            children: <Widget>[
              Divider(
                color: Colors.transparent,
                height: 50.0,
              ),
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/rutgers.png'),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(35.0),
                ),
              ),
              Text(
                "Rutgers Tools",
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 20.0,
                  fontFamily: 'Raleway',
                  fontStyle: FontStyle.italic,
                  letterSpacing: 3.0,
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 5.0,
              ),
              Text(
                "Kevin Shah",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 15.0,
                  fontFamily: 'Raleway',
                  letterSpacing: 3.0,
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 25.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.local_dining,
                  color: Colors.red[900],
                ),
                title: Text('Rutgers Dining Hall',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                },
                contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              ),
              ListTile(
                leading: Hero(
                  tag: 'parking',
                  child: Icon(
                    Icons.local_parking,
                    color: Colors.blue[800],
                  ),
                  transitionOnUserGestures: true,
                ),
                title: Text('Rutgers Parking',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Parking()));
                },
                contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              ),
              ListTile(
                leading: Hero(
                  tag: 'academic',
                  child: Icon(
                    Icons.library_books,
                    color: Colors.cyan[800],
                  ),
                  transitionOnUserGestures: true,
                ),
                title: Text('Academic Calendar',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Academic()));
                },
                contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              ),
              ListTile(
                leading: Hero(
                  tag: 'Sakai',
                  child: Icon(
                    Icons.business_center,
                    color: Colors.amber[900],
                  ),
                  transitionOnUserGestures: true,
                ),
                title: Text('Sakai',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold)),
                onTap: () async {
                  if (await canLaunch(
                      "https://cas.rutgers.edu/login?service=https%3A%2F%2Fsakai.rutgers.edu%2Fsakai-login-tool%2Fcontainer")) {
                    await launch(
                        "https://cas.rutgers.edu/login?service=https%3A%2F%2Fsakai.rutgers.edu%2Fsakai-login-tool%2Fcontainer");
                  } else {
                    throw 'Could not launch https://cas.rutgers.edu/login?service=https%3A%2F%2Fsakai.rutgers.edu%2Fsakai-login-tool%2Fcontainer';
                  }
                },
                contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              ),
              ListTile(
                leading: Hero(
                  tag: 'BlackBoard',
                  child: Icon(
                    Icons.developer_board,
                    color: Colors.brown,
                  ),
                  transitionOnUserGestures: true,
                ),
                title: Text('Blackboard',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold)),
                onTap: () async {
                  if (await canLaunch(
                      "https://blackboard.rutgers.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_1_1")) {
                    await launch(
                        "https://blackboard.rutgers.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_1_1");
                  } else {
                    throw 'Could not launch https://blackboard.rutgers.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_1_1';
                  }
                },
                contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              ),
            ],
          ),
        ),
      ),
      body: futureBuild,
    );
  }
}

Widget wait(context) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red[700]),
    ),
  );
}
