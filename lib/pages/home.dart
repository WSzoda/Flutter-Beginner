import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final Order _order = Order();

  String? _validateItemRequired(String value) {
    return value.isEmpty ? "Item required" : null;
  }

  String? _validateItemCount(String value) {
    int? valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
    return valueAsInteger == 0 ? 'At least one Item is Required' : null;
  }

  void _submitOrder() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState?.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Espresso',
                        labelText: 'Item',
                      ),
                      validator: (value) => _validateItemRequired(value!),
                      onSaved: (newValue) => _order.item = newValue!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: '3',
                        labelText: 'Quantity',
                      ),
                      validator: (value) => _validateItemCount(value!),
                      onSaved: (newValue) =>
                          _order.quantity = int.tryParse(newValue!)!,
                    ),
                    Divider(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () => _submitOrder(),
                      child: Text('Save'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  late String item;
  late int quantity;
}
