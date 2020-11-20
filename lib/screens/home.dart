import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/helper/getColors.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';
import 'package:flutter_budget_ui/widgets/weeklySpending.dart';

import 'DetailPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 100,
            leading: IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Simple Budget",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return WeeklySpending();
                } else {
                  final category = categories[index - 1];
                  double totalAmountSpent = 0;
                  category.expenses.forEach((Expense expense) {
                    totalAmountSpent = totalAmountSpent + expense.cost;
                  });
                  double totalAmountLeft =
                      category.maxAmount - totalAmountSpent;
                  totalAmountLeft = totalAmountLeft < 0 ? 0 : totalAmountLeft;
                  final leftpercent = totalAmountLeft / category.maxAmount;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    category,
                                    leftpercent,
                                    totalAmountLeft,
                                  )));
                    },
                    child: Container(
                      height: 110,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                categories[index - 1].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '\$ ${totalAmountLeft.toStringAsFixed(2)} / \$ ${category.maxAmount}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) => Container(
                                  height: 25,
                                  width: constraints.maxWidth * leftpercent,
                                  decoration: BoxDecoration(
                                    color: getColor(leftpercent),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
              childCount: categories.length + 1,
            ),
          ),
        ],
      ),
    );
  }
}
