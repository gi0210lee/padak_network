import 'package:flutter/material.dart';
import 'package:padak_network/src/detail_page.dart';
// import 'package:padak_network/src/model/data/dummys_repository.dart';
import 'package:padak_network/src/model/response/movies_response.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridPage extends StatefulWidget {
  List<Movie> movies;

  GridPage(this.movies, {super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  late List<Movie> _movies;
  // List<Movie> _movies = DummysRepository.loadDummyMovies();

  @override
  void initState() {
    super.initState();

    _movies = widget.movies;
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

  @override
  Widget build(BuildContext ontext) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: (9 / 16)),
      itemCount: _movies.length,
      itemBuilder: (context, index) => _buildGridItem(context, index: index),
    );
  }

  Widget _buildGridItem(BuildContext context, {required int index}) {
    Movie movie = _movies[index];
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: Stack(alignment: Alignment.topRight, children: [
              Image.network(
                movie.thumb,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: _buildGradeImage(movie.grade),
              ),
            ])),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
                '${movie.reservationGrade} 위 ( ${movie.userRating} ) / ${movie.reservationRate} %'),
            const SizedBox(height: 8),
            Text(movie.date)
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DetailPage(
            movieId: movie.id,
          ),
        ));
      },
    );
  }
}
