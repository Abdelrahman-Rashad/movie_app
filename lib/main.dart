import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/widgets/animation.dart';
import './widgets/movie_header.dart';
import './widgets/movie_info.dart';
import 'widgets/movie_list.dart';

import './models/movie.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        //'/' : (context) => Loading(),
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
  List<Movie> _movies = [];

  void _populateGenres() async {
    Map<int, String> genres = await _fetchGenreList();
    Movie.genres = genres;
  }

  void _populateAllMovies() async {
    final movies = await _fetchMovies('popular');
    setState(() {
      _movies = movies;
    });
  }

  Future<Map<int, String>> _fetchGenreList() async {
    Map<int, String> genres = {};
    String requestUrl =
        'https://api.themoviedb.org/3/genre/movie/list?api_key=211e2356184c172d3fc0862dcf722ce0&language=en-US';
    var response = await http.get(requestUrl);
    final responseDecoded = jsonDecode(response.body);
    //print(response.body);
    Iterable result = responseDecoded['genres'];
    //print(result.toString());
    result.forEach((genre) {
      genres[genre['id']] = genre['name'];
    });
    // print(genres[80]);
    return genres;
    //print(_genres.toString());
  }

  Future<List<Movie>> _fetchMovies(String apiKeyboard) async {
    print('waiting');
    String requestUrl = 'https://api.themoviedb.org/3/movie/' +
        apiKeyboard +
        '?api_key=211e2356184c172d3fc0862dcf722ce0';
    final response = await http.get(requestUrl);
    print('finished waiting');
    if (response.statusCode == 200) {
      print('here');
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      print('here');
      //print(response.body);
      var returned = list.map((movie) => Movie.fromJson(movie)).toList();
      return returned;
    } else {
      print('Failed to load movies');
      throw Exception('Failed to load movies');
    }
  }

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
    _populateGenres();
    _populateAllMovies();
    // fetchGenreList();
    //_searchApi();
  }

  @override
  Widget build(BuildContext context) {
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
              Text('Recommended'),
              Text('Recent'),
              Text('Popular'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: MoviesList(movies: _movies),
      ),
    );
  }
}
