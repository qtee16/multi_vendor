import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor/controllers/auth_controller.dart';
import 'package:multi_vendor/widgets/custom_snack_bar.dart';
import 'package:multi_vendor/views/auth/customer_login_screen.dart';
import 'package:multi_vendor/views/home/customer_home_screen.dart';

class LandingCustomer extends StatefulWidget {
  const LandingCustomer({Key? key}) : super(key: key);

  @override
  State<LandingCustomer> createState() => _LandingCustomerState();
}

class _LandingCustomerState extends State<LandingCustomer> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController();

  bool _isLoading = false;
  bool _visiblePassword = true;
  final _formKey = GlobalKey<FormState>();

  Uint8List? _image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Create Customer's Account",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.cyan,
                        )),
                  ],
                ),
                Row(
                  children: [
                    (_image != null) 
                    ? CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 60,
                      backgroundImage: MemoryImage(_image!),
                    )
                    : const CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 60,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              )),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () async {
                              await pickImageFromCamera();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: IconButton(
                            icon: const Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () async {
                              await pickImageFromGallery();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          label: const Text("Full name"),
                          hintText: "Enter your full name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: _visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: _visiblePassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _visiblePassword = !_visiblePassword;
                              });
                            },
                          ),
                          label: const Text("Password"),
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: () async {
                          signUp();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width - 20, 50),
                        ),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account ?',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CustomerLogin(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Create a seller's account ?",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      final res = await _authController.signUpUser(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _image,
      );
      // ignore: use_build_context_synchronously
      showMySnackBar(context, res);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const CustomerHome()), (route) => false);
    }
    setState(() {
      _isLoading = false;
    });
  }

  pickImageFromGallery() async {
    Uint8List? _img = await _authController.pickImage(ImageSource.gallery);
    if (_img != null) {
      setState(() {
        _image = _img;
      });
    } else {
      // ignore: use_build_context_synchronously
      showMySnackBar(context, 'No image selected');
    }
  }

  pickImageFromCamera() async {
    Uint8List? _img = await _authController.pickImage(ImageSource.camera);
    if (_img != null) {
      setState(() {
        _image = _img;
      });
    } else {
      // ignore: use_build_context_synchronously
      showMySnackBar(context, 'No image selected');
    }
  }
}
