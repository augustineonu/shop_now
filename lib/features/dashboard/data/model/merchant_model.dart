import 'package:flutter/material.dart';

class Merchant {
  final String name;
  final String logo;
  final bool isActive;
  final Color backgroundColor;

  Merchant({
    required this.name,
    required this.logo,
    this.isActive = true,
    required this.backgroundColor,
  });
}
