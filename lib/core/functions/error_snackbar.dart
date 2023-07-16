import 'package:flutter/material.dart';

SnackBar buildShowErrorSnackbar(String errorMsg) =>
    SnackBar(content: Text(errorMsg), backgroundColor: Colors.red);
