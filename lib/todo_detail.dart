import 'package:flutter/material.dart';

import 'hero_widget.dart';
import 'indicator_todo_widget.dart';

class TodoDetail extends StatefulWidget {
  final String heroTag;
  const TodoDetail({Key? key, required this.heroTag}) : super(key: key);

  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late PageController pageController;
  int prevPage = 0;
  int initialPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(
      initialPage: initialPage,
    );
    scaleController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 400));
    scaleController.addListener(() {
      setState(() {});
    });
    scaleController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      IndicatorTodoWidget(
                        tag: 'test',
                        itemColor: Colors.blue.shade900,
                        index: 0,
                        currentPage: initialPage,
                      ),
                      IndicatorTodoWidget(
                        tag: 'test1',
                        itemColor: Colors.red.shade900,
                        index: 1,
                        currentPage: initialPage,
                      ),
                      IndicatorTodoWidget(
                        tag: 'test2',
                        itemColor: Colors.yellow.shade900,
                        index: 2,
                        currentPage: initialPage,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.scale(
                scale: scaleController.value,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red),
                  child: const Center(
                    child: Icon(
                      Icons.add_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Transform.scale(
                scale: scaleController.value,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, top: 60.0),
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      initialPage = value;
                    });
                  },
                  children: [
                    Container(
                      color: Colors.blue.shade900,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              HeroWidget(
                                tag: 'test0',
                                child: Text(
                                  'Trip to Paris',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.red.shade900,
                    ),
                    Container(
                      color: Colors.yellow.shade900,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeroWidget(
          tag: 'test0',
          child: SizedBox.expand(
            child: Text(
              'Trip to Paris',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            children: [
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Expanded(child: Container()),
            ],
          ),
        )
      ],
    );
  }
}
