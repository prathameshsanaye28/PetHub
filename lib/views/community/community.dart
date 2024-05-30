import 'package:flutter/material.dart';
import 'package:paws_partners_final/views/community/swipable_cards.dart';

//void main() => runApp(const MyApp());

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
            Color.fromRGBO(225, 172, 172, 0.53), //225,172,172
            Color.fromRGBO(202, 135, 135, 0.40), //202,135,135
            Color.fromRGBO(168, 118, 118, 0.20), //168,118,118
            Color.fromRGBO(245, 218, 210, 0.20)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: const SwipeableCards(),
    );
  }
}
