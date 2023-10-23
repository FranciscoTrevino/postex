import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'sum.dart';

Future<void> addToCartAPI(String item, int quantity) async {
  final Uri uri = Uri.parse('https://tu-api-rest.com/add-to-cart'); // Reemplaza con la URL de tu API

  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'item': item, 'quantity': quantity}),
  );

  if (response.statusCode == 200) {
    // La solicitud se completó con éxito, puedes manejar la respuesta aquí
  } else {
    // La solicitud falló, maneja el error aquí
    print('Error: ${response.statusCode}');
    print('Cuerpo de la respuesta: ${response.body}');
  }
}

class CartItem {
  final String product;
  final int quantity;

  CartItem(this.product, this.quantity);
}

class CartSummary extends StatelessWidget {
  final List<CartItem> cartItems;

  CartSummary(this.cartItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen del Carrito'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Resumen del Carrito:',
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: cartItems
                  .map((cartItem) => ListTile(
                title: Text(cartItem.product, style: TextStyle(fontSize: 16)),
                subtitle: Text('Cantidad: ${cartItem.quantity}'),
              ))
                  .toList(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver al Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
