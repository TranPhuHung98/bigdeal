import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String message;
  final String token_type;
  final String access_token;
  final bool status;
  final String expires_in;
  User(
      {this.message,
      this.expires_in,
      this.token_type,
      this.access_token,
      this.status});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      message: json['message'],
      expires_in: json['expires_in'],
      token_type: json['token_type'],
      access_token: json['access_token'],
      status: json['status'],
    );
  }
}

class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  List<User> list = List();
  var isLoading = false;
  var _message;
  @override
  initState() {
    super.initState();
    isLoading = false;
    _fetchData();
  }

  Future<User> _fetchData() async {
    var header = {"Content-Type": "application/x-www-form-urlencoded"};
    var body = {
      "grant_type": "password",
      "client_id": "4",
      "client_secret": "zGSTyJyXTMXFGQok1aLXA3tU8zO8ShtS16RcKEtN",
      "email": "tranphuhung98@gmail.com",
      "password": "123123",
    };
    final response = await http.post(
        "https://bigdeal.stdiohue.com/api/v1/login",
        headers: header,
        body: body);
    // print(response.body);
    // http.head(url)
    if (response.statusCode == 200) {
      // list = (json.decode(response.body) as List)
      //     .map((data) => new User.fromJson(data))
      //     .toList();
      User.fromJson(json.decode(response.body));

      setState(() {
        isLoading = false;
        _message = response.body;
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: RaisedButton(
        //     child: new Text("Fetch Data"),
        //     onPressed: _fetchData,
        //   ),
        // ),
        body:
            // isLoading
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(_message ?? "message null")
                // FutureBuilder<User>(
                //   future: _fetchData(),
                //   builder: (context, snapshot) {
                //     print(snapshot);
                //     if (snapshot.hasError)
                //       return new Text('Error: ${snapshot.error}');
                //     else
                //       return new Text('Result: ${snapshot.data}');
                //     // if (snapshot.hasData)
                //     //   return Text(snapshot.data.message);
                //     // else if (snapshot.hasError)
                //     //   return Text("${snapshot.error}");

                //     // return Text('abc');
                //   },
                // ),
                )
        // ListView.builder(
        //     itemCount: list.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return ListTile(
        //         contentPadding: EdgeInsets.all(10.0),
        //         title: new Text(list[index].token_type),
        //         trailing: new Text(list[index].expires_in),
        //       );
        //     }
        // )
        );
  }
}
