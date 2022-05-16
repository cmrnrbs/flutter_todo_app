import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  bool isClickPop = false;
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
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        if (isClickPop) {
          Navigator.pop(context);
        }
      }
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
                  child: ListView.builder(
                    itemBuilder: (context, index) => IndicatorTodoWidget(
                        tag: widget
                                .todoInfo[index].todoHeroTag.containerHeroTag +
                            index.toString(),
                        itemColor: widget.todoInfo[index].itemColor,
                        index: index,
                        currentPage: initialPage,
                        isFirstOpen: isFirstOpen),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.todoInfo.length,
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
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: SvgPicture.asset(
                        'assets/document.svg',
                        width: 30,
                      ),
                    ),
                    Transform.scale(
                      scale: scaleController.value,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isClickPop = true;
                          });
                          scaleController.reverse();
                        },
                        child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Icon(
                              Icons.close,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 0, top: 80.0),
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
