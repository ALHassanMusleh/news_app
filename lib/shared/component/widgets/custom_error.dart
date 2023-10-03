import 'package:flutter/material.dart';

class CustomFail extends StatelessWidget {
  const CustomFail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.newspaper,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'No News yet,There is expected error',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
