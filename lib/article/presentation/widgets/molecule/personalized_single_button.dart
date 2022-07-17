import 'package:flutter/material.dart';

class PersonalizedSingleButton extends StatelessWidget {
  const PersonalizedSingleButton(
      {Key? key,
      this.color = Colors.green,
      this.text,
      this.icon = Icons.edit_note_outlined,
      required this.ontap})
      : super(key: key);
  final Color color;
  final String? text;
  final IconData icon;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          child: InkWell(
            onTap: () => ontap(),
            child: Ink(
              padding: const EdgeInsets.all(20),
              // margin: const EdgeInsets.all(5),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white, size: 30),
                  if (text != null)
                    Text(
                      text!,
                      style: const TextStyle(color: Colors.white, shadows: [
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
