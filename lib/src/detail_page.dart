import 'package:flutter/material.dart';
import 'package:padak_network/src/comment_page.dart';
import 'package:padak_network/src/model/api.dart';
import 'package:padak_network/src/model/response/comment_response.dart';
import 'package:padak_network/src/model/response/movie_response.dart';
import 'package:padak_network/src/widget/star_rating_bar.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final String movieId;

  const DetailPage({
    required this.movieId,
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String _movieId;
  late String _movieTitle;
  MovieResponse? _movieResponse;
  List<Comment> _commentResponse = [];

  // // 임시코드
  // _buildAfter() {
  //   Timer(const Duration(seconds: 1), () {
  //     setState(() {
  //       Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => CommentPage(
  //               title: _movieResponse?.title ?? 'No Data',
  //               id: _movieResponse?.id ?? 'No Data')));
  //     });
  // });
  // }

  @override
  void initState() {
    super.initState();

    _movieId = widget.movieId;
    // _movieResponse = DummysRepository.loadDummyMovie(_movieId);
    // _commentResponse = DummysRepository.loadDummyComments(_movieId);

    _requestMovies();
    _requestComments();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildMovieSummaryTextColumn() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _movieTitle,
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            '${_movieResponse?.date} 개봉',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            '${_movieResponse?.genre} / ${_movieResponse?.duration}분',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      );
    }

    Widget buildReservationRate() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            '예매율',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '${_movieResponse?.reservationGrade}위 ${_movieResponse?.reservationRate.toString()}%',
          ),
        ],
      );
    }

    Widget buildVerticalDivider() {
      return Container(width: 1, height: 50, color: Colors.grey);
    }

    Widget buildUserRating() {
      return Column(
        children: [
          const Text(
            '평점',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${_movieResponse?.userRating ?? 0 / 2}',
          ),
        ],
      );
    }

    Widget buildAudience() {
      final fmt = NumberFormat.decimalPattern();
      return Column(
        children: [
          const Text(
            '누적관객수',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(fmt.format(_movieResponse?.audience)),
        ],
      );
    }

    Widget buildMovieSummary() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                _movieResponse?.image ?? '',
                height: 180,
              ),
              const SizedBox(
                width: 10,
              ),
              buildMovieSummaryTextColumn(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildReservationRate(),
              buildVerticalDivider(),
              buildUserRating(),
              buildVerticalDivider(),
              buildAudience()
            ],
          )
        ],
      );
    }

    Widget buildMovieSynopsis() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 10,
          color: Colors.grey.shade400,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text(
            '줄거리',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Text(_movieResponse?.synopsis ?? ''),
        )
      ]);
    }

    Widget buildMovieCast() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 10,
          color: Colors.grey.shade400,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text(
            '감독/출연',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Column(
            children: [
              Row(children: [
                const Text(
                  '감독',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(_movieResponse?.director ?? ''),
              ]),
              const SizedBox(height: 5),
              Row(children: [
                const Text(
                  '출연',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(_movieResponse?.actor ?? ''))
              ]),
            ],
          ),
        )
      ]);
    }

    Future<void> presentCommentPage(BuildContext context) async {
      await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CommentPage(title: _movieTitle, id: _movieId)));
      _requestComments();
    }

    Widget buildCommentListItem({required Comment comment}) {
      String convertTimeStampToDateTime(int timestamp) {
        final fmt = DateFormat('yyyy-MM-dd HH:mm:ss');
        return fmt
            .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
      }

      return Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.person_pin),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(comment.writer),
                    const SizedBox(
                      width: 5,
                    ),
                    StarRatingBar(
                      rating: comment.rating.toInt(),
                      isUserInteractionEnabled: false,
                      size: 20,
                      onRatingChanged: (rating) {},
                    )
                  ],
                ),
                Text(convertTimeStampToDateTime(comment.timestamp)),
                const SizedBox(height: 5),
                Text(comment.contents)
              ],
            )
          ],
        ),
      );
    }

    Widget buildCommentListView() {
      Widget contentsWidget;

      if (_commentResponse == null) {
        contentsWidget = Container();
      } else {
        contentsWidget = ListView.builder(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(10),
          itemCount: _commentResponse!.length,
          itemBuilder: (_, index) =>
              buildCommentListItem(comment: _commentResponse![index]),
        );
      }
      return contentsWidget;
    }

    Widget buildComment() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 10,
            color: Colors.grey.shade400,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('한줄평',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () => presentCommentPage(context),
                  icon: const Icon(Icons.create),
                  color: Colors.blue,
                )
              ],
            ),
          ),
          buildCommentListView()
        ],
      );
    }

    Widget bulidContents() {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          buildMovieSummary(),
          buildMovieSynopsis(),
          buildMovieCast(),
          buildComment(),
        ]),
      );
    }

    Widget contentsWidget;
    if (_movieResponse == null) {
      contentsWidget = const Center(child: CircularProgressIndicator());
    } else {
      contentsWidget = Scaffold(
          appBar: AppBar(title: Text(_movieTitle)), body: bulidContents());
    }
    return contentsWidget;
  }

  void _requestMovies() async {
    final response = await GetMovie(_movieId);
    setState(() {
      _movieResponse = response;
      _movieTitle = _movieResponse?.title ?? 'No Data';
    });
  }

  void _requestComments() async {
    final response = await GetComment(_movieId);
    setState(() {
      _commentResponse = response;
    });
  }
}
