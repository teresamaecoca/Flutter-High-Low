import 'package:flutter/material.dart';
import 'dart:core';

class FlipCardDetails extends StatefulWidget {
  final String imagePath;

  const FlipCardDetails({
    required Key key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<FlipCardDetails> createState() => _FlipCardDetailsState();
}

class _FlipCardDetailsState extends State<FlipCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          widget.imagePath,
          key: ValueKey<String>(widget.imagePath),
          height: 250,
          width: 175,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}

class FlipCardDetailsMobile extends StatefulWidget {
  const FlipCardDetailsMobile({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;

  @override
  State<FlipCardDetailsMobile> createState() => _FlipCardDetailsMobileState();
}

class _FlipCardDetailsMobileState extends State<FlipCardDetailsMobile> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagePath,
      key: ValueKey<String>(widget.imagePath),
      height: 160,
      width: 115,
      fit: BoxFit.fill,
    );
  }
}

class FlipCardDetailsLandscape extends StatefulWidget {
  const FlipCardDetailsLandscape({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;

  @override
  _FlipCardDetailsLandscapeState createState() =>
      _FlipCardDetailsLandscapeState();
}

class _FlipCardDetailsLandscapeState extends State<FlipCardDetailsLandscape> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagePath,
      key: ValueKey<String>(widget.imagePath),
      height: 240,
      width: 180,
      fit: BoxFit.fill,
    );
  }
}

class Suits {
  final int keys;
  final String imgpath;
  final int number;

  Suits(this.keys, this.imgpath, this.number);
}

var card1 = Suits(1, 'AS', 1);
var card2 = Suits(2, 'AH', 1);
var card3 = Suits(3, 'AC', 1);
var card4 = Suits(4, 'AD', 1);
var card5 = Suits(5, '2S', 2);
var card6 = Suits(6, '2H', 2);
var card7 = Suits(7, '2C', 2);
var card8 = Suits(8, '2D', 2);
var card9 = Suits(9, '3S', 3);
var card10 = Suits(10, '3H', 3);
var card11 = Suits(11, '3C', 3);
var card12 = Suits(12, '3D', 3);
var card13 = Suits(13, '4S', 4);
var card14 = Suits(14, '4H', 4);
var card15 = Suits(15, '4C', 4);
var card16 = Suits(16, '4D', 4);
var card17 = Suits(17, '5S', 5);
var card18 = Suits(18, '5H', 5);
var card19 = Suits(19, '5C', 5);
var card20 = Suits(20, '5D', 5);
var card21 = Suits(21, '6S', 6);
var card22 = Suits(22, '6H', 6);
var card23 = Suits(23, '6C', 6);
var card24 = Suits(24, '6D', 6);
var card25 = Suits(25, '7S', 7);
var card26 = Suits(26, '7H', 7);
var card27 = Suits(27, '7C', 7);
var card28 = Suits(28, '7D', 7);
var card29 = Suits(29, '8S', 8);
var card30 = Suits(30, '8H', 8);
var card31 = Suits(31, '8C', 8);
var card32 = Suits(32, '8D', 8);
var card33 = Suits(33, '9S', 9);
var card34 = Suits(34, '9H', 9);
var card35 = Suits(35, '9C', 9);
var card36 = Suits(36, '9D', 9);
var card37 = Suits(37, '10S', 10);
var card38 = Suits(38, '10H', 10);
var card39 = Suits(39, '10C', 10);
var card40 = Suits(40, '10D', 10);
var card41 = Suits(41, 'JS', 11);
var card42 = Suits(42, 'JH', 11);
var card43 = Suits(43, 'JC', 11);
var card44 = Suits(44, 'JD', 11);
var card45 = Suits(45, 'QS', 12);
var card46 = Suits(46, 'QH', 12);
var card47 = Suits(47, 'QC', 12);
var card48 = Suits(48, 'QD', 12);
var card49 = Suits(49, 'KS', 13);
var card50 = Suits(50, 'KH', 13);
var card51 = Suits(51, 'KC', 13);
var card52 = Suits(52, 'KD', 13);

void addSuitsP1() {
  cardList = [];
  cardList.add(card1);
  cardList.add(card2);
  cardList.add(card3);
  cardList.add(card4);
  cardList.add(card5);
  cardList.add(card6);
  cardList.add(card7);
  cardList.add(card8);
  cardList.add(card9);
  cardList.add(card10);
  cardList.add(card11);
  cardList.add(card12);
  cardList.add(card13);
  cardList.add(card14);
  cardList.add(card15);
  cardList.add(card16);
  cardList.add(card17);
  cardList.add(card18);
  cardList.add(card19);
  cardList.add(card20);
  cardList.add(card21);
  cardList.add(card22);
  cardList.add(card23);
  cardList.add(card24);
  cardList.add(card25);
  cardList.add(card26);
  cardList.add(card27);
  cardList.add(card28);
  cardList.add(card29);
  cardList.add(card30);
  cardList.add(card31);
  cardList.add(card32);
  cardList.add(card33);
  cardList.add(card34);
  cardList.add(card35);
  cardList.add(card36);
  cardList.add(card37);
  cardList.add(card38);
  cardList.add(card39);
  cardList.add(card40);
  cardList.add(card41);
  cardList.add(card42);
  cardList.add(card43);
  cardList.add(card44);
  cardList.add(card45);
  cardList.add(card46);
  cardList.add(card47);
  cardList.add(card48);
  cardList.add(card49);
  cardList.add(card50);
  cardList.add(card51);
  cardList.add(card52);
}

var cardList = <Suits>[];

void cardListShuffleP1() {
  cardList.shuffle();
}

void clickShuffle() {
  cardList = [];
  addSuitsP1();
  cardListShuffleP1();
}

List<dynamic> store = [];