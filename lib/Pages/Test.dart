import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yoro/stateManagement/providerstate.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  TextEditingController controller = new TextEditingController();

  final GlobalKey stackKey = GlobalKey();

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Consumer<TestNotifier>(builder: (context, notifier, child) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: context.read<TestNotifier>().pickerColor,
                            width: 10)),
                    child: Image.asset(
                      'images/tree.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                      key: stackKey,
                      left: context.read<TestNotifier>().x,
                      top: context.read<TestNotifier>().y,
                      child: Draggable(
                        child: Material(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.cyanAccent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: (10 *
                                        context
                                            .read<TestNotifier>()
                                            .sliderValue)),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Text'),
                                controller: controller,
                              ),
                            ),
                          ),
                        ),
                        feedback: Material(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.cyanAccent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: (10 *
                                        context
                                            .read<TestNotifier>()
                                            .sliderValue)),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Text'),
                                controller: controller,
                              ),
                            ),
                          ),
                        ),
                        childWhenDragging: Material(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.cyanAccent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                style: TextStyle(
                                    fontSize: (10 *
                                        context
                                            .read<TestNotifier>()
                                            .sliderValue)),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Text'),
                                controller: controller,
                              ),
                            ),
                          ),
                        ),
                        onDragEnd: (d) {
                          context.read<TestNotifier>().chgXY(d);
                        },
                      )),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 20,
                      margin: EdgeInsets.only(right: 10),
                      decoration: new BoxDecoration(
                          color: Colors.purple,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(5.0)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black38,
                                offset: new Offset(0.0, 2.0),
                                blurRadius: 10)
                          ]),
                      child: new Slider(
                        value: context.read<TestNotifier>().sliderValue,
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                        onChanged: (double s) {
                          context.read<TestNotifier>().chgSliderValue(s);
                        },
                        divisions: 10,
                        min: 0.0,
                        max: 10.0,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 60,
                      left: 30,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: context
                                        .read<TestNotifier>()
                                        .pickerColor,
                                    onColorChanged: context
                                        .read<TestNotifier>()
                                        .changeColor,
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          color: Colors.orange,
                          height: 50,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Change Border Color",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                      )),
                ],
              );
            })));
  }
}
