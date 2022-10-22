import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_pokedex/core/context/providers.dart';

import 'package:flutter_pokedex/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'package:logging/logging.dart';

import './router.dart';

final logger = Logger('AppLogger');

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // if (isDesktop) {
  //   await flutter_acrylic.Window.initialize();
  //   await flutter_acrylic.Window.setEffect(
  //       effect: flutter_acrylic.WindowEffect.acrylic);
  //   await WindowManager.instance.ensureInitialized();
  //   windowManager.waitUntilReadyToShow().then((_) async {
  //     await windowManager.setTitleBarStyle(TitleBarStyle.normal,
  //         windowButtonVisibility: false);
  //     await windowManager.setSize(const Size(400, 600));
  //     await windowManager.setMinimumSize(const Size(400, 600));
  //     await windowManager.center();
  //     await windowManager.show();
  //     await windowManager.setPreventClose(false);
  //     await windowManager.setSkipTaskbar(false);
  //   });
  // }

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) =>
      debugPrint('${record.level.name}: ${record.time}: ${record.message}'));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        title: 'Flutter Pokdex App',
        debugShowCheckedModeBanner: false,
        themeMode: ref.watch(themeProvider),
        theme: lightTheme,
        darkTheme: darkTheme,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}
