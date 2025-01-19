class Genres {
  final int id;
  final String name;

  Genres.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] ?? '';
}

class ProductionCompanies {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompanies.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        logoPath = json['logo_path'] ?? '',
        name = json['name'] ?? '',
        originCountry = json['origin_country'] ?? '';
}

class ProductionCountries {
  final String iso31661;
  final String name;

  ProductionCountries.fromJson(Map<String, dynamic> json)
      : iso31661 = json['iso_3166_1'] ?? '',
        name = json['name'] ?? '';
}

class SpokenLanguages {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguages.fromJson(Map<String, dynamic> json)
      : englishName = json['english_name'] ?? '',
        iso6391 = json['iso_639_1'] ?? '',
        name = json['name'] ?? '';
}

class MovieDetailModel {
  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genres> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountries> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguages> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'] ?? '',
        belongsToCollection = json['belongs_to_collection'],
        budget = json['budget'],
        genres =
            (json['genres'] as List).map((e) => Genres.fromJson(e)).toList(),
        homepage = json['homepage'] ?? '',
        id = json['id'],
        imdbId = json['imdb_id'] ?? '',
        originCountry = (json['origin_country'] as List).cast<String>(),
        originalLanguage = json['original_language'] ?? '',
        originalTitle = json['original_title'] ?? '',
        overview = json['overview'] ?? '',
        popularity = json['popularity'],
        posterPath = json['poster_path'] ?? '',
        productionCompanies = (json['production_companies'] as List)
            .map((e) => ProductionCompanies.fromJson(e))
            .toList(),
        productionCountries = (json['production_countries'] as List)
            .map((e) => ProductionCountries.fromJson(e))
            .toList(),
        releaseDate = json['release_date'] ?? '',
        revenue = json['revenue'],
        runtime = json['runtime'],
        spokenLanguages = (json['spoken_languages'] as List)
            .map((e) => SpokenLanguages.fromJson(e))
            .toList(),
        status = json['status'] ?? '',
        tagline = json['tagline'] ?? '',
        title = json['title'] ?? '',
        video = json['video'],
        voteAverage = (json['vote_average'] as num).toDouble(),
        voteCount = json['vote_count'];
}

/*
JSON Data Example:
{
  "adult": false,
  "backdrop_path": "/rDa3SfEijeRNCWtHQZCwfbGxYvR.jpg",
  "belongs_to_collection": null,
  "budget": 120000000,
  "genres": [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 12,
      "name": "Adventure"
    },
    {
      "id": 53,
      "name": "Thriller"
    }
  ],
  "homepage": "https://www.kravenmovie.com",
  "id": 539972,
  "imdb_id": "tt8790086",
  "origin_country": [
    "US"
  ],
  "original_language": "en",
  "original_title": "Kraven the Hunter",
  "overview": "Kraven Kravinoff's complex relationship with his ruthless gangster father, Nikolai, starts him down a path of vengeance with brutal consequences, motivating him to become not only the greatest hunter in the world, but also one of its most feared.",
  "popularity": 3297.244,
  "poster_path": "/i47IUSsN126K11JUzqQIOi1Mg1M.jpg",
  "production_companies": [
    {
      "id": 5,
      "logo_path": "/71BqEFAF4V3qjjMPCpLuyJFB9A.png",
      "name": "Columbia Pictures",
      "origin_country": "US"
    },
    {
      "id": 53462,
      "logo_path": "/nx8B3Phlcse02w86RW4CJqzCnfL.png",
      "name": "Matt Tolmach Productions",
      "origin_country": "US"
    },
    {
      "id": 14439,
      "logo_path": null,
      "name": "Arad Productions",
      "origin_country": "US"
    }
  ],
  "production_countries": [
    {
      "iso_3166_1": "US",
      "name": "United States of America"
    }
  ],
  "release_date": "2024-12-11",
  "revenue": 59184643,
  "runtime": 127,
  "spoken_languages": [
    {
      "english_name": "English",
      "iso_639_1": "en",
      "name": "English"
    },
    {
      "english_name": "Russian",
      "iso_639_1": "ru",
      "name": "Pусский"
    },
    {
      "english_name": "Turkish",
      "iso_639_1": "tr",
      "name": "Türkçe"
    }
  ],
  "status": "Released",
  "tagline": "Villains aren't born. They're made.",
  "title": "Kraven the Hunter",
  "video": false,
  "vote_average": 6.4,
  "vote_count": 568
}
*/
