import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.difficuty,
    required this.level,
  });

  final int difficuty;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                  color: Colors.white,
                  value: (difficuty > 0)
                      ? (level / difficuty) / 10
                      : 1)),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "Nível: $level",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}