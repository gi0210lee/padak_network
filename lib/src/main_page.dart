import "package:flutter/material.dart";
import "package:padak_network/src/grid_page.dart";
import "package:padak_network/src/list_page.dart";
import "package:padak_network/src/model/api.dart";
import "package:padak_network/src/model/response/movies_response.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  MoviesResponse? _moviesResponse;
  int _selectedTabIndex = 0;
  int _selectedSortIndex = 0;

  @override
  void initState() {
    super.initState();

    _requestMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_getMenuTitleBySortIndex(_selectedSortIndex)),
        actions: [_buildPopupMenubutton()],
      ),
      body: _buildPage(_selectedTabIndex, _moviesResponse),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'List', icon: Icon(Icons.view_list)),
          BottomNavigationBarItem(label: 'Grid', icon: Icon(Icons.grid_on)),
        ],
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
            print("$_selectedTabIndex TabClicked");
          });
        },
      ),
    );
  }

  String _getMenuTitleBySortIndex(int index) {
    switch (index) {
      case 0:
        return '예매율순';

      case 1:
        return '큐레이션';

      default:
        return '최신순';
    }
  }

  void _onSortMethodTap(index) {
    setState(() {
      _selectedSortIndex = index;

      switch (index) {
        case 0:
          print('예매율순');
          break;
        case 1:
          print('큐레이션');
          break;
        default:
          print('최신순');
      }
    });

    _requestMovies();
  }

  Widget _buildPopupMenubutton() {
    return PopupMenuButton(
        icon: const Icon(Icons.sort),
        onSelected: _onSortMethodTap,
        itemBuilder: (context) {
          return [
            const PopupMenuItem(value: 0, child: Text("예매율순")),
            const PopupMenuItem(value: 1, child: Text("큐레이션")),
            const PopupMenuItem(value: 2, child: Text("최신순")),
          ];
        });
  }

  void _responseMovies(MoviesResponse? response) {
    setState(() {
      _moviesResponse = response;
      print(_moviesResponse?.movies[0].title);
    });
  }

  void _requestMovies() async {
    setState(() {
      _moviesResponse = null;
    });

    final response = await GetMovies(_selectedSortIndex);
    _responseMovies(response);
  }
}

Widget _buildPage(index, moviesResponse) {
  Widget contentsWidget;

  if (moviesResponse == null) {
    contentsWidget = const Center(child: CircularProgressIndicator());
  } else {
    switch (index) {
      case 0:
        contentsWidget = ListPage(moviesResponse.movies);
        break;
      case 1:
        contentsWidget = GridPage(moviesResponse.movies);
        break;
      default:
        contentsWidget = Container();
    }
  }

  return contentsWidget;
}
