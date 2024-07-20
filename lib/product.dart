import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/counter.dart';

import 'cart.dart';




class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  List<String> listName = [
    "Apple","Shoes","Orange","Mobile","Laptop","Shirt","Hat"
  ];

  void addInCart(BuildContext context  , String product){
    bool added = Provider.of<CartProvider>(context,listen: false).addToCart(product);
    if(added){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("$product added to cart"),
            duration: const Duration(seconds: 2),
        )
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$product is already in the cart"),
            duration: const Duration(seconds: 2),
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Ecom"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Cart()));
              },
              icon: const Icon(Icons.shopping_cart,color: Colors.white,),
            ),
          )
        ],
      ),
      body:  ListView.builder(
          itemCount: listName.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(listName[index],style: const TextStyle(fontSize: 18,),),
                    trailing: TextButton(
                        onPressed: (){
                          addInCart(context,listName[index]);

                        },
                        child: const Text("Add",style: TextStyle(fontSize:14,color: Colors.green),)),
                  ),
                  const Divider(height: 1,color: Colors.black,)
                ],
              ),
            ) ;
          })
    );





  }
}
