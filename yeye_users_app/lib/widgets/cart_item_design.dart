import 'package:flutter/material.dart';
import 'package:yeye_users_app/assistantMethods/assistant_methods.dart';

import '../models/items.dart';


class CartItemDesign extends StatefulWidget {

  final Items? model;
  BuildContext? context;
  final int? quanNumber;

  CartItemDesign({
    this.model,
    this.context,
    this.quanNumber,
});

  @override
  State<CartItemDesign> createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xFFFFBED7),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [

              Image.network(widget.model!.thumbnailUrl!, width: 140, height: 120,),

              const SizedBox(width: 6,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.model!.shortInfo!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: "Lobster",
                    ),

                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      const Text(
                        "x",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Lobster",
                        ),

                      ),
                      Text(
                        widget.quanNumber.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Lobster",
                        ),

                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const Text(
                        "Ücret: ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const Text(
                        "₺",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.model!.price.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
