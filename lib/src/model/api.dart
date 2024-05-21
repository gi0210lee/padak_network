import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:padak_network/src/model/response/comment_response.dart';
import 'package:padak_network/src/model/response/comments_response.dart';
import 'package:padak_network/src/model/response/movies_response.dart';
import 'package:padak_network/src/model/response/movie_response.dart';

Future<MovieResponse?> GetMovie(String movieId) async {
  // final uri =
  //     'http://padakpadak.run.goorm.io/movies?order_type=$selectedSortIndex';
  Uri uri = Uri.parse('http://localhost:3000/movie/$movieId');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    final responseJson = MovieResponse.fromJson(jsonData);
    return responseJson;
  } else {
    return null;
  }
}

Future<MoviesResponse?> GetMovies(int selectedSortIndex) async {
  // final uri =
  //     'http://padakpadak.run.goorm.io/movies?order_type=$selectedSortIndex';
  Uri uri = Uri.parse('http://localhost:3000/movies');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    final responseJson = MoviesResponse.fromJson(jsonData);
    switch (selectedSortIndex) {
      case 1:
        responseJson.movies
            .sort((a, b) => a.userRating.compareTo(b.userRating));
        break;
      case 2:
        responseJson.movies.sort((a, b) => a.date.compareTo(b.date));
        break;
      default:
        responseJson.movies
            .sort((a, b) => a.reservationRate.compareTo(b.reservationRate));
    }
    return responseJson;
  } else {
    return null;
  }
}

Future<List<Comment>> GetComment(String movieId) async {
  try {
    Uri uri = Uri.parse('http://localhost:3000/comment?movie_id=$movieId');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      List<Comment> responseJson =
          jsonData.map((e) => Comment.fromJson(e)).toList();
      return responseJson;
    }
    return [];
  } catch (error) {
    print(error);
    return [];
  }
}

Future<CommentsResponse?> GetComments(String movieId) async {
  Uri uri = Uri.parse('http://localhost:3000/comments?movie_id=$movieId');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    final responseJson = CommentsResponse.fromJson(jsonData);
    return responseJson;
  } else {
    return null;
  }
}

Future<bool> PostComment(Comment requestBody) async {
  try {
    Uri uri = Uri.parse('http://localhost:3000/comment');
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody.toMap()));
    print(response.statusCode);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (error) {
    print(error);
    return false;
  }
}
