import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Academic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: <Widget>[
          Hero(
            tag: 'academic',
            child: Icon(
              Icons.library_books,
              color: Colors.cyan[800],
            ),
            transitionOnUserGestures: true,
          ),
        ],
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text("Academic Calendar"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => picture(context),
              ),
            );
          },
          child: Card(
            child: Hero(
              tag: "Calendar",
              child: Image.asset("assets/AcademicCalendar.png"),
              transitionOnUserGestures: true,
            ),
            elevation: 7.0,
          ),
        ),
      ),
    );
  }
}

Widget picture(context) {
  return Scaffold(
    body: Center(
      child: PhotoView(
        imageProvider: AssetImage("assets/AcademicCalendar.png"),
        heroTag: "Calendar",
        minScale: PhotoViewComputedScale.contained,
        maxScale: 1.0,
      ),
    ),
  );
}
