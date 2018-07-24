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
User({this.message, this.expires_in, this.token_type, this.access_token, this.status});

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
  List list ;
  var isLoading = false;
  
  @override
  void initState(){
    super.initState();
    this._fetchData();
  }

  Future<String> _fetchData() async {
    // setState(() {
    //   isLoading = true;
    // });
    var header = {
      "Content-Type":"application/x-www-form-urlencoded"
    };
    var body = {
      "grant_type":"password",
      "client_id":"4",
      "client_secret":"zGSTyJyXTMXFGQok1aLXA3tU8zO8ShtS16RcKEtN",
      "email":"tranphuhung98@gmail.com",
      "password":"123123",
    };
    final response =
        await http.post(
          Uri.encodeFull("https://bigdeal.stdiohue.com/api/v1/login"),
          headers: header,
          body: body
        );
        print(response.body);
    // http.head(url)
    if (response.statusCode == 200) {
      // list = (json.decode(response.body) as List)
      //     .map((data) => new User.fromJson(data))
      //     .toList();
      // User.fromJson(json.decode(response.body));
      setState(() {
        var convertDatatoJson = JSON.decode(response.body);
        list = convertDatatoJson['data'];
      });

      // setState(() {
      //   isLoading = false;
      // });
    } else {
      throw Exception('Failed to load users');
    }
    return "success";
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
              // Center(
              //   child: FutureBuilder<User>(
              //     future: _fetchData(),
              //     builder: (context,snapshot){
              //       if(snapshot.hasData) return Text(snapshot.data.message);
              //       else if (snapshot.hasError) return Text("${snapshot.error}");
              //       return CircularProgressIndicator();
              //     },
              //   ),
              // )
        // isLoading
            // ? Center(
                // child: CircularProgressIndicator(),
              // )
            // : 
            ListView.builder(
                itemCount: list == null ?0 : list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: new Text(list[index]["token_type"]),
                  );
                }
            )
    );
  }
}