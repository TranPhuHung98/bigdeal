import 'package:big_deal/app_bloc.dart';
import 'package:big_deal/app_state.dart';
import 'package:big_deal/tabs/profile_tab/forgotpass_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  final AppBloc appBloc;

  const ProfileScreen({Key key, this.appBloc}) : super(key: key);

  @override
  ProfileScreenState createState() {
    // TODO: implement createState
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  int counter = 1;

  TextEditingController _userNameTextController;
  TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _userNameTextController = new TextEditingController();
    _passwordTextController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final login = Container(
      color: Colors.grey[300],
      padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 30.0),
      child: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    color: Colors.green,
                    onPressed: () {},
                  ),
                  MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    child: Text('Đăng kí', style: TextStyle(fontSize: 25.0)),
                    color: Colors.white30,
                    onPressed: (() {
                      setState(() {
                        counter = 2;
                      });
                    }),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 30.0),
                child: TextField(
                  controller: _userNameTextController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 15.0),
                child: TextField(
                  controller: _passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200.0, 10.0, 0.0, 0.0),
                child: FlatButton(
                  child: Text('Quên mật khẩu?',
                      style: TextStyle(color: Colors.blue[700])),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ForgotPassScreen()));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
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
                    onPressed: () {
                      if(_userNameTextController.text.isNotEmpty&&
                         _passwordTextController.text.isNotEmpty)
                         widget.appBloc.updateUser(
                           AppState(userName: _userNameTextController.text)
                         );
                      else Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Tài khoản hoặc mật khẩu không đúng'),
                            backgroundColor: Colors.black54,
                          ));
                      // Navigator.of(context).pushAndRemoveUntil(newRoute, predicate)
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                    '-----------------Đăng nhập bằng cách khác-----------------'),
              ),
            ],
          ),
        ),
      ),
    );

    final register = Container(
      color: Colors.grey[300],
      padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 40.0),
      child: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Button,
                  MaterialButton(
                    height: 50.0, minWidth: 150.0,
                    // animationDuration: Duration(seconds: 5),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    color: Colors.white30,
                    onPressed: (() {
                      setState(() {
                        counter = 1;
                      });
                    }),
                  ),
                  MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    child: Text('Đăng kí', style: TextStyle(fontSize: 25.0)),
                    color: Colors.green,
                    onPressed: (() {
                      setState(() {
                        counter = 2;
                      });
                    }),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 35.0),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 15.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 15.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'Confirm Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    color: Colors.green,
                    minWidth: 200.0,
                    height: 42.0,
                    highlightColor: Colors.grey,
                    child: Text(
                      'ĐĂNG KÍ',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Tài khoản hoặc mật khẩu không đúng')));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: counter == 1 ? login : register,
    );

    // if (counter == 1) {
    //   return Scaffold(
    //     body: Container(
    //       padding: EdgeInsets.fromLTRB(10.0, 60.0, 5.0, 0.0),
    //       child: Center(
    //         child: ListView(
    //           // mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 MaterialButton(
    //                   height: 50.0, minWidth: 150.0,
    //                   // animationDuration: Duration(seconds: 5),
    //                   child: Text(
    //                     'Đăng nhập',
    //                     style: TextStyle(fontSize: 25.0),
    //                   ),
    //                   color: Colors.white30,
    //                   onPressed: () {},
    //                 ),
    //                 MaterialButton(
    //                   height: 50.0, minWidth: 150.0,
    //                   // animationDuration: Duration(seconds: 5),
    //                   child: Text('Đăng kí', style: TextStyle(fontSize: 25.0)),
    //                   color: Colors.green,
    //                   onPressed: (() {
    //                     setState(() {
    //                       counter = 2;
    //                     });
    //                   }),
    //                 )
    //               ],
    //             ),
    //             SizedBox(
    //               height: 30.0,
    //             ),
    //             TextField(
    //               decoration: InputDecoration(
    //                   icon: Icon(Icons.perm_identity),
    //                   hintText: 'Email',
    //                   contentPadding:
    //                       EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(10.0))),
    //             ),
    //             SizedBox(
    //               height: 15.0,
    //             ),
    //             TextField(
    //               obscureText: true,
    //               decoration: InputDecoration(
    //                   icon: Icon(Icons.lock_outline),
    //                   hintText: 'Password',
    //                   contentPadding:
    //                       EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(10.0))),
    //             ),
    //             SizedBox(
    //               height: 10.0,
    //             ),
    //             Container(
    //               padding: EdgeInsets.fromLTRB(200.0, 0.0, 0.0, 0.0),
    //               child: FlatButton(
    //                 child: Text('Quên mật khẩu?',
    //                     style: TextStyle(color: Colors.blue[700])),
    //                 onPressed: () {},
    //               ),
    //             ),
    //             SizedBox(
    //               height: 20.0,
    //             ),
    //             Material(
    //               borderRadius: BorderRadius.circular(10.0),
    //               child: MaterialButton(
    //                 color: Colors.green,
    //                 minWidth: 200.0,
    //                 height: 42.0,
    //                 highlightColor: Colors.grey,
    //                 child: Text(
    //                   'ĐĂNG NHẬP',
    //                   style: TextStyle(color: Colors.white, fontSize: 20.0),
    //                 ),
    //                 onPressed: () {
    //                   Scaffold.of(context).showSnackBar(SnackBar(
    //                         content: Text(
    //                             '             Tài khoản hoặc mật khẩu không đúng'),
    //                         backgroundColor: Colors.black54,
    //                       ));
    //                 },
    //               ),
    //             ),
    //             SizedBox(
    //               height: 20.0,
    //             ),
    //             Center(
    //               child: Text(
    //                   '-----------------Đăng nhập bằng cách khác-----------------'),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
    // if (counter == 2) {
    //   return Scaffold(
    //     body: Container(
    //       padding: EdgeInsets.fromLTRB(10.0, 60.0, 5.0, 0.0),
    //       child: Center(
    //         child: ListView(
    //           children: <Widget>[
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 // Button,
    //                 MaterialButton(
    //                   height: 50.0, minWidth: 150.0,
    //                   // animationDuration: Duration(seconds: 5),
    //                   child: Text(
    //                     'Đăng nhập',
    //                     style: TextStyle(fontSize: 25.0),
    //                   ),
    //                   color: Colors.green,
    //                   onPressed: (() {
    //                     setState(() {
    //                       counter = 1;
    //                     });
    //                   }),
    //                 ),
    //                 MaterialButton(
    //                   height: 50.0, minWidth: 150.0,
    //                   // animationDuration: Duration(seconds: 5),
    //                   child: Text('Đăng kí', style: TextStyle(fontSize: 25.0)),
    //                   color: Colors.white30,
    //                   onPressed: (() {
    //                     setState(() {
    //                       counter = 2;
    //                     });
    //                   }),
    //                 ),
    //               ],
    //             ),
    //             SizedBox(
    //               height: 35.0,
    //             ),
    //             TextField(
    //               decoration: InputDecoration(
    //                   icon: Icon(Icons.perm_identity),
    //                   hintText: 'Email',
    //                   contentPadding:
    //                       EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(10.0))),
    //             ),
    //             SizedBox(
    //               height: 15.0,
    //             ),
    //             TextField(
    //               obscureText: true,
    //               decoration: InputDecoration(
    //                   icon: Icon(Icons.lock_outline),
    //                   hintText: 'Password',
    //                   contentPadding:
    //                       EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(10.0))),
    //             ),
    //             SizedBox(
    //               height: 15.0,
    //             ),
    //             TextField(
    //               obscureText: true,
    //               decoration: InputDecoration(
    //                   icon: Icon(Icons.lock_outline),
    //                   hintText: 'Confirm Password',
    //                   contentPadding:
    //                       EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(10.0))),
    //             ),
    //             SizedBox(
    //               height: 30.0,
    //             ),
    //             Material(
    //               borderRadius: BorderRadius.circular(10.0),
    //               child: MaterialButton(
    //                 color: Colors.green,
    //                 minWidth: 200.0,
    //                 height: 42.0,
    //                 highlightColor: Colors.grey,
    //                 child: Text(
    //                   'ĐĂNG KÍ',
    //                   style: TextStyle(color: Colors.white, fontSize: 20.0),
    //                 ),
    //                 onPressed: () {
    //                   //            Scaffold.of(context).showSnackBar(
    //                   //                SnackBar(content: Text('Tài khoản hoặc mật khẩu không đúng')));
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}
