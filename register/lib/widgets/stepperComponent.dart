// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StepperComponent extends StatefulWidget {
  int index;
  int currentIndex;
  VoidCallback onTap;
  double progress;

  StepperComponent({
    Key? key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    required this.progress,
  }) : super(key: key);

  @override
  State<StepperComponent> createState() => _StepperComponentState();
}
  

class _StepperComponentState extends State<StepperComponent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: widget.index == 0
                    ? Expanded(
                        child: Container(
                          height: 5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100)),
                            color: Colors.pink,
                          ),
                        ),
                      )
                    : Expanded(
                        child: Container(
                          height: 5,
                          color: widget.currentIndex >= widget.index
                              ? Colors.pink
                              : Colors.black12,
                        ),
                      ),
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  width: width * 0.1,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: widget.progress == 1.0
                        ? Colors.pink
                        : widget.currentIndex >= widget.index
                            ? const Color.fromRGBO(228, 184, 198, 1)
                            : Colors.grey,
                    border: Border.all(
                      color: widget.currentIndex >= widget.index
                          ? Colors.pink
                          : Colors.black12,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: width * 0.1,
                          height: height * 0.05,
                          child: CircularProgressIndicator(
                            value: widget.progress,
                            strokeWidth: 3.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              widget.progress == 1.0
                                  ? Colors.pink
                                  : Colors.pink,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '${widget.index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: widget.index == 2
                    ? Expanded(
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            color: widget.currentIndex == 2 &&
                                    widget.progress == 1.0
                                ? Colors.pink
                                : Colors.black12,
                          ),
                        ),
                      )
                    : Expanded(
                        child: Container(
                          height: 5,
                          color: widget.currentIndex >= widget.index + 1
                              ? Colors.pink
                              : Colors.black12,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
