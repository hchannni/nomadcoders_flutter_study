import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_services.dart';

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
            fontWeight: FontWeight.w600,
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
              Text(
                'Popular Movies',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 300,
                      child: makePopularMoviesList(snapshot),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Text(
                'Now in Cinemas',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 300,
                      child: makeNowPlayingMoviesList(snapshot),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Text(
                'Coming Soon',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 300,
                      child: makeComingSoonMoviesList(snapshot),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
      },
      separatorBuilder: (context, index) => SizedBox(width: 20),
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
    );
  }

  ListView makeNowPlayingMoviesList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 160,
              clipBehavior: Clip.hardEdge,
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
            ),
            SizedBox(height: 8),
            Text(
              movie.title.length > 20
                  ? '${movie.title.substring(0, 17)}...' // 글자 수 상한 적용
                  : movie.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }

  ListView makeComingSoonMoviesList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 160,
              clipBehavior: Clip.hardEdge,
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
            ),
            SizedBox(height: 8),
            Text(
              movie.title.length > 20
                  ? '${movie.title.substring(0, 17)}...' // 글자 수 상한 적용
                  : movie.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }
}
