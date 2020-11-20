import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  double maxAmount;
  double spentAmount;
  String day;
  Bar(
      {@required this.maxAmount,
      @required this.spentAmount,
      @required this.day});

  @override
  Widget build(BuildContext context) {
    double percent = (spentAmount * 1) / maxAmount;
    return Column(
      children: [
        Text(
          '\$ ${spentAmount.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: percent * 200,
          width: 20,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5)),
        ),
        Text(
          '${day}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
