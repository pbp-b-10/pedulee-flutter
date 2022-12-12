import 'package:flutter/material.dart';
import 'package:pedulee/apps/helper/session.dart';
import 'dart:convert' as convert;
import 'package:provider/provider.dart';

import 'package:pedulee/apps/money/models/money_models.dart';
import 'package:pedulee/widgets/footer.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/widgets/appbar.dart';

class MoneyDonationPage extends StatefulWidget {
    const MoneyDonationPage({super.key});

    @override
    State<MoneyDonationPage> createState() => _MoneyDonationPageState();
}

class _MoneyDonationPageState extends State<MoneyDonationPage> {
    final _formKey = GlobalKey<FormState>();
    String fullName = "";
    String email = "";
    int? phoneNumber = 0;
    int? amount = 0;
    String? paymentMethod;
    String message = "";
    int? ccNumber = 0;

    void successToast() {
      // Code here will run if the login succeeded.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const Center(
            child: Text(
              "Thank you for your donation!",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MoneyDonationPage()),
      );
    }

    void errorToast() {
      // Code here will run if the login failed (wrong username/password).
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const Center(
            child: Text(
              "Sorry, something went wrong",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: appBarWidget(),
            // Menambahkan drawer menu
            drawer: drawerBuild(context),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              key: _formKey,
              child: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                      children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            style: TextStyle(
                              fontSize: 30
                            ),
                            'MONEY DONATION',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "cicakbinkadal@cs.ui.ac.id",
                                      labelText: "Email",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          email = value!;
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                      setState(() {
                                          email = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return "Your email can't be empty!";
                                      }
                                      return null;
                                  },
                              ),
                          ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "+6281212341234",
                                    labelText: "Phone Number",
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        phoneNumber = int.tryParse(value!);
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        phoneNumber = int.tryParse(value!);
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return "Your Phone Number can't be empty!";
                                    }
                                    return null;
                                },
                            ),
                          ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "100000",
                                    labelText: "Donation Amount",
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        amount = int.tryParse(value!);
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        amount = int.tryParse(value!);
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return "Donation amount can't be empty!";
                                    }
                                    return null;
                                },
                            ),
                          ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Good messages pls :)",
                                    labelText: "Donation Message",
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        message = value!;
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        message = value!;
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return "Donation message can't be empty!";
                                    }
                                    return null;
                                },
                            ),
                          ),
                          Padding( // https://stackoverflow.com/a/69424783
                            padding: const EdgeInsets.all(8.0),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                contentPadding: const EdgeInsets.all(10),
                              ),
                              child: ButtonTheme(
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                child: DropdownButton<String>(
                                  hint: const Text("Payment Method"),
                                  isExpanded: true,
                                  value: paymentMethod,
                                  elevation: 16,
                                  underline: DropdownButtonHideUnderline(
                                    child: Container(),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      paymentMethod = newValue!;
                                    });
                                  },
                                  items: <String>['Mandiri', 'BNI', 'BRI', 'BCA']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Card Number",
                                    labelText: "Credit Card",
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        ccNumber = int.tryParse(value!);
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        ccNumber = int.tryParse(value!);
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return "Your Credit Card Number can't be empty!";
                                    }
                                    return null;
                                },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // Align(
                          //   alignment: Alignment.bottomCenter,
                          //   child: TextButton(
                          //     style: ButtonStyle(
                          //       backgroundColor: MaterialStateProperty.all(Colors.blue),
                          //     ),
                          //     onPressed: () {
                          //       if (_formKey.currentState!.validate()) {
                          //         ListMoney.data.add(Money(fullName, email, phoneNumber, amount, paymentMethod, ccNumber));
                          //       }
                          //     },
                          //     child: const Text(
                          //       "Submit",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                          FloatingActionButton.extended(
                            label: const Text('Submit'),
                            backgroundColor: Colors.lightBlue,
                            onPressed: () async {
                                //if (_formKey.currentState!.validate()) {
                                  final response = await request.postForm(
                                    "https://pedulee.up.railway.app/money/create",
                                    {
                                      'name': fullName,
                                      'email': email,
                                      'pnumber': phoneNumber.toString(),
                                      'donation': amount.toString(),
                                      'message': message,
                                      'pmethod': paymentMethod,
                                      'ccnumber': ccNumber.toString(),
                                    });

                                  // Credits: Asnat
                                  if (response == 201) {
                                    successToast();
                                  } else {
                                    errorToast();
                                  }
                                //}
                            },
                          ),
                          footerWidget(),
                      ],
                  ),
                  ),
              ),
            ),
        );
    }
}