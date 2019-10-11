import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:extinction_species/services.dart';

class WebLink extends StatelessWidget {
  String name;
  WebLink({this.name});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getLink(name),
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
        // return _launchURL(context);
      },
    );
  }

  void _launchURL(BuildContext context) async {

  }
}