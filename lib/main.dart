import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// More examples see https://github.com/flutterchina/dio/tree/master/example
main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Response response;

  fetchData() async {
    response = await Dio().get('https://disease.sh/v3/covid-19/all');
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            response != null ? response.data['cases'].toString() : 'loading'),
      ),
    );
  }
}
