class MovieResponse {
  String actor = '';
  String date = '';
  String director = '';
  int audience = 0;
  int userRating = 0;
  String id = '';
  double reservationGrade = 0;
  int grade = 0;
  String title = '';
  String genre = "";
  String image = "";
  int duration = 0;
  String synopsis = "";
  double reservationRate = 0;

  // 생성자
  MovieResponse({
    required this.actor,
    required this.date,
    required this.director,
    required this.audience,
    required this.userRating,
    required this.id,
    required this.reservationGrade,
    required this.grade,
    required this.title,
    required this.genre,
    required this.image,
    required this.duration,
    required this.synopsis,
    required this.reservationRate,
  });

  // map -> json
  MovieResponse.fromJson(Map<String, dynamic> json) {
    actor = json["actor"];
    date = json["date"];
    director = json["director"];
    audience = json["audience"];
    userRating = json["user_rating"];
    id = json["id"];
    reservationGrade = json["reservation_grade"];
    grade = json["grade"];
    title = json["title"];
    genre = json["genre"];
    image = json["image"];
    duration = json["duration"];
    synopsis = json["synopsis"];
    reservationRate = json["reservation_rate"];
  }

  // object -> map
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    return map;
  }
}
