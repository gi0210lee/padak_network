class Comment {
  int rating = -1;
  String id = '';
  int timestamp = -1;
  String writer = '';
  String contents = '';
  String movieId = '';

  Comment({
    required this.rating,
    required this.id,
    required this.timestamp,
    required this.writer,
    required this.contents,
    required this.movieId,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    rating = json["rating"];
    id = json["id"];
    timestamp = json["timestamp"];
    writer = json["writer"];
    contents = json["contents"];
    movieId = json["movie_id"];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map["rating"] = rating;
    map["id"] = id;
    map["timestamp"] = timestamp;
    map["writer"] = writer;
    map["contents"] = contents;
    map["movie_id"] = movieId;
    return map;
  }
}
