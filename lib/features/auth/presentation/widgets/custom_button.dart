import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String type;
  final Function function;
  const CustomButton({
    super.key,
    required this.type,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        child: Text(
          type,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
