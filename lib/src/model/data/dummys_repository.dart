import 'package:padak_network/src/model/response/comments_response.dart';
import 'package:padak_network/src/model/response/movie_response.dart';
import 'package:padak_network/src/model/response/movies_response.dart';

class DummysRepository {
  // 상세 데이터
  static MovieResponse loadDummyMovie(String movieId) => loadMovie(movieId);

  static MovieResponse loadMovie(String movieId) {
    final targetMovieResponse =
        movieResponses.firstWhere((movie) => movie.id == movieId);
    return targetMovieResponse;
  }

  // 영화 전체 목록
  static List<Movie> loadDummyMovies() => moviesResponse.movies;

  static MoviesResponse loadMovies(int orderType) {
    return moviesResponse;
  }

  // 댓글 목록
  static CommentsResponse loadDummyComments(String movieId) {
    return loadComments(movieId);
  }

  static CommentsResponse loadComments(String movieId) {
    final targetCommentsResponse =
        commentsResponses.firstWhere((movie) => movieId == movieId);
    return targetCommentsResponse;
  }

  static List<MovieResponse> movieResponses = <MovieResponse>[
    MovieResponse(
      actor: '하정우(강림), 차태현(자홍), 주지훈(해원맥), 김향기(덕춘)',
      date: '2017-12-20',
      director: '김용화',
      audience: 11676822,
      userRating: 10,
      id: '5a54c286e8a71d136fb5378e',
      reservationGrade: 1,
      grade: 12,
      title: '신과함께-죄와벌',
      genre: '판타지, 드라마',
      image:
          'https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/1.jpg',
      duration: 139,
      synopsis:
          '저승 법에 의하면, 모든 인간은 사후 49일 동안 7번의 재판을 거쳐야만 한다. 살인, 나태, 거짓, 불의, 배신, 폭력, 천륜 7개의 지옥에서 7번의 재판을 무사히 통과한 망자만이 환생하여 새로운 삶을 시작할 수 있다. \n\n “김자홍 씨께선, 오늘 예정 대로 무사히 사망하셨습니다” \n\n화재 사고 현장에서 여자아이를 구하고 죽음을 맞이한 소방관 자홍, 그의 앞에 저승차사 해원맥과 덕춘이 나타난다.\n자신의 죽음이 아직 믿기지도 않는데 덕춘은 정의로운 망자이자 귀인이라며 그를 치켜세운다.\n저승으로 가는 입구, 초군문에서 그를 기다리는 또 한 명의 차사 강림, 그는 차사들의 리더이자 앞으로 자홍이 겪어야 할 7개의 재판에서 변호를 맡아줄 변호사이기도 하다.\n염라대왕에게 천년 동안 49명의 망자를 환생시키면 자신들 역시 인간으로 환생시켜 주겠다는 약속을 받은 삼차사들, 그들은 자신들이 변호하고 호위해야 하는 48번째 망자이자 19년 만에 나타난 의로운 귀인 자홍의 환생을 확신하지만, 각 지옥에서 자홍의 과거가 하나 둘씩 드러나면서 예상치 못한 고난과 맞닥뜨리는데…\n\n누구나 가지만 아무도 본 적 없는 곳, 새로운 세계의 문이 열린다!',
      reservationRate: 35.5,
    ),
    MovieResponse(
      actor: '벤 애플렉(브루스 웨인/배트맨), 갤 가돗(다이애나 프린스)',
      date: '2017-11-15',
      director: '잭 스나이더',
      audience: 1363103,
      userRating: 7,
      id: '5a54c1e9e8a71d136fb5376c',
      reservationGrade: 2,
      grade: 12,
      title: '저스티스 리그',
      genre: '액션,모험,판타지,SF',
      image:
          'https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/2.jpg',
      duration: 120,
      synopsis:
          '인류의 수호자인 슈퍼맨이 사라진 틈을 노리고 ‘마더박스’를 차지하기 위해 빌런 스테픈울프가 악마군단을 이끌고 지구에 온다. 마더박스는 시간과 공간, 에너지, 중력을 통제하는 범우주적인 능력으로 행성의 파괴마저도 초래하는 물체로 이 강력한 힘을 통제하기 위해 고대부터 총 3개로 분리되어 보관되고 있던 것. 인류에 대한 믿음을 되찾고 슈퍼맨의 희생 정신에 마음이 움직인 브루스 웨인은 새로운 동료인 다이애나 프린스에게 도움을 청해 이 거대한 적에 맞서기로 한다. 배트맨과 원더 우먼은 새로이 등장한 위협에 맞서기 위해 아쿠아맨, 사이보그, 플래시를 찾아 신속히 팀을 꾸린다. 이들 슈퍼히어로 완전체는 스테픈울프로부터 마더박스를 지키기 위해 지구의 운명을 건 전투를 벌인다!',
      reservationRate: 12.63,
    ),
    MovieResponse(
      actor: '크리스 헴스워스(토르), 마크 러팔로(헐크), 톰 히들스턴(로키)',
      date: '2017-10-25',
      director: '타이카 와이티티',
      audience: 4653683,
      userRating: 9,
      id: '5a54c1f2e8a71d136fb5376e',
      reservationGrade: 3,
      grade: 12,
      title: '토르:라그나로크',
      genre: '액션, 모험, 판타지, SF',
      image:
          'https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/3.png',
      duration: 130,
      synopsis:
          '피할 수 없는 세상의 멸망 ‘라그나로크’를 막아라! 죽음의 여신 ‘헬라’가 아스가르드를 침략하고, 세상은 모든 것의 종말 ‘라그나로크’의 위기에 처한다. 헬라에게 자신의 망치마저 파괴당한 토르는 어벤져스 동료인 헐크와도 피할 수 없는 대결을벌이면서 절체절명의 위기에 빠지게 되는데…',
      reservationRate: 6.73,
    ),
    MovieResponse(
      actor: '시얼샤 로넌(마르그리트 가셰), 제롬 플린(가셰 박사)',
      date: '2017-11-09',
      director: '도로타 코비엘라, 휴 웰치맨',
      audience: 152523,
      userRating: 8,
      id: '5a54c1fbe8a71d136fb53770',
      reservationGrade: 4,
      grade: 15,
      title: '러빙 빈센트',
      genre: '애니메이션,미스터리',
      image:
          'https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/4.jpg',
      duration: 95,
      synopsis:
          "“당신은 그의 삶에 대해 무엇을 알죠?” 살아생전 단 한 점의 그림만을 팔았던 화가‘빈센트’의 죽음 후 1년. ‘아르망’은 그의 그림을 사랑했던 아버지의 부탁을 받고, ‘빈센트’가 마지막으로 살았던 장소로 찾아가 미스터리한 죽음을 추적해 나간다. ‘빈센트’를 그리워하는 여인 '마르그리트'. ‘빈센트’를 가장 가까운 곳에서 지켜봤던 ‘아들린’. ‘빈센트’의 비밀을 알고 있는 닥터 ‘폴 가셰’. ‘아르망’은 그들의 이야기를 듣고, 인간 ‘빈센트’에 대해 몰랐던 놀라운 사실들을 알게 되는데…",
      reservationRate: 3.82,
    ),
  ];

  static MoviesResponse moviesResponse = MoviesResponse(orderType: 0, movies: [
    Movie(
        title: '신과함계',
        userRating: 10,
        grade: 12,
        reservationGrade: 1,
        id: '5a54c286e8a71d136fb5378e',
        date: '2023-03-04',
        thumb:
            'https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/1.jpg',
        reservationRate: 35.5),
    Movie(
        title: '저스티스리그',
        userRating: 7,
        grade: 12,
        reservationGrade: 2,
        id: '5a54c1e9e8a71d136fb5376c',
        date: '2023-11-04',
        thumb:
            'https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/2.jpg',
        reservationRate: 23.5),
  ]);

  static List<CommentsResponse> commentsResponses = <CommentsResponse>[
    CommentsResponse(
        movieId: '5a54c286e8a71d136fb5378e',
        comments: [
          Comments(
              rating: 10,
              id: '5d891d9e1b865eef5c2ed96f',
              timestamp: 1569267102,
              writer: 'goodgoodred',
              contents: 'D',
              movieId: '5a54c286e8a71d136fb5378e'),
          Comments(
              rating: 5,
              id: '5d890e991b865eef5c2ed96a',
              timestamp: 1569267102,
              writer: 'goodgoodred',
              contents: 'D',
              movieId: '5a54c286e8a71d136fb5378e'),
        ],
        id: 'c44c'),
    CommentsResponse(
        movieId: '5a54c1e9e8a71d136fb5376c',
        comments: [
          Comments(
              rating: 5,
              id: '5d8884df1b865eef5c2ed967',
              timestamp: 1569180151,
              writer: '작가1',
              contents: '콘텐츠1',
              movieId: '5a54c1e9e8a71d136fb5376c'),
          Comments(
              rating: 8,
              id: '5d87c9f71b865eef5c2ed962',
              timestamp: 1569180151,
              writer: '체크맨',
              contents: '리그',
              movieId: '5a54c1e9e8a71d136fb5376c'),
        ],
        id: 'e8d3'),
  ];
}
