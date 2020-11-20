import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';

import 'bar.dart';

class WeeklySpending extends StatelessWidget {
  double maxAmount = 0;

  _buildBar() {
    weeklySpending.forEach((element) {
      if (element > maxAmount) {
        maxAmount = element;
      }
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Bar(
          maxAmount: maxAmount,
          spentAmount: weeklySpending[0],
          day: 'Su',
        ),
        Bar(
          maxAmount: maxAmount,
          spentAmount: weeklySpending[1],
          day: 'Mon',
        ),
        Bar(
          maxAmount: maxAmount,
          spentAmount: weeklySpending[2],
          day: 'Tue',
        ),
        Bar(
          maxAmount: maxAmount,
          spentAmount: weeklySpending[3],
          day: 'We',
        ),
        Bar(
          maxAmount: maxAmount,
          spentAmount: weeklySpending[4],
          day: 'Th',
        ),
        Bar(
          maxAmount: maxAmount,
          spentAmount: weeklySpending[5],
          day: 'Fr',
        ),
        Bar(
          maxAmount: maxAmount,
          spentAmount: weeklySpending[6],
          day: 'Sa',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
              Text(
                'Nov 10, 2019 - Nov 16, 2019',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {}),
            ],
          ),
          _buildBar(),
        ],
      ),
    );
  }
}
