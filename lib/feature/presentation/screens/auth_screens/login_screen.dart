import 'package:book_app/core/utils/app_constants.dart';
import 'package:book_app/feature/presentation/bloc/bloc.dart';
import 'package:book_app/feature/presentation/screens/screens.dart';
import 'package:book_app/feature/presentation/screens/components.dart';
import 'package:book_app/service_locator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              TextFieldContent(
                obscure: false,
                hintText: 'Email',
                maxLength: 20,
                controller: _emailController,
                prefixIcon: const Icon(Icons.email),
              ),
              TextFieldContent(
                obscure: _showPassword ? false : true,
                hintText: 'Password',
                maxLength: 8,
                controller: _passwordController,
                prefixIcon: const Icon(Icons.security),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye),
                  color: _showPassword ? Colors.pink[200] : kblue,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kbluegreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){
                    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
                      serviceLocator<AuthBloc>().add(AuthLoginEvent(
                          email: _emailController.text, password: _passwordController.text));
                      _passwordController.clear();
                      _emailController.clear();
                    }
                  },
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kdarkblue,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  child: const Text.rich(
                    TextSpan(
                      text: 'Not registered yet? ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: ' Register!',
                          style: TextStyle(
                            fontSize: 17,
                            color: klight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return const RegisterScreen();}));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}