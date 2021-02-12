import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/widgets/animation.dart';
import './widgets/movie_header.dart';
import './widgets/movie_info.dart';
import 'widgets/movie_list.dart';

import './models/movie.dart';
import './loading.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => MyApp(),
        '/movie': (context) => MovieInfo(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        accentColor: Colors.blue[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data = {}; //the data passed from loading

  List<List<Movie>> _listsOfMovies = [];

  void _searchApi() async {
    // final response = await http.get(
    // 'http://api.serpstack.com/search?access_key=18703da74ea3cf4be4ae3b91c51e53b6&query=mcdonalds&output=json');
    //print('\n\n\n' + response.body);
    // var result = jsonDecode(response.body);
    // List list = result['organic_results'];
    // print(list[0]['url']);
  }

  @override
  void initState() {
    super.initState();

    //_searchApi();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    _listsOfMovies =
        _listsOfMovies.isNotEmpty ? _listsOfMovies : data['listsOfMovies'];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: CustomAnimation(widget: Text('Movies')),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CustomAnimation(
                widget: IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
          elevation: 0,
          bottom: TabBar(
            // indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(vertical: 10.0),
            tabs: [
              Text('Popular'),
              Text('New'),
              Text('Top Rated'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            MoviesList(movies: _listsOfMovies[0]),
            MoviesList(movies: _listsOfMovies[1]),
            MoviesList(movies: _listsOfMovies[2]),
          ],
        ),
      ),
    );
  }
}
