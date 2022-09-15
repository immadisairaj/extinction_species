// To parse this JSON data, do
//
//     final allSpecies = allSpeciesFromJson(jsonString);

import 'dart:convert';

AllSpecies allSpeciesFromJson(String str) => AllSpecies.fromJson(json.decode(str));

String allSpeciesToJson(AllSpecies data) => json.encode(data.toJson());

class AllSpecies {
    int? count;
    String? category;
    List<Result>? result;

    AllSpecies({
        this.count,
        this.category,
        this.result,
    });

    factory AllSpecies.fromJson(Map<String, dynamic> json) => AllSpecies(
        count: json["count"],
        category: json["category"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "category": category,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    int? taxonid;
    String? scientificName;
    String? subspecies;
    Rank? rank;
    String? subpopulation;

    Result({
        this.taxonid,
        this.scientificName,
        this.subspecies,
        this.rank,
        this.subpopulation,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        taxonid: json["taxonid"],
        scientificName: json["scientific_name"],
        subspecies: json["subspecies"] == null ? null : json["subspecies"],
        rank: json["rank"] == null ? null : rankValues.map[json["rank"]],
        subpopulation: json["subpopulation"] == null ? null : json["subpopulation"],
    );

    Map<String, dynamic> toJson() => {
        "taxonid": taxonid,
        "scientific_name": scientificName,
        "subspecies": subspecies == null ? null : subspecies,
        "rank": rank == null ? null : rankValues.reverse![rank!],
        "subpopulation": subpopulation == null ? null : subpopulation,
    };
}

enum Rank { SSP, VAR, SUBSP }

final rankValues = EnumValues({
    "ssp.": Rank.SSP,
    "subsp.": Rank.SUBSP,
    "var.": Rank.VAR
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}