import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/widgets/CirclePainter.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
  final Category category;
  final double totalAmountLeft;
  final double leftpercent;
  DetailPage(this.category, this.leftpercent, this.totalAmountLeft);
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: widget.category.expenses.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.all(20),
              height: 300,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomPaint(
                foregroundPainter: CirclePainter(
                  leftPercent: widget.leftpercent,
                ),
                child: Center(
                  child: Text(
                    "\$ ${widget.totalAmountLeft.toStringAsFixed(2)} / \$ ${widget.category.maxAmount.toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              height: 70,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('${widget.category.expenses[index - 1].name}'),
            );
          }
        },
      ),
    );
  }
}
