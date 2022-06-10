import 'package:flutter/material.dart';
import 'stlesswidget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'suits.dart';

//Desktop Mode/Landscape Layout
class MobileMode extends StatefulWidget {
  const MobileMode({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileMode> createState() => _MobileModeState();
}

class _MobileModeState extends State<MobileMode> {
  int xy = 0;
  int get imagePath => cardList[xy].keys;
  late FlipCardController _controller;
  int _counter = 0;
  int xy1 = 1;
  int get imgpath => cardList[xy1].keys;

  void button1Condition() async {
    setState(() {
      button1 = false;
      button2 = false;
      button3 = true;
    });
  }

  void button2Condition() async {
    setState(() {
      button1 = false;
      button2 = false;
      button3 = true;
    });
  }

  void button3Condition() async {
    setState(() {
      button1 = true;
      button2 = true;
      button3 = false;
    });
  }

  bool button1 = true;
  bool button2 = true;
  bool button3 = false;

  String hold1 = "cocs",
      hold2 = "cocs",
      hold3 = "cocs",
      hold4 = "cocs",
      hold5 = "cocs";

  void pushCard() {
    hold5 = hold4;
    hold4 = hold3;
    hold3 = hold2;
    hold2 = hold1;
    hold1 = cardList[xy1].imgpath;
  }

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mae.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  const Text(
                    'Deck',
                    style: TextStyle(
                      fontFamily: 'ShadowsIntoLight-Regular',
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black,
                            height: 250,
                            width: 175,
                            child: Flipcard(
                              imgpath:
                                  'assets/images/${cardList[xy].imgpath}.png',
                              key: ValueKey<int>(imgpath),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(25)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black,
                            height: 250,
                            width: 175,
                            child: FlipCard(
                              speed: 500,
                              controller: _controller,
                              flipOnTouch: false,
                              front: Image.asset(
                                'assets/images/playing-card-back.jpg',
                                fit: BoxFit.fill,
                              ),
                              back: FlipCardDetails(
                                imagePath:
                                    'assets/images/${cardList[xy1].imgpath}.png',
                                key: ValueKey<int>(imagePath),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Text(
                    'Choose',
                    style: TextStyle(
                      fontFamily: 'ShadowsIntoLight-Regular',
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                    flex: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                        height: 75,
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Opacity(
                              opacity: button1 ? 1.0 : 0.2,
                              child: TextButton(
                                onPressed: () {
                                  if (button1) {
                                    button1Condition();
                                    setState(() {
                                      _controller.state?.controller?.forward();
                                      if (cardList[xy1].number >=
                                          cardList[xy].number) {
                                        _counter++;
                                        if (_counter <= 5) {
                                          pushCard();
                                        }
                                      } else {
                                        _counter = 0;
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Sorry, Your answer is wrong! Please try Again!'),
                                            content: const Text(
                                                'Game Over! Click OK to go back home page'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SecondScreen()));
                                                  clickShuffle();
                                                  store = [];
                                                },
                                                child: const Text('Play Again'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.popUntil(context,
                                                      (route) {
                                                    return route
                                                            .settings.name ==
                                                        "/";
                                                  });
                                                  clickShuffle();
                                                  store = [];
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  "HIGH",
                                  style: TextStyle(
                                    fontFamily: 'ShadowsIntoLight-Regular',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: button2 ? 1.0 : 0.2,
                              child: TextButton(
                                onPressed: () {
                                  if (button2) {
                                    button2Condition();
                                    setState(() {
                                      _controller.state?.controller?.forward();
                                      if (cardList[xy1].number <
                                          cardList[xy].number) {
                                        _counter++;
                                        if (_counter <= 5) {
                                          //store.add(deckList[xy1].imgpath);
                                          pushCard();
                                        }
                                      } else {
                                        _counter = 0;
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Sorry, Your answer is wrong! Please try Again!'),
                                            content: const Text(
                                                'Game Over! Click OK to go back home page'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SecondScreen()));
                                                  clickShuffle();
                                                  store = [];
                                                },
                                                child: const Text('Play Again'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.popUntil(context,
                                                      (route) {
                                                    return route
                                                            .settings.name ==
                                                        "/";
                                                  });
                                                  clickShuffle();
                                                  store = [];
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  "LOW",
                                  style: TextStyle(
                                    fontFamily: 'ShadowsIntoLight-Regular',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: button3 ? 1.0 : 0.2,
                              child: TextButton(
                                onPressed: () {
                                  if (button3) {
                                    button3Condition();
                                    setState(() {
                                      xy++;
                                      xy1++;
                                      _controller.state?.controller?.reset();
                                      if ((_counter == 52)) {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title:
                                                const Text('Congratulations!!!'),
                                            content: const Text(
                                                'You guessed all the cards. Click OK to  go back home page'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SecondScreen()));
                                                  clickShuffle();
                                                  store = [];
                                                },
                                                child: const Text('Play Again'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.popUntil(context,
                                                      (route) {
                                                    return route
                                                            .settings.name ==
                                                        "/";
                                                  });
                                                  clickShuffle();
                                                  store = [];
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  "NEXT",
                                  style: TextStyle(
                                    fontFamily: 'ShadowsIntoLight-Regular',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Text(
                    'Guess Display(5 cards)',
                    style: TextStyle(
                      fontFamily: 'ShadowsIntoLight-Regular',
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black,
                            height: 200,
                            width: 125,
                            child: Image.asset(
                              'assets/images/$hold1.png',
                              height: 220,
                              width: 145,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black,
                            height: 200,
                            width: 125,
                            child: Image.asset(
                              'assets/images/$hold2.png',
                              height: 200,
                              width: 125,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black,
                            height: 200,
                            width: 125,
                            child: Image.asset(
                              'assets/images/$hold3.png',
                              height: 200,
                              width: 125,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black,
                            height: 200,
                            width: 125,
                            child: Image.asset(
                              'assets/images/$hold4.png',
                              height: 200,
                              width: 125,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black,
                            height: 200,
                            width: 125,
                            child: Image.asset(
                              'assets/images/$hold5.png',
                              height: 200,
                              width: 125,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          Text(
                            'Score: $_counter',
                            style: const TextStyle(
                              fontFamily: 'ShadowsIntoLight-Regular',
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                clickShuffle();
                                Navigator.pop(context);
                              });
                            },
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                fontFamily: 'ShadowsIntoLight-Regular',
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}