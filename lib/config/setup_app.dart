import 'package:imperio/config/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;

Future<void> setupApp() async {
  setupLocator();
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());

  // método main assíncrono
  WidgetsFlutterBinding.ensureInitialized();
}
