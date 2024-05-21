import 'dart:async';

import 'package:flutter/material.dart';
import 'package:padak_network/src/detail_page.dart';
// import 'package:padak_network/src/model/data/dummys_repository.dart';
import 'package:padak_network/src/model/response/movies_response.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListPage extends StatefulWidget {
  List<Movie> movies;

  ListPage(this.movies, {super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List<Movie> _movies;
  //  List<Movie> _movies = DummysRepository._loadDummyMovies();

  @override
  void initState() {
    super.initState();

    _movies = widget.movies;
  }

  Widget _buildListItem(Movie movie) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: NetworkImage(movie.thumb), height: 120),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            _buildGradeImage(movie.grade),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('평점: ${movie.userRating / 2}'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('예매순위: ${movie.reservationGrade}'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('예매율: ${movie.reservationRate}')
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text('개봉일: ${movie.date}')
                      ]))
            ]));
  }

  Widget _buildGradeImage(int grade) {
    switch (grade) {
      case 0:
        return SvgPicture.asset(
          'assets/images/ic_age_all.svg',
          height: 18,
        );
      case 12:
        return SvgPicture.asset('assets/images/ic_age_12.svg', height: 18);
      case 15:
        return SvgPicture.asset('assets/images/ic_age_15.svg', height: 18);
      case 19:
        return SvgPicture.asset('assets/images/ic_age_19.svg', height: 18);
      default:
        return SvgPicture.asset('');
    }
  }

  // 임시코드
  _buildAfter() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailPage(movieId: _movies[0].id)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) => const Divider(color: Colors.grey),
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: _buildListItem(_movies[index]),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => DetailPage(movieId: _movies[index].id)));
          },
        );
      },
    );
  }
}
