// To parse this JSON data, do
//
//     final specie = specieFromJson(jsonString);

import 'dart:convert';

Specie specieFromJson(String str) => Specie.fromJson(json.decode(str));

String specieToJson(Specie data) => json.encode(data.toJson());

class Specie {
    String? name;
    List<Result>? result;

    Specie({
        this.name,
        this.result,
    });

    factory Specie.fromJson(Map<String, dynamic> json) => Specie(
        name: json["name"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    int? speciesId;
    String? taxonomicnotes;
    String? rationale;
    String? geographicrange;
    String? population;
    String? populationtrend;
    String? habitat;
    String? threats;
    String? conservationmeasures;
    String? usetrade;

    Result({
        this.speciesId,
        this.taxonomicnotes,
        this.rationale,
        this.geographicrange,
        this.population,
        this.populationtrend,
        this.habitat,
        this.threats,
        this.conservationmeasures,
        this.usetrade,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        speciesId: json["species_id"],
        taxonomicnotes: json["taxonomicnotes"],
        rationale: json["rationale"],
        geographicrange: json["geographicrange"],
        population: json["population"],
        populationtrend: json["populationtrend"],
        habitat: json["habitat"],
        threats: json["threats"],
        conservationmeasures: json["conservationmeasures"],
        usetrade: json["usetrade"],
    );

    Map<String, dynamic> toJson() => {
        "species_id": speciesId,
        "taxonomicnotes": taxonomicnotes,
        "rationale": rationale,
        "geographicrange": geographicrange,
        "population": population,
        "populationtrend": populationtrend,
        "habitat": habitat,
        "threats": threats,
        "conservationmeasures": conservationmeasures,
        "usetrade": usetrade,
    };
}