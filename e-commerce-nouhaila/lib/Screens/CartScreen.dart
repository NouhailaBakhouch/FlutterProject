import 'package:flutter/material.dart';
import 'package:mohammed/Widget/Cartwidget.dart';
import 'package:mohammed/Widget/ElevatedButton.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key}); // Point-virgule ajouté ici
  
  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.delete))],
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    body: Column(
      children: [
     ListView.builder(
        shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index){
        return Cartwidget();
      
      }),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('17.200.00 mad',style: TextStyle(fontSize: 22),),
          Elevatedwidget(color:Colors.blue , title: 'checkout', function:(){},)

        ],),
      )]
    ),);
  }
}
