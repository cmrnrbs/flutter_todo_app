import 'package:flutter/material.dart';

import 'hero_widget.dart';
import 'todo_detail.dart';

class TodoWidget extends StatefulWidget {
  final String heroTag;
  final int itemIndex;
  final Color itemColor;
  const TodoWidget(
      {Key? key,
      required this.heroTag,
      required this.itemIndex,
      required this.itemColor})
      : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TodoDetail(
                          heroTag: widget.heroTag,
                        )));
          },
          child: SizedBox(
              width: 160,
              child: Stack(
                children: [
                  HeroWidget(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: widget.itemColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: HeroWidget(
                      tag: widget.heroTag + widget.itemIndex.toString(),
                      child: Row(
                        children: [
                          Text(
                            'Trip to Paris',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
