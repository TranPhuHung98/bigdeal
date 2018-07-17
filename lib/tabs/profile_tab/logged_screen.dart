import 'package:flutter/material.dart';

class LoggedScreen extends StatefulWidget {
  @override
  LoggedScreenState createState() {
    return LoggedScreenState();
  }
}

class LoggedScreenState extends State<LoggedScreen> {

  final avatar = Container(
    padding: EdgeInsets.only(left: 120.0,right: 120.0,top: 30.0),
    child: CircleAvatar(backgroundImage: NetworkImage("https://k61.kn3.net/taringa/A/4/A/7/3/2/BanBananero/C65.jpg",),radius: 60.0,),
  );

  final name = Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: Center(
      child: Text('Trần Phú Hưng',style: TextStyle(fontSize: 20.0),),
    ),
  );

  final address = Container(
    child: Center(
      child: Text('27/143 Phan Bội Châu - Huế',style: TextStyle(fontSize: 15.0),)
    ),
  );

  final phoneNumber = Container(
    child: Center(
      child: Text('0123456789',style: TextStyle(fontSize: 15.0),)
    ),
  );

  final header = Container(
    child: UserAccountsDrawerHeader(
      accountName: Text(
        'Trần Phú Hưng',
        style: TextStyle(fontSize: 20.0),
      ),
      accountEmail: Text('naiheo123@gmail.com'),
      currentAccountPicture: Image.asset('images/flutter.jpg'),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      // currentAccountPicture: CircleAvatar(backgroundColor: Colors.amber,child: Text('H'),),
    ),
  );

  final settingButton = Container(
    padding: EdgeInsets.only(top: 30.0),
    child: ListTile(
      title: Text(
        'Cài đặt',
        style: TextStyle(height: 0.0, fontSize: 20.0),
      ),
      onTap: null,
      trailing: Icon(Icons.settings),
  ));

  final introduceButton = Container(
    child: ListTile(
      title: Text(
        'Giới thiệu',
        style: TextStyle(height: 0.0, fontSize: 20.0),
      ),
      onTap: null,
      trailing: Icon(Icons.info_outline),
    ),
  );

  final loggotButton = Container(
    child: ListTile(
      title: Text(
        'Đăng xuất',
        style: TextStyle(height: 0.0, fontSize: 20.0,color: Colors.red),
      ),
      onTap: null,
      trailing: Icon(Icons.chevron_right),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          avatar,
          name,
          address,
          phoneNumber,
          settingButton,
          Divider(height: 0.0,),
          introduceButton,
          Divider(height: 0.0),
          loggotButton
        ],
      ),
    );
  }
}
