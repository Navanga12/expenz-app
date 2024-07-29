import 'package:expenz/constants/color.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _rememberMe = false;

  //form key for the form validations
  final _formkey = GlobalKey<FormState>();

  //controller for the text from feilds
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                const Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //form
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      //form field for the user name
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          //check weather the user entered a valid user name
                          if (value!.isEmpty) {
                            return "Please Enter Your Name ";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          //check weather the user entered a valid email
                          if (value!.isEmpty) {
                            return "Please Enter Your Email ";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          //check weather the user entered a valid password
                          if (value!.isEmpty) {
                            return "Please Enter Your Valid Password ";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          //check weather the user entered a valid confirm password
                          if (value!.isEmpty) {
                            return "Please Enter Your Same Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          const Text(
                            "Remember  Me for the next time",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kGrey),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _rememberMe = value!;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            //form is valid, process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                            print(
                                "$userName $email $password $confirmPassword");
                          }
                        },
                        child: const CustomButton(
                          buttonName: "Name",
                          buttonColor: kMainColor,
                        ),
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
}
