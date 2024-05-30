import 'package:flutter/material.dart';
import 'package:paws_partners_final/views/community/comm_test.dart';
import 'package:paws_partners_final/views/community/community_screen1.dart';
import 'package:velocity_x/velocity_x.dart';

class SwipeableCards extends StatefulWidget {
  const SwipeableCards({Key? key}) : super(key: key);

  @override
  _SwipeableCardsState createState() => _SwipeableCardsState();
}

class _SwipeableCardsState extends State<SwipeableCards> {
  List<int> cardOrder = [0, 1, 2];

  List<LinearGradient> color = [
    const LinearGradient(
      colors: [
        Color.fromARGB(255, 228, 146, 190),
        Color.fromARGB(255, 158, 102, 127),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color.fromARGB(255, 161, 191, 222),
        Color.fromARGB(209, 132, 136, 217),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color.fromARGB(255, 195, 126, 233),
        Color(0xffad5389),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];

  void changeCardOrder(int sCard, int index) {
    setState(() {
      LinearGradient materialAccentColor = color[index];
      cardOrder.remove(sCard);
      color.remove(color[index]);
      color.insert(0, materialAccentColor);
      cardOrder.insert(0, sCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                color: Color.fromRGBO(255, 208, 208, 0.2),
                width: context.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Community',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 63, 29, 56),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70.0,
              left: 16.0,
              child: const Text(
                'Upcoming Events:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            for (int i = 0; i < cardOrder.length; i++)
              Positioned(
                top: i == 0
                    ? 110.0
                    : i == 1
                        ? 130.0
                        : 150.0,
                left: (context.screenWidth / 2) - 150 + (i * 20),
                child: SCard(
                  color: color[i],
                  index: i,
                  key: ValueKey(cardOrder[i]),
                  value: cardOrder[i],
                  onDragged: () => changeCardOrder(cardOrder[i], i),
                ),
              ),
            Positioned(
              top: 370.0,
              left: 16.0,
              child: const Text(
                'Join Communities:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 420.0,
              left: 24.0,
              width: context.screenWidth * 0.85,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 233, 64, 126),
                      Color(0xFF58174C),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 60, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommunityFeature()));
                        },
                        child: Text(
                          "All Pet Owners",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 500.0,
              left: 24.0,
              width: context.screenWidth * 0.85,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF58174C),
                      Color.fromARGB(255, 233, 64, 126),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 60, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommunityFeature()));
                        },
                        child: Text(
                          "Dog Owners",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 580.0,
              left: 24.0,
              width: context.screenWidth * 0.85,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommunityScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 233, 64, 126),
                        Color(0xFF58174C),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 60, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommunityFeature()));
                          },
                          child: Text(
                            "Cat Owners",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 320,
              top: 750,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(80.0),
                  ),
                  color: Color.fromRGBO(251, 173, 201, 1),
                ),
                child: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'add_community',
                      child: Container(
                        color: Color.fromRGBO(251, 173, 201, 1),
                        child: Text(
                          'Add Community',
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 29, 56),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'add_event',
                      child: Text('Add Event'),
                    ),
                  ],
                  onSelected: (String value) {
                    if (value == 'add_community') {
                      // Handle add community action
                    } else if (value == 'add_event') {
                      // Handle add event action
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SCard extends StatefulWidget {
  final int index;
  final int value;
  final Function onDragged;
  final LinearGradient color;

  const SCard({
    Key? key,
    required this.index,
    required this.onDragged,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  _SCardState createState() => _SCardState();
}

class _SCardState extends State<SCard> with TickerProviderStateMixin {
  Offset _position = const Offset(0, 0);
  double height = 200;
  double width = 300;

  Curve _myCurve = Curves.linear;
  Duration _duration = const Duration(milliseconds: 0);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: _position.dx,
      top: _position.dy,
      duration: _duration,
      curve: _myCurve,
      child: GestureDetector(
        onPanUpdate: (details) {
          if (widget.index == 2) {
            _myCurve = Curves.linear;
            _duration = const Duration(milliseconds: 0);
            if (width >= 100 || height >= 100) {
              width -= 4;
              height -= 1;
            }

            _position += details.delta;
            setState(() {});
          }
        },
        onPanEnd: (details) {
          if (widget.index == 2) {
            _myCurve = Curves.easeIn;
            _duration = const Duration(milliseconds: 300);
            setState(() {
              if (_position.dx <= -(width / 2) || _position.dx >= (width / 2)) {
                widget.onDragged();
                _position = Offset.zero;
              } else {
                _position = Offset.zero;
              }
              width = 300;
              height = 200;
            });
          }
        },
        child: AnimatedContainer(
          width: 300,
          height: 200,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            gradient: widget.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: Text("Item ${widget.value}")),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
