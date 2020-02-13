import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';


class ColorPickerDialog extends StatefulWidget {
  final Color selectedColor;

  const ColorPickerDialog({Key key, this.selectedColor}):super(key:key);

  @override
  _ColorPickerDialogState createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  ColorSwatch _mainColor;
  @override
  void initiate(){
    super.initState();

    _mainColor = !materialColors.contains(widget.selectedColor)
    ?Colors
        .blue // pre-select color if [widget.selectedColor] is not in main material colors palette
      :widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(6.0),
      title: Text("Color Picker"),
        content: MaterialColorPicker(
        selectedColor: _mainColor,
      allowShades: false,
      onMainColorChange: (color) => setState(() => _mainColor = color),
    ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: (){
            Navigator.of(context).pop(null);
          },
        ),
        FlatButton(
          child: Text('Submit'),
          onPressed: (){
            Navigator.of(context).pop(_mainColor);
          },
        )
      ],
    );
  }
}
