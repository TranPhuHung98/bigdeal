import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  ForgotPassScreenState createState() {
    return ForgotPassScreenState();
  }
}

class ForgotPassScreenState extends State<ForgotPassScreen> {
  final guideText = Container(
    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 30.0),
    child: Text('Mật khẩu mới sẽ được gửi đến email của bạn',style: TextStyle(fontSize: 15.0,color: Colors.black),),
  );

  final emailTextField = Container(
    padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 30.0),
    child: TextField(
      decoration: InputDecoration(
          // icon: Icon(Icons.perm_identity),
          hintText: 'Nhập email tại đây',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    ),
  );

  final sendEmailButton = Container(
    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
    child: Material(
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        color: Colors.green,
        minWidth: 200.0,
        height: 42.0,
        highlightColor: Colors.grey,
        child: Text(
          'ĐĂNG NHẬP',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        onPressed: () {},
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.fromLTRB(10.0, 210.0, 10.0, 200.0),
        child: Center(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                guideText,
                emailTextField,
                sendEmailButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}
