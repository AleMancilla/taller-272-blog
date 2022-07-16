import 'package:flutter/material.dart';

class ButtonMolecule extends StatelessWidget {
  const ButtonMolecule(
      {Key? key,
      required this.text,
      required this.ontap,
      this.icon = Icons.person_outline,
      this.colors = Colors.orange})
      : super(key: key);
  final String text;
  final Function ontap;
  final IconData icon;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          child: InkWell(
            onTap: () => ontap(),
            child: Stack(
              children: [
                Ink(
                  width: 350,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colors,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Container(
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              offset: Offset(-1, -1),
                              blurRadius: 5,
                              color: Colors.black38,
                            ),
                            BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 5,
                              color: Colors.black38,
                            ),
                          ]),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Positioned(
                  right: -50,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(340 / 360),
                    child: Icon(
                      icon,
                      color: Colors.white24,
                      size: 210,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
