import 'package:flutter/material.dart';

class AtomButtonLogin extends StatelessWidget {
  const AtomButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            child: Ink(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Iniciar Sesion',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
