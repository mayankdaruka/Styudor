import 'package:flutter/material.dart';
import 'login_page.dart';
import './models/user.dart';
import 'api.dart';
import 'user_builder.dart';
import 'style.dart';
import 'authentication.dart';
import 'usercode.dart';
import 'dashboard.dart';
import 'newuser_info.dart';

const LoginRoute = '/';
const AuthRoute = '/auth';
const PhoneAuthRoute = '/phoneauth';
const DashRoute = '/dashboard';
const NewUserRoute = '/newuser';
const EnterInfoRoute = '/enterinfo';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: _routes(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        // primarySwatch: Colors.red,
        textTheme: TextTheme(
          headline1: TitleTextStyle,
          headline2: Body1TextStyle,
          headline3: Body2TextStyle,
          headline4: Body3TextStyle,
          headline5: Body4TextStyle
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: "This is lit."),
      home: LoginPage(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch(settings.name) {
        case AuthRoute:
          screen = PhoneAuth();
          break;
        case LoginRoute:
          screen = LoginPage();
          break;
        case PhoneAuthRoute:
          screen = UserCode(arguments['number'], arguments['verId']);
          break;
        case DashRoute:
          screen = DashBoard(arguments['userId']);
          break;
        case NewUserRoute:
          screen = NewUserInfo();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<List<UserModel>> _users;

//   void initState() {
//     super.initState();
//     _users = getUsers();
//   }

//   void manageNewUser() async {
//     await newUser();
//     setState(() {
//       _users = getUsers();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       // body: Center(
//       //   // Center is a layout widget. It takes a single child and positions it
//       //   // in the middle of the parent.
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: <Widget>[
//       //       Text(
//       //         'You have pushed the button this many times:',
//       //       ),
//       //       Text(
//       //         '$_counter',
//       //         style: Theme.of(context).textTheme.headline4,
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       // body: UserList(_users),
//       body: LoginPage(),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: _incrementCounter,
//         onPressed: () => manageNewUser(),
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
