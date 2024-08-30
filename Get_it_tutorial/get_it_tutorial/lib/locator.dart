// create a get it locator
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

//create setup method and create our services
void setUp() {
  locator.registerFactory(() => null)
}