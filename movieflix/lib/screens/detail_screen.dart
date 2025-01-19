import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_services.dart';

class DetailScreen extends StatelessWidget {
  final MovieModel movie;
  late final Future<MovieDetailModel> movieDetail;

  DetailScreen({
    super.key,
    required this.movie,
  }) {
    movieDetail = ApiService.getMovieDeatilById(movie.id);
  }

  Widget buildRatingStars(double rating) {
    int fullStars = rating.floor(); // 정수 부분 (가득 찬 별)
    bool hasHalfStar = (rating - fullStars) >= 0.5; // 반 별 여부
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0); // 빈 별 개수

    return Row(
      children: [
        // 가득 찬 별
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: Colors.yellowAccent, size: 24),
        // 반 별
        if (hasHalfStar)
          Icon(Icons.star_half, color: Colors.yellowAccent, size: 24),
        // 빈 별
        for (int i = 0; i < emptyStars; i++)
          Icon(Icons.star_border, color: Colors.yellowAccent, size: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back to List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 320,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              FutureBuilder(
                future: movieDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var detail = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRatingStars(detail.voteAverage / 2),
                        SizedBox(height: 16),
                        Text(
                          detail.genres.map((genre) => genre.name).join(' | '),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withAlpha(205),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          detail.overview,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
}
