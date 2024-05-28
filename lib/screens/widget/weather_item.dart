
import 'package:flutter/material.dart';

// ignore: camel_case_types
class weatherItem extends StatelessWidget {
  const weatherItem({
    super.key,
    required this.value, required this.text, required this.unit, required this.imageUrl,
  });

  final int value;
  final String text;
  final String unit;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text, style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            color: Color(0xffE0E8FB),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Image.asset(imageUrl),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(value.toString() + unit, style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),)
      ],
    );
  }
}