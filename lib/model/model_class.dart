
import 'dart:convert';

FilmsDetails? filmsDetailsFromJson(String str) => FilmsDetails.fromJson(json.decode(str));

String filmsDetailsToJson(FilmsDetails? data) => json.encode(data!.toJson());

class FilmsDetails {
    FilmsDetails({
        this.result,
        this.queryParam,
        this.code,
        this.message,
    });

    List<Result?>? result;
    QueryParam? queryParam;
    int? code;
    String? message;

    factory FilmsDetails.fromJson(Map<String, dynamic> json) => FilmsDetails(
        result: json["result"] == null ? [] : List<Result?>.from(json["result"]!.map((x) => Result.fromJson(x))),
        queryParam: QueryParam.fromJson(json["queryParam"]),
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x!.toJson())),
        "queryParam": queryParam!.toJson(),
        "code": code,
        "message": message,
    };
}

class QueryParam {
    QueryParam({
        this.category,
        this.language,
        this.genre,
        this.sort,
    });

    String? category;
    String? language;
    String? genre;
    String? sort;

    factory QueryParam.fromJson(Map<String, dynamic> json) => QueryParam(
        category: json["category"],
        language: json["language"],
        genre: json["genre"],
        sort: json["sort"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "language": language,
        "genre": genre,
        "sort": sort,
    };
}

class Result {
    Result({
        this.id,
        this.director,
        this.writers,
        this.stars,
        this.releasedDate,
        this.productionCompany,
        this.title,
        this.language,
        this.runTime,
        this.genre,
        this.voted,
        this.poster,
        this.pageViews,
        this.description,
        this.upVoted,
        this.downVoted,
        this.totalVoted,
        this.voting,
    });

    String? id;
    List<String?>? director;
    List<String?>? writers;
    List<String?>? stars;
    int? releasedDate;
    List<String?>? productionCompany;
    String? title;
    Language? language;
    int? runTime;
    String? genre;
    List<Voted?>? voted;
    String? poster;
    int? pageViews;
    String? description;
    List<String?>? upVoted;
    List<String?>? downVoted;
    int? totalVoted;
    int? voting;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        director: json["director"] == null ? [] : List<String?>.from(json["director"]!.map((x) => x)),
        writers: json["writers"] == null ? [] : List<String?>.from(json["writers"]!.map((x) => x)),
        stars: json["stars"] == null ? [] : List<String?>.from(json["stars"]!.map((x) => x)),
        releasedDate: json["releasedDate"],
        productionCompany: json["productionCompany"] == null ? [] : List<String?>.from(json["productionCompany"]!.map((x) => x)),
        title: json["title"],
        language: languageValues!.map[json["language"]],
        runTime: json["runTime"],
        genre: json["genre"],
        voted: json["voted"] == null ? [] : List<Voted?>.from(json["voted"]!.map((x) => Voted.fromJson(x))),
        poster: json["poster"],
        pageViews: json["pageViews"],
        description: json["description"],
        upVoted: json["upVoted"] == null ? [] : json["upVoted"] == null ? [] : List<String?>.from(json["upVoted"]!.map((x) => x)),
        downVoted: json["downVoted"] == null ? [] : json["downVoted"] == null ? [] : List<String?>.from(json["downVoted"]!.map((x) => x)),
        totalVoted: json["totalVoted"],
        voting: json["voting"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "director": director == null ? [] : List<dynamic>.from(director!.map((x) => x)),
        "writers": writers == null ? [] : List<dynamic>.from(writers!.map((x) => x)),
        "stars": stars == null ? [] : List<dynamic>.from(stars!.map((x) => x)),
        "releasedDate": releasedDate,
        "productionCompany": productionCompany == null ? [] : List<dynamic>.from(productionCompany!.map((x) => x)),
        "title": title,
        "language": languageValues.reverse![language],
        "runTime": runTime,
        "genre": genre,
        "voted": voted == null ? [] : List<dynamic>.from(voted!.map((x) => x!.toJson())),
        "poster": poster,
        "pageViews": pageViews,
        "description": description,
        "upVoted": upVoted == null ? [] : upVoted == null ? [] : List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": downVoted == null ? [] : downVoted == null ? [] : List<dynamic>.from(downVoted!.map((x) => x)),
        "totalVoted": totalVoted,
        "voting": voting,
    };
}

enum Language { KANNADA }

final languageValues = EnumValues({
    "Kannada": Language.KANNADA
});

class Voted {
    Voted({
        this.upVoted,
        this.downVoted,
        this.id,
        this.updatedAt,
        this.genre,
    });

    List<String?>? upVoted;
    List<dynamic>? downVoted;
    String? id;
    int? updatedAt;
    String? genre;

    factory Voted.fromJson(Map<String, dynamic> json) => Voted(
        upVoted: json["upVoted"] == null ? [] : List<String?>.from(json["upVoted"]!.map((x) => x)),
        downVoted: json["downVoted"] == null ? [] : List<dynamic>.from(json["downVoted"]!.map((x) => x)),
        id: json["_id"],
        updatedAt: json["updatedAt"],
        genre: json["genre"],
    );

    Map<String, dynamic> toJson() => {
        "upVoted": upVoted == null ? [] : List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": downVoted == null ? [] : List<dynamic>.from(downVoted!.map((x) => x)),
        "_id": id,
        "updatedAt": updatedAt,
        "genre": genre,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
