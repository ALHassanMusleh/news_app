import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.backGround = Colors.blue,
    this.isUpper = true,
    this.radius = 0,
  });

  final double width;
  final Color backGround;
  final String text;
  final void Function() onPressed;
  final bool isUpper;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backGround,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        height: 50,
        onPressed: onPressed,
        // onPressed: () {
        //   // print(emailController.text);
        //   // print(passwordController.text);
        //
        // },
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
