import 'package:flutter/material.dart';
import 'package:training_program/main.dart';
import 'package:training_program/model/program.dart';
import 'package:training_program/pages/detail/detail_arguments.dart';
import 'package:training_program/pages/detail/design_course_app_theme.dart';

class DetailPage extends StatelessWidget {
  final double infoHeight = 364.0;

  final double opacity1 = 0.0;
  final double opacity2 = 0.0;
  final double opacity3 = 0.0;
  @override
  Widget build(BuildContext context) {
    DetailArguments arguments = ModalRoute.of(context).settings.arguments;
    TrainingProgram program = arguments.program;
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: Image.asset('assets/div1.jpg'),
            ),
          ],
        ),
        Positioned(
          top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: DesignCourseAppTheme.nearlyWhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(32.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: DesignCourseAppTheme.grey.withOpacity(0.5),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 15.0),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 8),
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: infoHeight,
                      maxHeight:
                          tempHeight > infoHeight ? tempHeight : infoHeight),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center, //may comment
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 18, right: 16),
                        child: Text(
                          "<${program.name}/>",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            letterSpacing: 0.30,
                            color: DesignCourseAppTheme.darkerText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 8, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "GHS ${program.price.toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                letterSpacing: 0.30,
                                color: DesignCourseAppTheme.nearlyBlue,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '4.3',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 22,
                                      letterSpacing: 0.27,
                                      color: DesignCourseAppTheme.grey,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: DesignCourseAppTheme.nearlyBlue,
                                    size: 25,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 26,
                            bottom:
                                100), //increased to increase height between price and others
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20),
                            getTimeBoxUI(program.duration, 'Classes'),
                            getTimeBoxUI('2hours', 'Time'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, bottom: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 48,
                              height: 48,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: DesignCourseAppTheme.nearlyWhite,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  border: Border.all(
                                      color: DesignCourseAppTheme.grey
                                          .withOpacity(0.2)),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: DesignCourseAppTheme.nearlyBlue,
                                  size: 28,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0),
                                      ),
                                    ),
                                    color: DesignCourseAppTheme.nearlyBlue,
                                    child: Center(
                                      child: Text(
                                        'Join Course',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          color:
                                              DesignCourseAppTheme.nearlyWhite,
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      bool shouldUpdate = await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // return object of type Dialog

                                            return AlertDialog(
                                              title: new Text(
                                                "Success",
                                                style: TextStyle(
                                                  color: DesignCourseAppTheme
                                                      .dark_grey,
                                                ),
                                              ),
                                              content: new Text(
                                                "You have succesfully joined this program",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  letterSpacing: 0.2,
                                                  color:
                                                      DesignCourseAppTheme.grey,
                                                ),
                                              ),
                                              actions: <Widget>[
                                                new FlatButton(
                                                  child: new Text("Go Back"),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyHomePage()),
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
          right: 35,
          child: Card(
            color: DesignCourseAppTheme.nearlyBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            elevation: 10.0,
            child: Container(
              width: 60,
              height: 60,
              child: Center(
                child: Icon(
                  Icons.favorite,
                  color: DesignCourseAppTheme.nearlyWhite,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SizedBox(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(AppBar().preferredSize.height),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: DesignCourseAppTheme.nearlyBlack,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 18.0),
      child: Container(
        width: 120,
        height: 80,
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: new BorderRadius.circular(13.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.deactivatedText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
