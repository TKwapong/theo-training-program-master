import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_program/model/program.dart';
import 'package:training_program/pages/detail/detail_arguments.dart';

class TrainingProgramTile extends StatelessWidget {
  final TrainingProgram program;
  final BuildContext context;

  TrainingProgramTile({this.context, this.program});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Color(0xFF8FAFB),
        border: Border.all(color: Colors.black38, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            "/detail",
            arguments: DetailArguments(program),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                program.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    program.duration,
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    "GHS ${program.price.toString()}",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
