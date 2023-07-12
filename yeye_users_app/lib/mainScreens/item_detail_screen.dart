import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:yeye_users_app/widgets/app_bar.dart';
import '../assistantMethods/assistant_methods.dart';
import '../models/items.dart';

class ItemDetailScreen extends StatefulWidget
{
  final Items? model;
  ItemDetailScreen({this.model});

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen>
{
  TextEditingController counterTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.model!.sellerUID),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.model!.thumbnailUrl.toString()),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: NumberInputPrefabbed.roundedButtons(
              controller: counterTextEditingController,
              incDecBgColor: Color(0xFFF882A6),
              min: 1,
              max: 9,
              initialValue: 1,
              buttonArrangement: ButtonArrangement.incRightDecLeft,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.shortInfo.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.title.toString(),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ),

          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
          widget.model!.price.toString() + " ₺ " ,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
            ),

          const SizedBox(height: 10,),

          Center(
            child: InkWell(
              onTap: ()
              {
                int itemCounter= int.parse(counterTextEditingController.text);

                List<String> separateItemIDsList = separateItemIDs();

                   // 1- ürün zaten sepette mi kontrol eder

                separateItemIDsList.contains(widget.model!.itemID)
                    ? Fluttertoast.showToast(msg: "Ürün zaten sepette var.")
                    :
                     //2.add to cart
                    addItemToCart(widget.model!.itemID, context, itemCounter);
              },
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF882A6),
                        Color(0xFFFFBED7),
                      ],
                      begin:  FractionalOffset(0.0, 0.0),
                      end:  FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    )
                ),
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                child: const Center(
                  child:Text(
                  "Sepete Ekle",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
