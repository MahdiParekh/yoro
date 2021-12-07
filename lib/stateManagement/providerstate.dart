import 'package:flutter/material.dart';

class TestNotifier extends ChangeNotifier
{
  var x;
  var y;

  late double sliderValue = 5.0;

  Color pickerColor = Color(0xff443a49);



  chgXY(DraggableDetails d)
  {
    x = d.offset.dx;
    y = d.offset.dy;
    notifyListeners();
  }


  chgSliderValue(double s)
  {
    sliderValue = s;
    notifyListeners();
  }

  void changeColor(Color color) {

    pickerColor = color;
    notifyListeners();

  }
}