import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/counter.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Cart"),
      ),
      body: Consumer<CartProvider>(builder: (context,provider,child){

        return  provider.cartItems.isEmpty
            ? Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/emptyCart.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
            : ListView.builder(
          itemCount: provider.cartItems.length,
          itemBuilder: (context, index) {
            var productName = provider.cartItems.keys.elementAt(index);
            var quantity = provider.cartItems.values.elementAt(index);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                     productName,
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                             provider.decreaseQuantity(productName);
                          },
                          icon: const Icon(Icons.remove_rounded),
                        ),
                        Text(quantity.toString()),
                        IconButton(
                          onPressed: () {
                            provider.increaseQuantity(productName);
                          },
                          icon: const Icon(Icons.add_rounded),
                        ),
                        IconButton(
                          onPressed: () {

                            provider.removeItem(productName);


                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.black),
                ],
              ),
            );
          },
        );
      })

    );
  }
}

