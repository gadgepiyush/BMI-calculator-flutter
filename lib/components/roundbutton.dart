
import 'package:flutter/material.dart';

class RoundActionButton extends StatelessWidget {
  final IconData childIcon;
  final Function onPressed;
  const RoundActionButton({@required this.childIcon,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 50,height: 50),
      elevation: 9,
      child: Icon(childIcon),
      splashColor: Colors.white30,
    );
  }
}

