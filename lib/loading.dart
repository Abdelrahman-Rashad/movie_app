import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'models/movie.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<List<Movie>> _listsOfMovies = [];

  static final int currYear = DateTime.now().year - 1;
  static final int numOfVoters = 2000;

  final Map<String, String> apiUrl = {
    'Popular':
        'https://api.themoviedb.org/3/movie/popular?api_key=211e2356184c172d3fc0862dcf722ce0',
    'New':
        'https://api.themoviedb.org/3/discover/movie?api_key=211e2356184c172d3fc0862dcf722ce0&language=en-US&sort_by=release_date.desc&year=' +
            currYear.toString() +
            '&include_adult=false&include_video=false&page=1',
    'Top Rated':
        'https://api.themoviedb.org/3/discover/movie?api_key=211e2356184c172d3fc0862dcf722ce0&language=en-US&sort_by=vote_average.desc&vote_count.gte=' +
            numOfVoters.toString() +
            '&include_adult=false&include_video=false&page=1',
  };

  void _populateGenres() async {
    Map<int, String> genres = await _fetchGenreList();
    Movie.genres = genres;
  }

  void _populateAllMovies() async {
    final newMovies = await _fetchMovies(apiUrl['New']);
    final popularMovies = await _fetchMovies(apiUrl['Popular']);
    final topRatedMovies = await _fetchMovies(apiUrl['Top Rated']);
    _listsOfMovies.add(popularMovies);
    _listsOfMovies.add(newMovies);
    _listsOfMovies.add(topRatedMovies);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'listsOfMovies': _listsOfMovies,
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

  Future<List<Movie>> _fetchMovies(String requestUrl) async {
    print('waiting');
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

  @override
  void initState() {
    super.initState();
    _populateGenres();
    _populateAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: SpinKitPouringHourglass(
            color: Theme.of(context).accentColor,
            size: 70.0,
            duration: const Duration(
              milliseconds: 700,
            ),
          ),
        ));
  }
}
