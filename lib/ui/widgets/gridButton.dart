import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final int number;
  const GridButton({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
