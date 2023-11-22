import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function onPressed;
  final String text;  
  const CustomButton({

    Key? key,
    required this.formKey,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.pink,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),

      )
      ,
      onPressed: () {
        final form = formKey.currentState;
        if (form != null && form.validate()) {
          onPressed(
          
          );
        }
      },
      child: Text(text),
    );
  }

}