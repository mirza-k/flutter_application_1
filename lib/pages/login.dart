// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;

  void login(String email, String pass) {
    print("Success login");
    Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formfield,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "BH Fudbal",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Center(
                  child: Image.network(
                    'https://w7.pngwing.com/pngs/150/705/png-transparent-football-player-sport-computer-icons-football-icon-sport-monochrome-sporting-goods.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value!.isEmpty) return "Unesite Vaš email";
                  bool emailValid = RegExp(
                          r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value);
                  if (!emailValid) return "Unesite validan email";
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: passToggle,
                decoration: InputDecoration(
                    labelText: "Password ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffix: InkWell(
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                    )),
                validator: (value) {
                  if (value!.isEmpty) return "Unesite Vaš password";
                  bool passValid = RegExp(
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                      .hasMatch(value);
                  if (!passValid) {
                    return "Password mora sadržavati 8 karaktera, jedno veliko slovo, jedno malo slovo, jedan broj i jedan specijalni znak";
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (_formfield.currentState!.validate()) {
                    login(emailController.text, emailController.text);
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Uloguj se",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nemaš akaunt?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text(
                        "Registruj se",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
