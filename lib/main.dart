import 'package:flutter/material.dart';
import 'sum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<CartItem> cartItems = [];

  void addToCart(String item, int quantity) {
    setState(() {
      cartItems.add(CartItem(item, quantity));
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Items en el carrito:',
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: List.generate(cartItems.length, (index) {
                final cartItem = cartItems[index];
                return ListTile(
                  title: Text(cartItem.product, style: TextStyle(fontSize: 16)),
                  subtitle: Text('Cantidad: ${cartItem.quantity}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete), // Agregar un icono de eliminación
                    onPressed: () => removeFromCart(index),
                  ),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => addToCart('Producto 1', 1),
                  child: Text('Agregar Producto 1'),
                ),
                ElevatedButton(
                  onPressed: () => addToCart('Producto 2', 2),
                  child: Text('Agregar Producto 2'),
                ),
                ElevatedButton(
                  onPressed: () => addToCart('Producto 3', 1),
                  child: Text('Agregar Producto 3'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartSummary(cartItems)),
                );
              },
              child: Text('Ver Resumen del Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
