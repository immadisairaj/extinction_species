import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:extinction_species/services.dart';
import 'package:extinction_species/species/specie.dart';

class EachSpecieRoute extends StatelessWidget {
  String? name;
  int? id;
  Color? color;
  EachSpecieRoute({this.id, this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: FutureBuilder<Specie>(
          future: getSpecie(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Please Check Your Internet Connectivity and Try again",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 10.0, left: 10.0, right: 10.0),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          name!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (snapshot.data!.result![0].taxonomicnotes != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: snapshot.data!.result![0].taxonomicnotes,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].rationale != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Rationale: ' +
                                snapshot.data!.result![0].rationale!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].geographicrange != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Geographic Range: ' +
                                snapshot.data!.result![0].geographicrange!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].population != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Population: ' +
                                snapshot.data!.result![0].population!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].populationtrend != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Population Trend: ' +
                                snapshot.data!.result![0].populationtrend!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].habitat != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Habitat: ' +
                                snapshot.data!.result![0].habitat!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].threats != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Threats: ' +
                                snapshot.data!.result![0].threats!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].conservationmeasures != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Conservation Measures: ' +
                                snapshot.data!.result![0].conservationmeasures!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  if (snapshot.data!.result![0].usetrade != null)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Html(
                            data: 'Use Trade: ' +
                                snapshot.data!.result![0].usetrade!,
                            // defaultTextStyle: TextStyle(
                            //   fontSize: 18
                            // ),
                          ),
                        ),
                      ),
                    ),
                  FutureBuilder<String?>(
                    future: getLink(name),
                    builder: (context, snapshot1) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          child: ElevatedButton(
                              child: Text(
                                'know more',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              // color: Colors.white,
                              // elevation: 0.8,
                              onPressed: () async {
                                try {
                                  await launch(
                                    '${snapshot1.data}',
                                    // option: new CustomTabsOption(
                                    //   toolbarColor: color,
                                    //   enableDefaultShare: true,
                                    //   enableUrlBarHiding: true,
                                    //   showPageTitle: false,
                                    // ),
                                  );
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => WebLink(name: name)));
                              }),
                        );
                      return Container();
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
