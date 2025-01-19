import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_services.dart';
import 'package:movieflix/widgets/heading_text.dart';
import 'package:movieflix/widgets/movie_poster_popular.dart';
import 'package:movieflix/widgets/movie_poster_small.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movieflix 🍿",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 2,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                text: 'Popular Movies',
              ),
              homeScreenFutureBuilder(
                popularMovies,
                true,
              ),
              HeadingText(
                text: 'Now in Cinemas',
              ),
              homeScreenFutureBuilder(
                nowPlayingMovies,
                false,
              ),
              HeadingText(
                text: 'Coming Soon',
              ),
              homeScreenFutureBuilder(
                comingSoonMovies,
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<MovieModel>> homeScreenFutureBuilder(
      Future<List<MovieModel>> future, bool isPopular) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 300,
            child: isPopular
                ? makePopularMoviesList(snapshot)
                : makeSmallPosterMoviesList(snapshot),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  ListView makePopularMoviesList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return MoviePosterPopular(movie: movie);
      },
      separatorBuilder: (context, index) => SizedBox(width: 20),
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
    );
  }

  ListView makeSmallPosterMoviesList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return MoviePosterSmall(movie: movie);
      },
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }
}
