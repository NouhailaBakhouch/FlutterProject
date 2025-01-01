import 'package:flutter/material.dart';

class Elevatedwidget extends StatelessWidget{
  final String title;
  final Color color;
  final Function function;
  const Elevatedwidget({super.key, required this.title, required this.color, required this.function});
  
  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color
                      ),
                      onPressed: function()
                      ,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                
  }
  
}