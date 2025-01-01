import 'package:flutter/material.dart';
import 'package:mohammed/Screens/Add_product.dart';
import 'package:mohammed/Screens/Login.dart';
import 'package:mohammed/Widget/ElevatedButton.dart';
import 'package:mohammed/Widget/listtilewidget.dart';

class Profilescreen extends StatefulWidget{
  const Profilescreen({super.key});
  
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
   }

class _ProfileScreenState extends State<Profilescreen>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text('name',style: TextStyle(fontSize: 20),)
            ,Text('Mohamed.nouhaila@email.com',style: TextStyle(fontSize: 20),)
          ,  SizedBox(height:30,)
           , Listtilewidget(title: 'Orders', icon: Icons.request_page, function:(){} ,)
         ,  Divider(color: Colors.grey[300],thickness: 1,)
           , Listtilewidget(title: 'favorite', icon: Icons.favorite, function:(){} ,)
           ,  Divider(color: Colors.grey[300],thickness: 1,)
            , Listtilewidget(title: 'add product', icon: Icons.add, function:(){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddProduct(),
             ));

            } ,)
            ,SizedBox(height: 50,)
          
        , SizedBox(
          width: double.infinity,
          child: Elevatedwidget(color: Colors.grey,function: (){},title: 'Sign out',))],
        ),
        ),
      ),
    )
    );
  }

}
  
