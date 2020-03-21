import 'package:flutter/material.dart';
import 'package:training_program/model/program.dart';
import 'package:training_program/network/net.dart';
import 'package:training_program/pages/detail/detail.dart';
import 'package:training_program/program_tile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Training Program',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "WorkSans",
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(title: 'Training Program'),
        "/detail": (context) => DetailPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TrainingProgram> _programs = [];
  bool _loading = false;
  API _api;

  @override
  void initState() {
    super.initState();
    _api = API();
    _searchPrograms("");
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      Padding(
        padding: EdgeInsets.only(top: 36, left: 24, right: 24, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                Text("Welcome to Training Program"),
                Text(
                  "Heya,",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            ClipOval(
              child: Image.asset(
                "assets/div.jpg",
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 36),
        child: TextField(
          maxLines: 1,
          onChanged: (search) => _searchPrograms(search),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Search for program...",
          ),
        ),
      ),
    ];

    if (_loading) widgets.add(CircularProgressIndicator());
    if (!_loading) {
      widgets.add(Expanded(
        child: ListView.builder(
          itemCount: _programs.length,
          padding: EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 24),
          itemBuilder: (context, i) {
            return TrainingProgramTile(
              context: context,
              program: _programs[i],
            );
          },
        ),
      ));
    } else {
      widgets.add(Text("Searching"));
    }

    return Scaffold(
      body: Column(
        children: widgets,
      ),
    );
  }

  void _searchPrograms(String search) {
    Future.microtask(() async {
      setState(() => _loading = true);
      final response = await _api.searchTrainingPrograms(search);
      setState(() {
        _programs.clear();
        _programs.addAll(response.data);
        _loading = false;
      });
    });
  }
}
