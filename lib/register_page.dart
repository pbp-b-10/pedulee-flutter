import 'package:flutter/material.dart';
import 'package:pedulee/main.dart';
import 'package:provider/provider.dart';
import 'package:pedulee/apps/helper/session.dart';
import 'package:pedulee/login_page.dart';
import 'dart:convert' as convert;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
  String password2 = "";
  String email = "";
  String firstname = "";
  String lastname = "";
  String phone = "";
  String? birthdate;
  String address = "";
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.fill, //agar rounded corner imagenya
              ),
            ),
            const Align(
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'CREATE ACCOUNT',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Register to create your account',
                        style: TextStyle(fontSize: 26.0),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormField(
                              onChanged: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill in your username";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Create Username',
                                labelText: 'Username',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormField(
                              onChanged: (String? value) {
                                setState(() {
                                  email = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  email = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => value!.isEmpty ||
                                      !value.contains("@") ||
                                      !value.contains('.')
                                  ? "enter a valid email"
                                  : null,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Email',
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormField(
                              obscureText: true,
                              onChanged: (String? value) {
                                setState(() {
                                  password1 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  password1 = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill in your password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Create Password',
                                labelText: 'Create Password',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormField(
                              obscureText: true,
                              onChanged: (String? value) {
                                setState(() {
                                  password2 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  password2 = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill in your password confirmation";
                                } else if (value != password1) {
                                  return "Those passwors didn't match!";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Confirm Password',
                                labelText: 'Confirm Password',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                      SizedBox(width: 10.0),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 105,
                                height: 55,
                                child: TextFormField(
                                  onChanged: (String? value) {
                                    setState(() {
                                      firstname = value!;
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      firstname = value!;
                                    });
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please fill in your first name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'First Name',
                                    labelText: 'First Name',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              SizedBox(
                                width: 105,
                                height: 55,
                                child: TextFormField(
                                  onChanged: (String? value) {
                                    setState(() {
                                      lastname = value!;
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      lastname = value!;
                                    });
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please fill in your last name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Last Name',
                                    labelText: 'Last Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormField(
                              onChanged: (String? value) {
                                setState(() {
                                  phone = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  phone = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill in your phone number";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Phone Number',
                                labelText: 'Phone',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormField(
                              controller: dateController,
                              onTap: () async {
                                //when click we have to show the datepicker
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime(
                                        1700), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime.now());

                                if (pickedDate == null) {
                                  return;
                                } else {
                                  setState(() {
                                    birthdate =
                                        '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                                    dateController.text =
                                        '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                                  });
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill in your birthdate";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'dd/mm/yyyy',
                                labelText: 'Birthdate',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 220,
                            height: 55,
                            child: TextFormField(
                              onChanged: (String? value) {
                                setState(() {
                                  address = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  address = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill in your address";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Address',
                                labelText: 'Address',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 170, 196, 255),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(120, 50),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      final response = await request.postJson(
                          "https://pedulee.up.railway.app/auth/register/",
                          convert.jsonEncode({
                            'username': username,
                            'password': password1,
                            'email': email,
                            'firstname': firstname,
                            'lastname': lastname,
                            'phone': phone,
                            'birthdate': birthdate.toString(),
                            'address': address,
                          }));

                      if (response["status"] == true) {
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const Center(
                              child: Text(
                                "Register success!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ));
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      } else {
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const Center(
                              child: Text(
                                "Register failed!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ));
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.0),
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          ' Sign In',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
