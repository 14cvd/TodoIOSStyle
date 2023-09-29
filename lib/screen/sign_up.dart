import 'package:flutter/cupertino.dart';
import 'package:todoo_app/screen/main_screen.dart';
import 'package:todoo_app/widget/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _MainScreenState();
}

class _MainScreenState extends State<SignUp> {
  late final TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: Text(
              "To Do",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: CustomTextField(
                hintText: "Enter your  name ...",
                controller: textController,
                suffix: const Icon(CupertinoIcons.person),
              )),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          CupertinoButton.filled(
            borderRadius: BorderRadius.circular(20),
            child: const Text("Sign Up"),
            onPressed: () {
              if (textController.text == "hasansabah" ||
                  (textController.text == "idev2606")) {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const MainScreen(),
                    ));
              }
            },
          )
        ],
      ),
    ));
  }
}
