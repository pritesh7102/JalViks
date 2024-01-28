import "package:flutter/material.dart";
import "package:jalviks/services/auth.dart";
import "package:jalviks/shared/constants.dart";
import "package:jalviks/shared/loading.dart";

class SignIn extends StatefulWidget {
  // const SignIn({super.key, required void Function() toggleView});

  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
        title: const Text('Sign In to JalViks'),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person, color: Colors.black,),
            label: const Text('Register', style: TextStyle(color: Colors.black)),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecorator.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecorator.copyWith(
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _togglevisibility();
                                    },
                                    child: Icon(
                                      _showPassword ? Icons.visibility : Icons
                                          .visibility_off, color: Colors.black,),
                                  )
                                ),
                obscureText: !_showPassword,
                validator: (val) => val!.length < 6
                    ? 'Enter an Password with atleast 6 characters'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.sighInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Wrong Credentials';
                          loading = false;
                        });
                      }
                    }
                  },
                  child: const Text(
                    'Sign in',
                  )),
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ]),
          )),
    );
  }
}
