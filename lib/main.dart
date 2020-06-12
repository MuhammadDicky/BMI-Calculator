import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/pages/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == ResultPage.routeName) {
          final ResultPageArg args = settings.arguments;

          return MaterialPageRoute(
            builder: (BuildContext context) {
              return ResultPage(
                bmiResult: args.bmiResult,
                status: args.status,
                interpretation: args.interpretation,
              );
            },
          );
        }

        assert(false, 'Not find route "${settings.name}"');
        return null;
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}
