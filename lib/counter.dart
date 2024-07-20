




import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {

  final Map<String,int> _cartItems = {};

  Map<String,int> get cartItems => _cartItems;

  bool addToCart(String product){

    if(!_cartItems.containsKey(product)){
     _cartItems[product] = 1;
      notifyListeners();
      return true;
    }
     return false;
  }

  void removeItem(String product)
  {
    _cartItems.remove(product) ;
    notifyListeners();
  }

  void increaseQuantity(String product){
   if(_cartItems.containsKey(product)){
     _cartItems[product] = (_cartItems[product]! + 1);
   }
    notifyListeners();
  }
void decreaseQuantity(String product){
  if(_cartItems.containsKey(product) && _cartItems[product]! >1){
    _cartItems[product] = (_cartItems[product]! - 1);
  }
  notifyListeners();
}

}