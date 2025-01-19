import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';

class MoviePosterPopular extends StatelessWidget {
  const MoviePosterPopular({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
