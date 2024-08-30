import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hoverColor: Colors.black,
                  labelText: "Email",
                  suffixIcon: Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                ),
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                  hoverColor: Colors.black,
                  labelText: "Password",
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: address,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hoverColor: Colors.black,
                    labelText: "Address",
                    // hintText: "Address",
                    helperText: "Please insert real address!",
                    helperStyle: TextStyle(color: Colors.purple)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Country",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     TextFormField(),
              //     TextFormField()
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Save Data")),
              const SizedBox(
                height: 30,
              ),
              Text(
                  "This is your data..${email.text}..\n${password.text}..\n${address.text}"),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(color: Colors.amber,height: 100,child: Text("Welcome"),),
                  Container(color: Colors.amber,height: 100,child: Text("Home"),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
