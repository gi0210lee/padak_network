class MoviesResponse {
  int orderType = -1;
  List<Movie> movies = [];

  MoviesResponse({
    required this.orderType,
    required this.movies,
  });

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((movie) => {movies.add(Movie.fromJson(movie))});
    }
    orderType = json['order_type'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['movies'] = movies.map((movie) => movie.toMap()).toList();
    map['order_type'] = orderType;
    return map;
  }
}

class Movie {
  String title = '';
  int userRating = -1;
  // 0 전체 12, 15, 19
  int grade = -1;
  int reservationGrade = -1;
  String id = '';
  String date = '';
  String thumb = '';
  double reservationRate = 0;

  Movie({
    required this.title,
    required this.userRating,
    required this.grade,
    required this.reservationGrade,
    required this.id,
    required this.date,
    required this.thumb,
    required this.reservationRate,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    userRating = json["user_rating"];
    grade = json["grade"];
    reservationGrade = json["reservation_grade"];
    id = json["id"];
    date = json["date"];
    thumb = json["thumb"];
    reservationRate = json["reservation_rate"];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map["title"] = title;
    map["user_rating"] = userRating;
    map["grade"] = grade;
    map["reservation_grade"] = reservationGrade;
    map["id"] = id;
    map["date"] = date;
    map["thumb"] = thumb;
    map["reservation_rate"] = reservationRate;
    return map;
  }
}
