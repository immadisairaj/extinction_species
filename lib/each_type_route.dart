import 'package:flutter/material.dart';
import 'package:extinction_species/each_specie_route.dart';
import 'package:extinction_species/services.dart';
import 'package:extinction_species/species/all_species.dart';

class EachTypeRoute extends StatelessWidget {
  String code;
  Color color;
  EachTypeRoute({this.code, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: FutureBuilder<AllSpecies> (
        future: getAllSpecies(code),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center (
              child: CircularProgressIndicator()
            );
          } else if (snapshot.hasError) {
            return Center (
              child: Padding (
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Please Check Your Internet Connectivity and Try again",
                  textAlign: TextAlign.center,
                  style: TextStyle (
                    fontSize: 45.0,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.result.length,
            itemBuilder: (context, position) {
              return Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EachSpecieRoute(name: snapshot.data.result[position].scientificName, id: snapshot.data.result[position].taxonid, color: color,)));
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 8.0, bottom: 8.0),
                      child: Text(
                        '${snapshot.data.result[position].scientificName}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}