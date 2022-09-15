// To parse this JSON data, do
//
//     final link = linkFromJson(jsonString);

import 'dart:convert';

Link linkFromJson(String str) => Link.fromJson(json.decode(str));

String linkToJson(Link data) => json.encode(data.toJson());

class Link {
    String? rlurl;
    String? species;

    Link({
        this.rlurl,
        this.species,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        rlurl: json["rlurl"],
        species: json["species"],
    );

    Map<String, dynamic> toJson() => {
        "rlurl": rlurl,
        "species": species,
    };
}