class CommentsResponse {
  String movieId = '';
  List<Comments> comments = [];
  String id = '';

  CommentsResponse(
      {required this.movieId, required this.comments, required this.id});

  CommentsResponse.fromJson(Map<String, dynamic> json) {
    movieId = json["movie_id"];
    if (json['comments'] != null) {
      comments = [];
      json['comments']
          .forEach((comment) => {comments.add(Comments.fromJson(comment))});
    }
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map["movie_id"] = movieId;
    map["comments"] = comments.map((comment) => comment.toMap()).toList();
    map["id"] = id;
    return map;
  }
}

class Comments {
  int rating = -1;
  String id = '';
  int timestamp = -1;
  String writer = '';
  String contents = '';
  String movieId = '';

  Comments({
    required this.rating,
    required this.id,
    required this.timestamp,
    required this.writer,
    required this.contents,
    required this.movieId,
  });

  Comments.fromJson(Map<String, dynamic> json) {
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
