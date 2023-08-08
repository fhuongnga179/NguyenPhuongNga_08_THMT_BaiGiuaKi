import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_card.dart';

class MovieImageDialog extends StatelessWidget {
  final String imagePath;
  final String movieName;

  MovieImageDialog({required this.imagePath, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200, // Adjust the width as needed
            height: 300, // Adjust the height as needed
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          Text(movieName)
        ],
      ),
    );
  }
}

final List<String> movieListBack = [
  'assets/images/bloodshot_back.jpg',
  'assets/images/dolittle_back.jpg',
  'assets/images/mulan_back.jpeg',
  'assets/images/sonic_back.jpg',
  'assets/images/the_call_of_the_wild_back.jpg',
  'assets/images/food5.jpg',
];

final List<Map<String, dynamic>> movieList = [
  {
    'movie': 'Bloodshot',
    'poster': 'assets/images/bloodshot.jpg',
  },
  {
    'movie': 'Dolittle',
    'poster': 'assets/images/dolittle.jpg',
  },
  {
    'movie': 'Mulan',
    'poster': 'assets/images/mulan.jpg',
  },
  {
    'movie': 'Sonic',
    'poster': 'assets/images/sonic.jpg',
  },
  {
    'movie': 'The call of the wild',
    'poster': 'assets/images/the_call_of_the_wild.jpg',
  },
  {
    'movie': 'Nguyen Phuong Nga',
    'poster': 'assets/images/food5.jpg',
  },
];

class FullscreenSliderDemo extends StatefulWidget {
  @override
  _FullscreenSliderDemoState createState() => _FullscreenSliderDemoState();
}

class _FullscreenSliderDemoState extends State<FullscreenSliderDemo> {
  CarouselController buttonCarouselController = CarouselController();
  ScrollController _scrollController = new ScrollController();

  void _showMovieDetailDialog(BuildContext context, Map<String, dynamic> movieData) {
    showDialog(
      context: context,
      builder: (context) => MovieImageDialog(
        imagePath: movieData['poster'],
        movieName: movieData['movie'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: movieListBack.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    image: DecorationImage(
                      image: ExactAssetImage(movieListBack[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                );
              },
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              aspectRatio: 2,
              viewportFraction: 0.68,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onScrolled: (data) {
                _scrollController.animateTo(
                  ((data! * 125 / movieListBack.length) / 100) *
                      _scrollController.position.maxScrollExtent,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 100),
                );
              },
            ),
            items: movieList.map((item) {
              return GestureDetector(
                onTap: () => _showMovieDetailDialog(context, item),
                child: Container(child: MovieCard(item)),
              );
            }).toList(),
          ),
        ],
      ),
      // ...
    );
  }
}