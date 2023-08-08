import 'package:flutter/material.dart';

class MovieDetailDialog extends StatelessWidget {
  final Map<String, dynamic> movieData;

  MovieDetailDialog(this.movieData);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(movieData['poster']),
          Text(movieData['movie']),
          // Add other movie details here
        ],
      ),
    );
  }
}
