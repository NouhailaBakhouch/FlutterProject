import 'package:flutter/material.dart';
import 'package:mohammed/Widget/ElevatedButton.dart';

class ProductDetails extends StatelessWidget{
  const ProductDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
   final double height=MediaQuery.of(context).size.height;
       return SafeArea(
      child: Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 40,),
            Image.network('link'
         ,  width: double.infinity,
            height:height*0.5,)
    ,  Text('iphone',style: TextStyle(fontSize: 20),)
  ,  SizedBox(height: 25,)
 ,  Text('iphone pro max white',style: TextStyle(fontSize: 18),)
 
 ,Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text('4500.00',style: TextStyle(fontSize: 20),),
  Elevatedwidget(title: 'add to card',color: Colors.blue,function: (){},)
 ],)
  ],
        ),
      ),
          ),
    );
  }

}