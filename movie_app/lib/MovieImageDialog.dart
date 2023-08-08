import 'package:flutter/material.dart';

class MovieImageDialog extends StatelessWidget {
  final String imagePath;

  MovieImageDialog({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Image.asset(imagePath),
      ),
    );
  }
}