import 'package:flutter/material.dart';
import 'package:yeye_users_app/mainScreens/menus_screen.dart';
import 'package:yeye_users_app/models/sellers.dart';

class SellersDesignWidget extends StatefulWidget
{
  Sellers? model;
  BuildContext? context;

  SellersDesignWidget({this.model, this.context});

  @override
  State<SellersDesignWidget> createState() => _SellersDesignWidgetState();
}

class _SellersDesignWidgetState extends State<SellersDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MenusScreen(model: widget.model)));
      },
      splashColor: Colors.pinkAccent,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 275,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),

              Image.network(
                  widget.model!.sellerAvatarUrl!,
                  height: 220.0,
                  fit: BoxFit.cover,
              ),
              const SizedBox(height: 5.0,),
              Text(
                widget.model!.sellerName!,
                style: const TextStyle(
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                  fontFamily: "Lobster",
                ),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
