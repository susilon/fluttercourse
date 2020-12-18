import 'package:flutter/material.dart';

Widget inputText(String _text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      decoration:
          InputDecoration(labelText: _text, border: OutlineInputBorder()),
    ),
  );
}

Widget inputTextTopLabel(String _text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_text),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(border: OutlineInputBorder()),
        )
      ],
    ),
  );
}

Widget inputTextLeftLabel(String _text,
    {TextEditingController controller,
    TextInputType keyboardType,
    FormFieldValidator validator,
    int maxLength,
    Function(String, String) callback}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      children: [
        Container(
          child: Text(_text),
          width: 100,
        ),
        Expanded(
          child: TextFormField(
              onSaved: (value) {
                print("$_text: $value");
                if (callback != null) callback(_text, value);
              },
              validator: validator,
              controller: controller,
              maxLength: maxLength,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(border: OutlineInputBorder()),
              keyboardType: keyboardType),
        )
      ],
    ),
  );
}
