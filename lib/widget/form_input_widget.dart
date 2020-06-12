import 'package:flutter/material.dart';

class FormInputWidget extends StatelessWidget {
  final String hintText;

  final String initText;

  final FormFieldValidator<String> validator;

  final FormFieldSetter<String> onSaved;

  FormInputWidget(this.hintText, {this.validator, this.onSaved, this.initText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextFormField(
        initialValue: initText ?? '',
        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(minWidth: 48, minHeight: 48),
          hintText: hintText,
          alignLabelWithHint: true,
          suffixIconConstraints: BoxConstraints(maxHeight: 48, minHeight: 48),
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.grey[400]),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        ),
        cursorColor: Colors.grey,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
