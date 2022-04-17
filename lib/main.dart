import 'package:flutter/material.dart';
import 'package:hunger_zero/widgets/loginPage.dart';
import 'package:hunger_zero/widgets/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          headline3: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          bodyText1: TextStyle(
            fontSize: 48,
            color: Colors.white,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/2581_R0lVIEFOTiAxNzYtODg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'CREATE A HUNGER FREE WORLD',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 0),
                      child: Text(
                        'Chose any one',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 4,
                      indent: MediaQuery.of(context).size.width * .4,
                      endIndent: MediaQuery.of(context).size.width * .4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                          elevation: 0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Icon(
                            Icons.fastfood_rounded,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          child: Text(
                            'Donate',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Text(
                          'Donate your extra food',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.delivery_dining_rounded,
                            size: 30,
                          ),
                          elevation: 0,
                        ),
                        Container(
                          child: Text(
                            'NGO',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                        ),
                        Text(
                          'Pick up and delivery food',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
