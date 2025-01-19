class MovieModel {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  // 무료 Dart 강의에서 배웠던 named constructor!
  // fromJson이라는 이름의 생성자를 만들어서 json을 파싱한다.
  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        genreIds = json['genre_ids'].cast<int>(),
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];
}

/*
JSON 데이터 예시:
{
  "adult": false,
  "backdrop_path": "/oHPoF0Gzu8xwK4CtdXDaWdcuZxZ.jpg",
  "genre_ids": [12, 10751, 16],
  "id": 762509,
  "original_language": "en",
  "original_title": "Mufasa: The Lion King",
  "overview": "Mufasa, a cub lost and alone, meets a sympathetic lion named Taka, the heir to a royal bloodline. The chance meeting sets in motion an expansive journey of a group of misfits searching for their destiny.",
  "popularity": 2784.981,
  "poster_path": "/jbOSUAWMGzGL1L4EaUF8K6zYFo7.jpg",
  "release_date": "2024-12-18",
  "title": "Mufasa: The Lion King",
  "video": false,
  "vote_average": 7.386,
  "vote_count": 753
},
*/
