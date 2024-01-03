 import 'package:flutter/foundation.dart';
 import '.dart';

class User extends ChangeNotifier {
  String userName ='meteen';

  void changeUserName(){

    userName='ankit';
    notifyListeners();

  }
  
}