import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OrderNowBtn extends StatefulWidget {
  final Product product;

  OrderNowBtn({
    super.key,
    required this.product,
  });

  @override
  _OrderNowBtnState createState() => _OrderNowBtnState();
}

class _OrderNowBtnState extends State<OrderNowBtn> {
  bool _spinner = false;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _spinner,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String name = '';
              String phoneNumber = '';
              String address = '';
              int quantity = 1;
              int totalAmount = widget.product.price * quantity;

              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                  padding: const EdgeInsets.all(16),
                  child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Name Input Field
                            TextField(
                              decoration: const InputDecoration(labelText: "Name"),
                              onChanged: (value) {
                                name = value;
                              },
                            ),
                            const SizedBox(height: 8),

                            // Phone Number Input Field
                            TextField(
                              decoration: const InputDecoration(labelText: "Phone Number"),
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                phoneNumber = value;
                              },
                            ),
                            const SizedBox(height: 8),

                            // Address Input Field
                            TextField(
                              decoration: const InputDecoration(labelText: "Address"),
                              onChanged: (value) {
                                address = value;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Quantity Selector
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Quantity:"),
                                IconButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                        totalAmount = widget.product.price * quantity;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(quantity.toString()),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                      totalAmount = widget.product.price * quantity;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Total Amount Display
                            Text(
                              "Total: \$$totalAmount",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),

                            // Pass Order Button
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _spinner = true;
                                });
                                try {
                                  await _firestore.collection('orders').add({
                                    'name': name,
                                    'phoneNumber': phoneNumber,
                                    'address': address,
                                    'quantity': quantity,
                                    'totalAmount': totalAmount,
                                    'orderTime': FieldValue.serverTimestamp(),
                                  });
                                  Navigator.pop(context);  // Close the dialog after saving the order
                                  // Optionally, show a confirmation message or navigate to a different screen
                                } catch (e) {
                                  // Handle error (e.g., show an error message)
                                  print('Error adding order: $e');
                                }
                                setState(() {
                                  _spinner = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor, // Background color of the button
                                foregroundColor: Colors.white, // Text color of the button
                              ),
                              child: const Text(
                                "Pass Order",
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor, // Background color of the button
          foregroundColor: Colors.white, // Text color of the button
        ),
        child: const Text(
          "Order Now",
          style: TextStyle(
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
