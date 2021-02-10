import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './widgets/movie_header.dart';
import './widgets/movie_info.dart';
import './widgets/movie_widget.dart';

import './models/movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  List<Movie> _movies = [];

  void _populateAllMovies() async {
    final movies = await _fetchMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _fetchMovies() async {
    print('waiting');
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=211e2356184c172d3fc0862dcf722ce0');
    print('finished waiting');
    if (response.statusCode == 200) {
      print('here');
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      print('here');
      print(response.body);
      var returned = list.map((movie) => Movie.fromJson(movie)).toList();
      return returned;
    } else {
      print('Failed to load movies');
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        accentColor: Colors.blue[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: DefaultTabController(
      //   length: 3,
      // child: Scaffold(
      // appBar: AppBar(
      //   title: Padding(
      //       padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      //       child: Text('Movies')),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
      //       child: IconButton(
      //         icon: Icon(
      //           Icons.search_rounded,
      //         ),
      //         onPressed: () {},
      //       ),
      //     ),
      //   ],
      //   elevation: 0,
      //   bottom: TabBar(
      //     indicatorSize: TabBarIndicatorSize.label,
      //     labelPadding: EdgeInsets.symmetric(vertical: 10.0),
      //     tabs: [
      //       Text('Recommended'),
      //       Text('Recent'),
      //       Text('Popular'),
      //     ],
      //   ),
      // ),
      home: Scaffold(
          backgroundColor: Colors.white,
          // body: MovieWidget(movies: _movies),
          body: MovieInfo() //_movies[0]),
          // ),
          ),
    );
  }
}
