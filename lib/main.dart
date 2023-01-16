import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

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
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.amber),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Sleep Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Wake up fresh and energized',
                style: GoogleFonts.bebasNeue(fontSize: 50),
              ),
            ),
            Column(
              children: [
                const Text(
                  'What time do you want to wake up?',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
                      borderRadius: BorderRadius.circular(15)),
                  child: TimePickerSpinner(
                    itemWidth: 70,
                    normalTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 25),
                    highlightedTextStyle: const TextStyle(
                        color: Colors.amber,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    isForce2Digits: true,
                    is24HourMode: false,
                    onTimeChange: (time) {
                      setState(() {
                        datetime = time;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Calculate bed time',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                Text(datetime.minute.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
