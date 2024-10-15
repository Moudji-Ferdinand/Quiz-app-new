import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_page.dart';
import 'package:adv_basics/results_page.dart';
import 'package:adv_basics/start_page.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activePage = 'start-page';

  // @override
  // void initState() {
  //   activePage = StartPage(switchPage);
  //   super.initState();
  // }

  void switchPage() {
    setState(() {
      activePage = 'questions-page';
    });
  }

  void restartQuiz() {
    setState(() {
      activePage = 'questions-page';
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activePage = 'results-page';
        //selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget pageWidget = StartPage(switchPage);

    if (activePage == 'questions-page') {
      pageWidget = QuestionsPage(chooseAnswer);
    } else if (activePage == 'results-page') {
      pageWidget =
          ResultsPage(chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
    } else {
      // Do Nothing
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 115, 17, 172),
              Color.fromARGB(255, 71, 7, 131)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: pageWidget,
        ),
      ),
    );
  }
}
