import 'package:flutter/material.dart';
import '../models/restaurant.dart';

// ignore: must_be_immutable
class RestaurantScreen extends StatefulWidget {
  Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
