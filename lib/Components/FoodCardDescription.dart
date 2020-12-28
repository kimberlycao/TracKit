import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitchenventory/Models/Food.dart';
import 'package:intl/intl.dart';

enum QuantityType { individuals, bags, boxes, bundles, bottles }

class FoodCardDescription extends StatelessWidget {
  final DocumentSnapshot food;
  const FoodCardDescription({this.food}) : super();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(food['name'],
                      style:
                          TextStyle(fontSize: 22.0, color: Color(0xFF2D3447)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ),
                Text('${(food['quantity'])} ${(food['quantityType'])}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF2D3447))),
                Text('${'Best before:'} ${food['bestBeforeDate']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF2D3447))),
              ],
            ))
      ],
    );
  }
}

// ignore: missing_return
String quantityTypeToString(QuantityType quantityType) {
  switch (quantityType) {
    case QuantityType.individuals:
      return "Individuals";
    case QuantityType.bags:
      return "Bags";
    case QuantityType.boxes:
      return "Boxes";
    case QuantityType.bundles:
      return "Bundles";
    case QuantityType.bottles:
      return "Bottles";
  }
}
