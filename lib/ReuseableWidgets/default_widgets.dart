import 'package:flutter/material.dart';

Widget loginSignupButton({
  required Widget ontap,
  required String text,
  required BuildContext context,
}) {
  return SizedBox(
    width: 200,
    height: 50,
    child: OutlinedButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ontap));
      },
      style: ButtonStyle(
          // side: MaterialStateProperty.all(
          //   BorderSide(color: Color.fromARGB(255, 75, 135, 248), width: 3),
          // ),
          elevation: MaterialStateProperty.all(3),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 95, 170, 250)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )),
      child: Text(text),
    ),
  );
}

Widget loginSignupButton2({
  required Function ontap,
  required String text,
  required BuildContext context,
}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: OutlinedButton(
      onPressed: () {
        ontap();
      },
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(3),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          // shadowColor: MaterialStateProperty.all(
          //     const Color.fromARGB(255, 95, 170, 250)),
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(98, 255, 255, 255)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )),
      child: Text(text,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
    ),
  );
}

Container appThemeContainer(BuildContext context, {required Widget child}) {
  var size = MediaQuery.of(context).size;

  return Container(
    height: size.height,
    width: size.width,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF93C5FD), Color(0xFF3B82F6)],
      ),
    ),
    child: child,
  );
}

Widget reusableTextfield(
    {bool ispasswordfield = false,
    TextEditingController? controller,
    String? hinttext,
    String? label,
    IconData? icon}) {
  return TextField(
    controller: controller,
    obscureText: ispasswordfield,
    enableSuggestions: !ispasswordfield,
    autocorrect: !ispasswordfield,
    cursorColor: Colors.white70,
    style: TextStyle(color: Colors.white.withOpacity(0.8)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      prefixIconColor: Colors.white70,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      hintText: hinttext,
      hintStyle: const TextStyle(color: Colors.white38),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: Colors.black26,
    ),
    keyboardType: ispasswordfield
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
