import 'package:flutter/material.dart';
import 'package:pedulee/pages/drawer.dart';

class MoneyDonationPage extends StatefulWidget {
    const MoneyDonationPage({super.key});

    @override
    State<MoneyDonationPage> createState() => _MoneyDonationPageState();
}

class _MoneyDonationPageState extends State<MoneyDonationPage> {
    final _formKey = GlobalKey<FormState>();
    String fullName = "";
    double age = 0;
    String paymentMethod = 'A';
    List<String> listPaymentMethod = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Money Donation'),
            ),
            // Menambahkan drawer menu
            drawer: drawerBuild(context),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                        children: [
                            Padding(
                                // Menggunakan padding sebesar 8 pixels
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Cicak Bin Kadal",
                                        labelText: "Name",
                                        // Menambahkan circular border agar lebih rapi
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    // Menambahkan behavior saat nama diketik 
                                    onChanged: (String? value) {
                                        setState(() {
                                            fullName = value!;
                                        });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                        setState(() {
                                            fullName = value!;
                                        });
                                    },
                                    // Validator sebagai validasi form
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Your name can't be empty!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.credit_card),
                              title: const Text('Payment Method'),
                              trailing: DropdownButton(
                                  value: paymentMethod,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: listPaymentMethod.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                  );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                  setState(() {
                                      paymentMethod = newValue!;
                                  });
                                  },
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                  }
                              },
                            ),
                        ],
                    ),
                    ),
                ),
            ),
        );
    }
}