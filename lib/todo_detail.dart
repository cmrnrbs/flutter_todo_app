import 'package:flutter/material.dart';
import 'models/todo.dart';
import 'todo_page.dart';

import 'indicator_todo_widget.dart';

class TodoDetail extends StatefulWidget {
  final String heroTag;
  final Todo todo;
  final int? currentPageIndex;
  final List<Todo> todoInfo;
  const TodoDetail(
      {Key? key,
      required this.heroTag,
      required this.todo,
      this.currentPageIndex = 0,
      required this.todoInfo})
      : super(key: key);

  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late PageController pageController;
  int prevPage = 0;
  int initialPage = 0;

  bool isFirstOpen = true;

  @override
  void initState() {
    // TODO: implement initState
    initialPage = widget.currentPageIndex!;
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
                          tag: 'test0',
                          itemColor: Colors.blue.shade900,
                          index: 0,
                          currentPage: initialPage,
                          isFirstOpen: isFirstOpen),
                      IndicatorTodoWidget(
                          tag: 'test1',
                          itemColor: Colors.red.shade900,
                          index: 1,
                          currentPage: initialPage,
                          isFirstOpen: isFirstOpen),
                      IndicatorTodoWidget(
                          tag: 'test2',
                          itemColor: Colors.yellow.shade900,
                          index: 2,
                          currentPage: initialPage,
                          isFirstOpen: isFirstOpen),
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
                child: PageView.builder(
                    itemBuilder: (context, index) {
                      return TodoPage(
                        index: index,
                        currentPage: initialPage,
                        todo: widget.todoInfo[index],
                      );
                    },
                    itemCount: widget.todoInfo.length,
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        initialPage = value;
                        isFirstOpen = false;
                      });
                    }))
          ],
        ),
      ),
    );
  }
}
