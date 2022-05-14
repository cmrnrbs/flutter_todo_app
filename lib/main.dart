import 'package:flutter/material.dart';
import 'package:flutter_todo_app/hero_widget.dart';
import 'package:flutter_todo_app/todo_detail.dart';
import 'package:flutter_todo_app/todo_widget.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Todo App",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: Center(
                child: Icon(
                  Icons.home_filled,
                  size: 22,
                  color: Colors.black54,
                ),
              ),
              width: 100,
            )),
            GradientDivider(
                isHorizontal: true,
                size: 100,
                thickness: 0.4,
                start: 0,
                end: 100,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black.withAlpha(0)],
                ),
                color: Colors.black),
            Expanded(
                child: Container(
              width: 100,
              child: Center(
                child: Icon(
                  Icons.calendar_today_outlined,
                  size: 22,
                  color: Colors.black54,
                ),
              ),
            )),
            GradientDivider(
                isHorizontal: true,
                size: 100,
                thickness: 0.4,
                start: 0,
                end: 100,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black.withAlpha(0)],
                ),
                color: Colors.black),
            Expanded(
                child: Container(
              width: 100,
              child: Center(
                child: Icon(
                  Icons.menu_rounded,
                  size: 24,
                  color: Colors.black54,
                ),
              ),
            ))
          ],
        ),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 0.4))),
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            height: 260,
            child: ListView(
              padding: const EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                TodoWidget(
                  heroTag: 'test',
                  itemIndex: 0,
                  itemColor: Colors.blue.shade900,
                ),
                TodoWidget(
                  heroTag: 'test1',
                  itemIndex: 1,
                  itemColor: Colors.red.shade900,
                ),
                TodoWidget(
                  heroTag: 'test2',
                  itemIndex: 2,
                  itemColor: Colors.yellow.shade900,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: false,
            onChanged: (value) => print(value),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            side: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        Text(
          'Deneme',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}

class GradientDivider extends StatelessWidget {
  final bool isHorizontal;
  final double size;
  final double thickness;
  final double start;
  final double end;
  final Gradient gradient;
  final Color color;

  const GradientDivider(
      {Key? key,
      required this.isHorizontal,
      required this.size,
      required this.thickness,
      required this.start,
      required this.end,
      required this.gradient,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? thickness : end,
      height: isHorizontal ? end : thickness,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        border: Border.all(color: Colors.transparent, width: 1),
      ),
    );
  }
}
