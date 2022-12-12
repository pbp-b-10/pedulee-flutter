import 'package:flutter/material.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/apps/grocery/models/grocery_model.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/widgets/appbar.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert' as convert;



class GroceryDonationPage extends StatefulWidget {
    const GroceryDonationPage({Key? key}) : super(key: key);

    @override
    State<GroceryDonationPage> createState() => _GroceryDonationPageState();
}

class _GroceryDonationPageState extends State<GroceryDonationPage> {
    final _formKey = GlobalKey<FormState>();
    int _donasi = 0;
    int _amount= 0;
    int _ccNumber = 0;

    String? _jenisSembako;
    String? _jenisPayment;
    var _pilihanPayment = ["Mandiri", "BRI", "BNI", "BCA"];
    var _pilihanSembako = ["Beras", "Garam", "Sirup", "Gula", "Kopi", "Minyak","Teh", "Lainnya"];
    List<String> _listJenis = [];
    DateTime tanggal = DateTime.now();
    


    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
            appBar: appBarWidget(),
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
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: 10000",
                            labelText: "Donasi Uang dalam (Rp)",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (value) {
                            setState(() {
                                _donasi = int.parse(value);
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (value) {
                            setState(() {
                                _donasi = int.parse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                          // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Masukkan donasi yang ingin diberikan';
                            }
                            return null;
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(tanggal.toString()),
                      // make tanggal to center
                      trailing: const Icon(Icons.keyboard_arrow_down),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: tanggal,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null && picked != tanggal) {
                          setState(() {
                            tanggal = picked;
                          });
                        }
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Amount",
                            labelText: "Masukkan jumlah",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (value) {
                            setState(() {
                                _amount = int.parse(value);
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (value) {
                            setState(() {
                                _amount = int.parse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                          // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Masukkan jumlah sembako';
                            }
                            return null;
                        },
                      ),
                    ),

                    DropdownButtonFormField(
                      value: _jenisSembako,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const Text("Pilih jenis"),
                      items: _pilihanSembako.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _jenisSembako = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Harap memilih jenis sembako";
                        }

                        return null;
                      },
                    ),

                    DropdownButtonFormField(
                      value: _jenisPayment,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const Text("Pilih jenis"),
                      items: _pilihanPayment.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _jenisPayment = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Harap memilih jenis payment";
                        }

                        return null;
                      },
                    ),

                    TextButton(
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 243, 201, 33)),
                      ),
                      onPressed: () async {
                        await request.postJson(
                          "https://pedulee.up.railway.app/groceries/create",
                          convert.jsonEncode({
                            'donasi': _donasi, 
                            'sembako': _jenisSembako,
                            'amount': _amount,
                            'pmethod': _jenisPayment,
                            'date': tanggal,
                            'ccnumber': _ccNumber
                          })
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GroceryDonationPage()),
                        );
                        
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