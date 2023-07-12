import 'package:flutter/material.dart';
import 'package:yeye_users_app/mainScreens/items_screen.dart';
import 'package:yeye_users_app/models/menus.dart';
import 'package:yeye_users_app/models/sellers.dart';

class MenusDesignWidget extends StatefulWidget
{
  Menus? model;
  BuildContext? context;

  MenusDesignWidget({this.model, this.context});

  @override
  State<MenusDesignWidget> createState() => _MenusDesignWidgetState();
}

class _MenusDesignWidgetState extends State<MenusDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemsScreen(model: widget.model)));
      },
      splashColor: Colors.pinkAccent,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 275,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

              Image.network(
                widget.model!.thumbnailUrl!,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5.0,),
              Text(
                widget.model!.menuInfo!,
                style: const TextStyle(
                  color: Colors.black87,
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
