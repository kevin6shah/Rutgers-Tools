import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String url = 'https://rumobile.rutgers.edu/1/rutgers-dining.txt';
String campus;
String meal;

Widget getLocations(BuildContext context, AsyncSnapshot snapshot) {
  List<Location> data = snapshot.data;
  Location temp = data[2];
  data[2] = Location(
    locationName: 'Livingston',
    date: temp.date,
    meals: temp.meals,
  );

  return ScrollConfiguration(
    behavior: ScrollBehavior(),
    child: GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: Colors.red[700],
      child: Container(
        color: Colors.black87,
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: ListView(
          children: <Widget>[
            Divider(
              height: 8.0,
              color: Colors.transparent,
            ),
            GestureDetector(
              onTap: () {
                campus = "CollegeAve";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getMeals(data[0], context),
                  ),
                );
              },
              child: Container(
                constraints: BoxConstraints.tightFor(height: 250.0),
                child: Hero(
                  tag: 'Card',
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/brower.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 8.0,
              color: Colors.transparent,
            ),
            GestureDetector(
              onTap: () {
                campus = "Busch";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getMeals(data[1], context),
                  ),
                );
              },
              child: Container(
                constraints: BoxConstraints.tightFor(height: 250.0),
                child: Hero(
                  tag: 'Card1',
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/busch.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 8.0,
              color: Colors.transparent,
            ),
            GestureDetector(
              onTap: () {
                campus = "Livingston";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getMeals(data[2], context),
                  ),
                );
              },
              child: Container(
                constraints: BoxConstraints.tightFor(height: 250.0),
                child: Hero(
                  tag: 'Card2',
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/livingston.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 8.0,
              color: Colors.transparent,
            ),
            GestureDetector(
              onTap: () {
                campus = "CookDouglass";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getMeals(data[3], context),
                  ),
                );
              },
              child: Container(
                constraints: BoxConstraints.tightFor(height: 250.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/neilson.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 8.0,
              color: Colors.transparent,
            )
          ],
        ),
      ),
    ),
  );
}

Widget getMeals(Location location, context) {
  List<Meal> data = location.meals;

  return Scaffold(
    backgroundColor: Colors.grey[900],
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        location.locationName,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Raleway'),
      ),
      backgroundColor: Colors.deepPurple[900],
    ),
    body: ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.deepPurple[900],
        child: Container(
          padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: ListView(
            children: <Widget>[
              Divider(
                height: 8.0,
                color: Colors.transparent,
              ),
              GestureDetector(
                onTap: () {
                  meal = "Breakfast";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getGenre(data[0], context),
                    ),
                  );
                },
                child: Container(
                  constraints: BoxConstraints.tightFor(height: 250.0),
                  child: Hero(
                    tag: 'Card',
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/breakfast.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 8.0,
                color: Colors.transparent,
              ),
              GestureDetector(
                onTap: () {
                  meal = "Lunch";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getGenre(data[1], context),
                    ),
                  );
                },
                child: Container(
                  constraints: BoxConstraints.tightFor(height: 250.0),
                  child: Hero(
                    tag: 'Card1',
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/lunch.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 8.0,
                color: Colors.transparent,
              ),
              GestureDetector(
                onTap: () {
                  meal = "Dinner";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getGenre(data[2], context),
                    ),
                  );
                },
                child: Container(
                  constraints: BoxConstraints.tightFor(height: 250.0),
                  child: Hero(
                    tag: 'Card2',
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/dinner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 8.0,
                color: Colors.transparent,
              ),
              GestureDetector(
                onTap: () {
                  meal = "Knight";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getGenre(data[3], context),
                    ),
                  );
                },
                child: Container(
                  constraints: BoxConstraints.tightFor(height: 250.0),
                  child: Hero(
                    tag: 'Card3',
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/knightroom.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 8.0,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget getGenre(Meal meal, context) {
  List<Genre> data = meal.genres;

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        meal.mealName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Raleway',
        ),
      ),
      backgroundColor: Colors.indigo[900],
    ),
    body: ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.indigo[900],
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(data[index].genreName),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                getItems(data[index], context)));
                  },
                  contentPadding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                ),
                Divider(
                  height: 0.0,
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}

Widget getItems(Genre genre, context) {
  List<String> data = genre.items;

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        genre.genreName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Raleway',
        ),
      ),
      backgroundColor: Colors.blue[900],
    ),
    body: ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.blue[900],
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    data[index],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    _launchURL();
                  },
                  contentPadding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                ),
                Divider(height: 0.0),
              ],
            );
          },
        ),
      ),
    ),
  );
}

_launchURL() async {
  String url1 = null;
  if (campus == "Busch" && meal == "Breakfast")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?sName=Rutgers+University+Dining&locationNum=04&locationName=Busch+Dining+Hall&naFlag=1';
  if (campus == "Busch" && meal == "Lunch")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=04&locationName=Busch+Dining+Hall&dtdate=12/5/2018&mealName=Lunch&sName=Rutgers+University+Dining';
  if (campus == "Busch" && meal == "Dinner")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=04&locationName=Busch+Dining+Hall&dtdate=12/5/2018&mealName=Dinner&sName=Rutgers+University+Dining';
  if (campus == "Busch" && meal == "Knight")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=04&locationName=Busch+Dining+Hall&dtdate=12/5/2018&mealName=Knight+Room&sName=Rutgers+University+Dining';
  if (campus == "Livingston" && meal == "Breakfast")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?sName=Rutgers+University+Dining&locationNum=03&locationName=Livingston+Dining+Commons&naFlag=';
  if (campus == "Livingston" && meal == "Lunch")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=03&locationName=Livingston+Dining+Commons&dtdate=12/5/2018&mealName=Lunch&sName=Rutgers+University+Dining';
  if (campus == "Livingston" && meal == "Dinner")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=03&locationName=Livingston+Dining+Commons&dtdate=12/5/2018&mealName=Dinner&sName=Rutgers+University+Dining';
  if (campus == "Livingston" && meal == "Knight")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=03&locationName=Livingston+Dining+Commons&dtdate=12/5/2018&mealName=Knight+Room&sName=Rutgers+University+Dining';
  if (campus == "CollegeAve" && meal == "Breakfast")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?sName=Rutgers+University+Dining&locationNum=01&locationName=Brower+Commons&naFlag=1';
  if (campus == "CollegeAve" && meal == "Lunch")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=01&locationName=Brower+Commons&dtdate=12/5/2018&mealName=Lunch&sName=Rutgers+University+Dining';
  if (campus == "CollegeAve" && meal == "Dinner")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=01&locationName=Brower+Commons&dtdate=12/5/2018&mealName=Dinner&sName=Rutgers+University+Dining';
  if (campus == "CollegeAve" && meal == "Knight")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=01&locationName=Brower+Commons&dtdate=12/5/2018&mealName=Knight+Room&sName=Rutgers+University+Dining';
  if (campus == "CookDouglass" && meal == "Breakfast")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?sName=Rutgers+University+Dining&locationNum=05&locationName=Neilson+Dining+Hall&naFlag=1';
  if (campus == "CookDouglass" && meal == "Lunch")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=05&locationName=Neilson+Dining+Hall&dtdate=12/5/2018&mealName=Lunch&sName=Rutgers+University+Dining';
  if (campus == "CookDouglass" && meal == "Dinner")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=05&locationName=Neilson+Dining+Hall&dtdate=12/5/2018&mealName=Dinner&sName=Rutgers+University+Dining';
  if (campus == "CookDouglass" && meal == "Knight")
    url1 =
        'http://menuportal.dining.rutgers.edu/FoodPro/pickmenu.asp?locationNum=05&locationName=Neilson+Dining+Hall&dtdate=12/5/2018&mealName=Knight+Room&sName=Rutgers+University+Dining';
  if (url1 == null) return;
  if (await canLaunch(url1)) {
    await launch(url1);
  } else {
    throw 'Could not launch $url1';
  }
}

Future<List<Location>> getData() async {
  final response = await http.get('$url');
  return locationFromJson(response.body);
}

List<Location> locationFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Location>.from(jsonData.map((x) => Location.fromJson(x)));
}

String locationToJson(List<Location> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Location {
  String locationName;
  int date;
  List<Meal> meals;

  Location({
    this.locationName,
    this.date,
    this.meals,
  });

  factory Location.fromJson(Map<String, dynamic> json) => new Location(
        locationName: json["location_name"],
        date: json["date"],
        meals: new List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "location_name": locationName,
        "date": date,
        "meals": new List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  String mealName;
  bool mealAvail;
  List<Genre> genres;

  Meal({
    this.mealName,
    this.mealAvail,
    this.genres,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => new Meal(
        mealName: json["meal_name"],
        mealAvail: json["meal_avail"],
        genres: json["genres"] == null
            ? null
            : new List<Genre>.from(
                json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meal_name": mealName,
        "meal_avail": mealAvail,
        "genres": genres == null
            ? null
            : new List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  String genreName;
  List<String> items;

  Genre({
    this.genreName,
    this.items,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
        genreName: json["genre_name"],
        items: new List<String>.from(json["items"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "genre_name": genreName,
        "items": new List<dynamic>.from(items.map((x) => x)),
      };
}
