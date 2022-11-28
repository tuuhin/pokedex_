import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/context/providers.dart';

class PokeMonHeader extends StatelessWidget {
  const PokeMonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 8,
                  child: Text(
                    'What Pokemon are you looking for ?',
                    style: TextStyle(
                      fontFamily: 'Avro',
                      fontSize: Theme.of(context).textTheme.headline4?.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => Flexible(
                    child: GestureDetector(
                      onTap: ref.read(themeProvider.notifier).toggleTheme,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: ref.watch(themeProvider.notifier).currentTheme ==
                                ThemeMode.dark
                            ? const Icon(Icons.light)
                            : const Icon(Icons.dark_mode),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              cursorColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.black54
                  : Colors.white60,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search Pokemon'),
            ),
          ],
        ),
      );
}
